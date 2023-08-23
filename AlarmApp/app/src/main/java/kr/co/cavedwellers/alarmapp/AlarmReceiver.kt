package kr.co.cavedwellers.alarmapp

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.b3lon9.nlog.NLog

class AlarmReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        NLog.i("onReceive...!!! intent:$intent")
    }
}