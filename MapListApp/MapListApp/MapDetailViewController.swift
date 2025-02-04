import UIKit
import MapKit

class MapDetailViewController: UIViewController {

    var selectedLocation: (String, CLLocationCoordinate2D)?
    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupMapView()
        if let location = selectedLocation {
            centerMapOnLocation(location)
        }
    }

    // Setup the map view
    private func setupMapView() {
        mapView.frame = view.bounds
        view.addSubview(mapView)
    }

    // Center the map on the selected location and add a marker
    private func centerMapOnLocation(_ location: (String, CLLocationCoordinate2D)) {
        let region = MKCoordinateRegion(center: location.1, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
        
        // Add marker
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.1
        annotation.title = location.0
        mapView.addAnnotation(annotation)
    }
}

