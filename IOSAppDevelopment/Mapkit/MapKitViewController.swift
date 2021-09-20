//
//  MapKitViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 10/09/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//
import UIKit
import CoreLocation
import MapKit
let delimitter = ", "

class MapKitViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView : MKMapView!
    var locationManager  = CLLocationManager()
    var currentLocation : CLLocation? = nil
    var gecoder = CLGeocoder()
    var address : String = "Default Addrress"
    var placemark = CLPlacemark()
    var showPlaceMark : (CLPlacemark?) -> String = {(placemark) in print("current location description " + String(placemark!.postalAddress!.description) )
        let address = placemark!.postalAddress!
        return address.street + delimitter + address.subLocality + delimitter + address.city + delimitter + address.subAdministrativeArea + delimitter + address.state + delimitter + address.postalCode + delimitter + address.country
    }
    var showCoordinates : (CLLocationCoordinate2D, NSError?) -> Void = {
        (locationCoordinate , error) in
        if error == nil {
            print("location ordinates \(locationCoordinate.latitude) " +  "\(locationCoordinate.longitude)")
        }
    }
    private var allAnnotations: [MKAnnotation]?

    private var displayedAnnotations: [MKAnnotation]? {
        willSet {
            if let currentAnnotations = displayedAnnotations {
                mapView.removeAnnotations(currentAnnotations)
            }
        }
        didSet {
            if let newAnnotations = displayedAnnotations {
                mapView.addAnnotations(newAnnotations)
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerMapAnnotationViews()
        mapView.delegate = self
        mapView.showsUserLocation = true
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        locationManager.distanceFilter = 500; // meters

        print("lcoation service enabled \(CLLocationManager.locationServicesEnabled())")
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.startUpdatingLocation()
        centerMapOnPolygone()
        addpolygonOverlayCoversCoordinates()

        
        // Do any additional setup after loading the view.
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("annotatioview on didSelect Event")
        let currentLocationAnnnoation = CustomAnnotation(coordinate: CLLocationCoordinate2D(latitude: self.currentLocation!.coordinate.latitude, longitude: self.currentLocation!.coordinate.longitude))
        currentLocationAnnnoation.title = NSLocalizedString("My Home", comment: "MY Home  annotation")
        currentLocationAnnnoation.image = UIImage(systemName: "homekit")
        // Create the array of annotations and the specific annotations for the points of interest.
//        self.allAnnotations = [currentLocationAnnnoation]
//        displayedAnnotations = allAnnotations
//
//        displayCurrentLocationAnnotation(CustomAnnotation.self)

    }
    private func displayCurrentLocationAnnotation(_ annotationType: AnyClass) {
        let annotation = allAnnotations?.first { (annotation) -> Bool in
            return annotation.isKind(of: annotationType)
        }
        
        if let oneAnnotation = annotation {
            displayedAnnotations = [oneAnnotation]
        } else {
            displayedAnnotations = []
        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView: MKAnnotationView?

        if let annotation = annotation as? CustomAnnotation {
            annotationView = setupCustomAnnotationView(for: annotation, on: mapView)
        }
        return annotationView
    }
    private func setupCustomAnnotationView(for annotation: CustomAnnotation, on mapView: MKMapView) -> MKAnnotationView {
        return mapView.dequeueReusableAnnotationView(withIdentifier: NSStringFromClass(CustomAnnotation.self), for: annotation)
    }
    //[MKCoreLocationProvider] CLLocationManager(<CLLocationManager: 0x600003530910>) for <MKCoreLocationProvider: 0x600000520000> did fail with error: Error Domain=kCLErrorDomain Code=0 "(null)"
        // simulator - features actiave location - not to be set - none
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("location updated")
        lookUpCurrentLocation(completionHandler: showPlaceMark)
        self.getCoordinate(addressString: address, completionHandler: self.showCoordinates)
        centerMapOnCurrentLocation(curentLocation: userLocation)

       // locationManager.stopUpdatingLocation()
    }
    private func centerMapOnCurrentLocation(curentLocation :MKUserLocation ) {
        let span = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
        let center = CLLocationCoordinate2D(latitude: curentLocation.coordinate.latitude, longitude: curentLocation.coordinate.longitude)
        self.mapView.setRegion(MKCoordinateRegion(center: center, span: span), animated: true)
    }
    private func centerMapOnPolygone() {
        let span = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
        let center = CLLocationCoordinate2D(latitude: 36.99892, longitude: -109.045267)
        self.mapView.setRegion(MKCoordinateRegion(center: center, span: span), animated: true)
    }
    func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?)
                    -> String ) {
        // Use the last reported location.
        if let lastLocation = self.locationManager.location {
            let geocoder = CLGeocoder()
            self.currentLocation = lastLocation
            addpolygonOverlayCoversCoordinates()

            // Look up the location and pass it to the completion handler
            geocoder.reverseGeocodeLocation(lastLocation,
                        completionHandler: { (placemarks, error) in
                if error == nil {
                    let firstLocation = placemarks?[0]
                    self.address = completionHandler(firstLocation)
                    
                }
                else {
                 // An error occurred during geocoding.
                    completionHandler(nil)
                }
            })
        }
        else {
            // No location was available.
            completionHandler(nil)
        }
    }
    
    func getCoordinate( addressString : String,
            completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                        
                    completionHandler(location.coordinate, nil)
                    return
                }
            }
                
            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func registerMapAnnotationViews() {
        
        self.mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(CustomAnnotation.self))
      
    }

}
extension MapKitViewController {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
         print("render for overlay")
        if overlay.isKind(of: MKPolygon.self) {
            print("render for kind of polygon")

         let mkPolygonRender =   MKPolygonRenderer(overlay: overlay as! MKPolygon)
            print( String(mkPolygonRender.polygon.boundingMapRect.height) + " " + String( mkPolygonRender.polygon.boundingMapRect.width))
            mkPolygonRender.fillColor = UIColor.cyan.withAlphaComponent(0.2)
            mkPolygonRender.strokeColor = UIColor.cyan.withAlphaComponent(0.7)
            mkPolygonRender.lineWidth = 10
            return mkPolygonRender
        }
        return MKPolylineRenderer()
    }
    
    func  addpolygonOverlayCoversCoordinates() {
        var points : [CLLocationCoordinate2D] =  Array.init(repeating: CLLocationCoordinate2D(), count: 4)
//        points[0] = CLLocationCoordinate2DMake(12.968714465917444, 77.69619877648108);
//            points[1] = CLLocationCoordinate2DMake(12.96871, 77.70125);
//            points[2] = CLLocationCoordinate2DMake(12.970194375313401, 77.70046337826653);
//        points[3] = CLLocationCoordinate2DMake(self.currentLocation!.coordinate.latitude, self.currentLocation!.coordinate.longitude);
                points[0] = CLLocationCoordinate2DMake(41.000512, -109.050116);
                    points[1] = CLLocationCoordinate2DMake(41.002371, -102.052066);
                    points[2] = CLLocationCoordinate2DMake(36.993076, -102.041981);
                points[3] = CLLocationCoordinate2DMake(36.99892, -109.045267);
       let poly = MKPolygon(coordinates: points, count: 4)
        poly.title = "Around My Home"
        
        self.mapView.addOverlay(poly, level: .aboveLabels)
        
    }
}
