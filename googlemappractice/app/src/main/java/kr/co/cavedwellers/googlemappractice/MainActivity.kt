package kr.co.cavedwellers.googlemappractice

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.MapView
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.SupportMapFragment
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions

class MainActivity : AppCompatActivity(), OnMapReadyCallback {
    private lateinit var mapView:MapView
    private lateinit var googleMap:GoogleMap
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //mapView = this.findViewById(R.id.map_view)
        // mapView.getMapAsync(this)
        val mapFragment = supportFragmentManager.findFragmentById(R.id.map) as SupportMapFragment
        mapFragment.getMapAsync(this)
    }

    override fun onMapReady(gm: GoogleMap) {
        println("onMapReady...############### ")
        val seoul = LatLng(37.554891, 126.970814)

        val markerOptions = MarkerOptions()
        markerOptions.apply {
            position(seoul)
            title("seoul")
            snippet("korea center")
        }

        gm.addMarker(markerOptions)
        gm.moveCamera(CameraUpdateFactory.newLatLngZoom(seoul, 10F))

        /*googleMap.mapType = GoogleMap.MAP_TYPE_NORMAL   // default normal

        googleMap = gm
        googleMap.apply {
            moveCamera(CameraUpdateFactory.newLatLngZoom(seoul, 15F))   // move camera

        }*/
    }
}