//
//  PeopleLoacationViewController.swift
//  DirectoryApp
//
//  Created by Oladipupo Oluwatobi on 11/07/2021.
//

import UIKit
import GoogleMaps

class PeopleLoacationViewController: BaseViewController, CLLocationManagerDelegate, GMSMapViewDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    let locationManager =  CLLocationManager()
    var requestData: Location?
    fileprivate var alert: CustomAlert?
    let marker = GMSMarker()
    override func getViewModel() -> BaseViewModel {
        return  BaseViewModel()
    }
    override var presentRequestData: Any?{
        didSet {
            requestData = presentRequestData as? Location
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.isMyLocationEnabled = true
              mapView.delegate = self

              //Location Manager code to fetch current location
              self.locationManager.delegate = self
              self.locationManager.startUpdatingLocation()
    }
    
    //Location Manager delegates
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if  let location = requestData {

         let camera = GMSCameraPosition.camera(withLatitude: (location.latitude)!, longitude:(location.longitude)!, zoom:14)
         mapView.animate(to: camera)
        
            marker.position = CLLocationCoordinate2DMake((location.latitude)!,(location.longitude)!)
           marker.map = mapView
     }
         //Finally stop updating location otherwise it will come again and again in this delegate
         self.locationManager.stopUpdatingLocation()

     }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        alert?.showAlert(text: error.localizedDescription, type: AlertType.error)
        
    }

}
