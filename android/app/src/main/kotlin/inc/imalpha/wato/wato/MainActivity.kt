package inc.imalpha.wato.wato

import io.flutter.embedding.android.FlutterActivity

import android.content.ActivityNotFoundException
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import androidx.annotation.NonNull
import androidx.core.content.ContextCompat
//import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


const val WHATSAPP_PACKAGE = "com.whatsapp"
const val WHATSAPP_B_PACKAGE = "com.whatsapp.w4b"

class MainActivity : FlutterActivity() {
    private val WA_METHOD_CHANNEL_NAME = "whats-app-channel"


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            WA_METHOD_CHANNEL_NAME
        ).setMethodCallHandler { call, result ->
            if (call.method == "to_whats") {
                val pack: Number? = call.argument<Number>("package")
                val mobileNo: String? = call.argument<String>("phone")
                val message: String? = call.argument<String>("message")
                val link: String? = call.argument<String>("link")
                towardWhatsApp(result, this, pack!!, message!!, mobileNo!!, link!!)
            } else if (call.method == "is_whatsb") {
                val pm: PackageManager = context.packageManager
                val isInstalled = isPackageInstalled(WHATSAPP_B_PACKAGE, pm)
                result.success(isInstalled)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun towardWhatsApp(
        sendResult: MethodChannel.Result,
        context: Context,
        packageName: Number,
        message: String,
        phoneNumber: String,
        link: String
    ) {
        val pm: PackageManager = context.packageManager
        lateinit var sendIntent: Intent
        val uri =
            Uri.parse("https://api.whatsapp.com/send?phone=$phoneNumber&text=$message\n$link")
        if (packageName == 0) {
            val isInstalled = isPackageInstalled(WHATSAPP_PACKAGE, pm)
            if (isInstalled) {
                sendIntent = Intent(Intent.ACTION_VIEW, uri)
                sendIntent.setPackage(WHATSAPP_PACKAGE)
                sendResult.success(true)
            } else {
                //TODO: Go TO PLAY Store For WhatsApp
                openPlayStore(context, WHATSAPP_PACKAGE)
            }
        } else {
            val isInstalled = isPackageInstalled(WHATSAPP_B_PACKAGE, pm)
            if (isInstalled) {
                sendIntent = Intent(Intent.ACTION_VIEW, uri)
                sendIntent.setPackage(WHATSAPP_B_PACKAGE)
                sendResult.success(true)
            } else {
                //TODO: Go TO PLAY Store For WhatsApp Business
                openPlayStore(context, WHATSAPP_B_PACKAGE)
            }
        }
        try {
            ContextCompat.startActivity(context, sendIntent, null)
            sendResult.success(true)
        } catch (ex: ActivityNotFoundException) {
            sendResult.error(
                "FLUTTER_ERROR_RESULT",
                ex.message,
                ex
            )
        }
    }

    private fun isPackageInstalled(packageName: String, packageManager: PackageManager): Boolean {
        return try {
            packageManager.getPackageInfo(packageName, 0)
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }

    private fun openPlayStore(context: Context, appPackageName: String) {
        val storeitent = Intent(Intent.ACTION_VIEW)
        storeitent.data =
            Uri.parse("https://play.google.com/store/apps/details?id=$appPackageName")
        context.startActivity(storeitent)
    }

    override fun onDestroy() {
        tearDownChannel()
        super.onDestroy()
    }

    private fun tearDownChannel() {

    }

}
