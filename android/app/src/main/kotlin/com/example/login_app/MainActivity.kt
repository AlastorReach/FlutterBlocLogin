package com.example.login_app

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import android.content.pm.ActivityInfo


class MainActivity: FlutterActivity(){
     override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
     }
    
}
