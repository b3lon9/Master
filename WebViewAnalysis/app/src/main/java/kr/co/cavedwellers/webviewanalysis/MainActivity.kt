package kr.co.cavedwellers.webviewanalysis

import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kr.co.cavedwellers.webviewanalysis.databinding.ActivityMainBinding
import android.util.Base64

class MainActivity : AppCompatActivity() {
    private lateinit var binding:ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)

        setContentView(binding.root)

        // android guide line
        // load webview
        // val caveUrl = "https://portfolio.cavedwellers.co.kr/"
        val unencodeHtml = "<html><body>'%23' is the percent code for '#' </body></html>"
        val encodeHtml = Base64.encodeToString(unencodeHtml.toByteArray(), Base64.NO_PADDING)
        binding.webLayout.loadUrl(encodeHtml)
    }
}