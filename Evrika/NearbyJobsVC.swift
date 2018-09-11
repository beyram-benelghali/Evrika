//
//  NearbyJobsVC.swift
//  Evrika
//
//  Created by Ghali Beyram on 9/10/18.
//  Copyright © 2018 Talent Center. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NearbyJobsVC: UIViewController ,CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var jobMaps: MKMapView!
    var locationManager = CLLocationManager()
    var userLocation:CLLocation?
    var lat : Double?
    var lng : Double?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jobMaps.delegate = self
        /*
         self.view.bounds.size.height = UIScreen.main.bounds.size.height * 0.6
         self.view.bounds.size.width = UIScreen.main.bounds.size.width * 0.8*/
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        determineMyCurrentLocation()
        showJobPosition(Lat: 44.179249, Long: 28.649940)
        showJobPosition(Lat: 46.770439, Long: 23.591423)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations[0] as CLLocation
        print("user latitude = \(String(describing: userLocation?.coordinate.latitude))")
        print("user longitude = \(String(describing: userLocation?.coordinate.longitude))")
        lat = Double((userLocation?.coordinate.latitude)!)
        lng = Double((userLocation?.coordinate.longitude)!)
        jobMaps.showsUserLocation = true
        let coordinates = CLLocationCoordinate2D(latitude: lat!, longitude: lng!)
        let circle : MKCircle = MKCircle(center: coordinates, radius: 50000)
        self.jobMaps.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)), animated: true)
        self.jobMaps.add(circle)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView)
    {
        if let annotationTitle = view.annotation?.title
        {
            print("Job title: \(annotationTitle!)")
        }
    }
    
    
    func showJobPosition(Lat:Double,Long:Double) {
        if(Lat != lat && Long != lng) {
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(Lat, Long)
            let annotation = MKPointAnnotation()
            annotation.title = "Talent Center International"
            annotation.coordinate = location
            jobMaps.addAnnotation(annotation)
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
