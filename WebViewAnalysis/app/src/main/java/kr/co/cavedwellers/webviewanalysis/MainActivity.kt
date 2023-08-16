package kr.co.cavedwellers.webviewanalysis

import android.content.Context
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kr.co.cavedwellers.webviewanalysis.databinding.ActivityMainBinding
import android.util.Base64
import android.webkit.JavascriptInterface
import android.widget.Toast

class MainActivity : AppCompatActivity() {
    private lateinit var binding:ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)

        setContentView(binding.root)

        // android guide line
        // load webview
        val caveUrl = "https://portfolio.cavedwellers.co.kr/"
        // val unencodeHtml = "<html><body>'%23' is the percent code for '#' </body></html>"
        // val encodeHtml = Base64.encodeToString(unencodeHtml.toByteArray(), Base64.NO_PADDING)

        // val assetUrl = "assets/index.html"
        val assetUrl = "file:///android_asset/index.html"
        val assetUrl2 = "file:///android_asset/exam.html"



        // javascript active
        binding.webLayout.apply {
            settings.javaScriptEnabled = true

            addJavascriptInterface(WebAppInterface(context), "Hororo")
        }


        binding.webLayout.loadUrl(assetUrl2)
        binding.sendButton.setOnClickListener {
            binding.webLayout.loadUrl("javascript:exam_script.plus_num(\"${binding.editText.text}\")")
        }

    }

    private inner class WebAppInterface(val context:Context) {
        // show toast from the web page
        @JavascriptInterface
        fun showToast(toast:String) {
            Toast.makeText(context, "Web King...!!!$toast", Toast.LENGTH_SHORT).show()
        }

        @JavascriptInterface
        fun getDoubleNum(result:Int) {
            binding.topBar.text = result.toString() + "horarararara"
        }
    }
}