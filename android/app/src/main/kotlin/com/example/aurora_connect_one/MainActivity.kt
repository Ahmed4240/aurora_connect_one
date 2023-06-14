package com.example.aurora_connect_one

import android.content.Context
import android.content.Intent
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.PackageManager.NameNotFoundException
import android.net.Uri
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.UnsupportedEncodingException
import java.net.URLEncoder
import kotlin.random.Random


open class MainActivity : FlutterActivity() {
    companion object {
        //        const val vippsPackageName = "no.dnb.vipps"
        const val vippsPackageName = "no.dnb.vipps.mt"
        const val vippsRequestCode: Int = 123
        const val REQUEST_CODE: Int = 123

        const val APP_ID = "550ff5b1-35df-4b99-beff-a6b2bb1a6bbc";
        const val MERCHANT_SERIAL_NO = "123456";
        const val VIPPS_PACKAGE = "no.dnb.vipps";
    }

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "example.com/channel")
            .setMethodCallHandler { call, result ->
            if (call.method == "openVippsApp") {
                val rand = Random.nextInt(100)
                result.success(rand)
//                openVippsApp("vippsMT://?token=eyJraWQiOiJqd3RrZXkiLCJhbGciOiJSUzI1NiJ9.ey <snip>", result)
                launchVipps(this, 120.0, 123123123, this)
//                initiateVippsLogin(this)
            } else if (call.method == "checkESIMCapability") {
                print("checkESIMCapability is invoke from flutter")
//                if (ESIMUtil.isESIMSupported(this as Context)) {
//                    print("the device has capability of Esim.")
//                    eventChannelHandler.onReportGameClicked(applicationContext, "yes")
//                }else{
//                    print("the device has not capability of Esim.")
//                    eventChannelHandler.onReportGameClicked(applicationContext, "no")
//                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun openVippsApp(deeplinkUrl: String, result: Any) {
        try {
//            val pm = applicationContext.packageManager
//            val packageInfo = pm.getPackageInfo(vippsPackageName, PackageManager.GET_ACTIVITIES)
//            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(deeplinkUrl))
//            startActivityForResult(intent, vippsRequestCode)

//            val pm1: PackageManager = applicationContext.getPackageManager()
//            val launchIntent: Intent? = pm1.getLaunchIntentForPackage(vippsPackageName)
//            launchIntent?.flags = Intent.FLAG_ACTIVITY_NEW_TASK
//            launchIntent?.flags = Intent.FLAG_ACTIVITY_SINGLE_TOP
//            startActivity(launchIntent)
        } catch (e: PackageManager.NameNotFoundException) {
            // No Vipps app installed! Open the Vipps page on Google Play
//            val playStoreUrl = "https://play.google.com/store/apps/details?id=$vippsPackageName"
//            val intent = Intent(Intent.ACTION_VIEW).setData(Uri.parse(playStoreUrl))
//            startActivity(intent)
        }
    }

    open fun launchVipps(
        context: MainActivity,
        amount: Double,
        orderId: Int,
        activity: MainActivity
    ) {
        try {
//            if (BuildConfig.DEBUG) {
            val uri = ("vippsmt://?action=inAppReserve&appID=" + APP_ID +
                    "&amount=" + amount.toInt() * 100 +
                    "&merchantSerialNumber=" + MERCHANT_SERIAL_NO).toString() +
                    "&message=Christiania%20Taxi&data=&orderID=" + orderId +
                    "&fallbackURL=vipps_payment://?action=confirmed"
//            val uri = "vippsmt://login?redirect_uri=vipps_payment&scopes=openid"

            val encodedURL = URLEncoder.encode(uri, "UTF-8")
            val intent = Intent(Intent.ACTION_VIEW)
            intent.data = Uri.parse(uri)
            startActivity(intent)

        } catch (e: NameNotFoundException) {
            // No Vipps app! Open play store page.
//            CommonUtil.showInfoDialog(activity, "", activity.getString(R.string.install_vipps))
            //            String url = " https://play.google.com/store/apps/details?id=no.dnb.vipps";
//            Intent storeIntent = new Intent(Intent.ACTION_VIEW);
//            storeIntent.setData(Uri.parse(url));
//            context.startActivity(storeIntent);
        } catch (e: UnsupportedEncodingException) {
            e.printStackTrace()
        }
    }

    val vippsDeepLinkUrl =
        "vipps://login?client_id=<YOUR_CLIENT_ID>&redirect_uri=<YOUR_REDIRECT_URI>&scopes=<REQUESTED_SCOPES>"

    fun isVippsAppInstalled(context: Context): Boolean {
        val packageName = "no.dnb.vipps"
        val pm = context.packageManager
        val packageInfo: PackageInfo?
        try {
            packageInfo = pm.getPackageInfo(packageName, PackageManager.GET_ACTIVITIES)
        } catch (e: PackageManager.NameNotFoundException) {
            return false
        }
        return packageInfo != null
    }

    fun initiateVippsLogin(context: MainActivity) {
        val vippsDeepLinkUrl =
            "vipps://login?client_id=<YOUR_CLIENT_ID>&redirect_uri=vipps_payment&scopes=<REQUESTED_SCOPES>"

        val intent = Intent(Intent.ACTION_VIEW)
        intent.data = Uri.parse(vippsDeepLinkUrl)

//        if (intent.resolveActivity(applicationContext.packageManager) != null) {
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        startActivity(intent)
//        } else {
//            // Vipps app is not installed
//        }
    }

    /* @Override
     fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent) {
         super.onActivityResult(requestCode, resultCode, data)
         if (requestCode == REQUEST_CODE) {
             if (resultCode == RESULT_OK) {
                 // Handle the result and send it back to Flutter
                 print("onActivityResult"+data.extras)
             } else {
                 // Handle other result codes or errors
                 print("onActivityResult else "+data.extras)
             }
         }
     }*/
}
