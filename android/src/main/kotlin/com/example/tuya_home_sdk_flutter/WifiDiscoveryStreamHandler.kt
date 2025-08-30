package com.example.tuya_home_sdk_flutter

import android.content.Context
import io.flutter.plugin.common.EventChannel
import com.tuya.smart.sdk.bean.ThingSmartDeviceModel
import com.tuya.smart.sdk.api.ITuyaSmartDevice
import com.tuya.smart.sdk.TuyaHomeSdk

class WifiDiscoveryStreamHandler : EventChannel.StreamHandler {
    private var eventSink: EventChannel.EventSink? = null
    private var activator: IThingSmartActivator? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events

        val args = arguments as? Map<*, *>
        val ssid = args?.get("ssid") as? String ?: ""
        val password = args?.get("password") as? String ?: ""
        val token = args?.get("token") as? String ?: ""
        val timeout = (args?.get("timeout") as? Int) ?: 100

        val builder = ActivatorBuilder()
            .setContext(AppGlobals.getApplication()) // or mContext if passed in
            .setSsid(ssid)
            .setPassword(password)
            .setToken(token)
            .setTimeOut(timeout)
            .setActivatorModel(ActivatorModelEnum.TY_EZ)
            .setListener(object : IThingSmartActivatorListener {
                override fun onError(errorCode: String, errorMsg: String) {
                    eventSink?.error(errorCode, errorMsg, null)
                }

                override fun onActiveSuccess(devResp: DeviceBean?) {
                    if (devResp != null) {
                        val device = mapOf(
                            "devId" to devResp.devId,
                            "name" to devResp.name,
                            "iconUrl" to devResp.iconUrl,
                            "productId" to devResp.productId,
                            "isOnline" to devResp.isOnline
                        )
                        eventSink?.success(device)
                    }
                }

                override fun onStep(step: String, data: Any) {
                    eventSink?.success(
                        mapOf("type" to "step", "step" to step, "data" to data.toString())
                    )
                }
            })

        activator = ThingHomeSdk.getActivatorInstance().newMultiActivator(builder)
        activator?.start()
    }

    override fun onCancel(arguments: Any?) {
        activator?.stop()
        activator?.onDestroy()
        activator = null
        eventSink = null
    }
}
