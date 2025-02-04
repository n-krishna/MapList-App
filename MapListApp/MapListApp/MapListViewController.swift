import UIKit
import MapKit

class MapListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()
    
    // Default data for landmarks
    var locations = [
        ("Eiffel Tower", CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945)),
        ("Statue of Liberty", CLLocationCoordinate2D(latitude: 40.6892, longitude: -74.0445)),
        ("Great Wall of China", CLLocationCoordinate2D(latitude: 40.4319, longitude: 116.5704)),
        ("Sydney Opera House", CLLocationCoordinate2D(latitude: -33.8568, longitude: 151.2153)),
        ("Christ the Redeemer", CLLocationCoordinate2D(latitude: -22.9519, longitude: -43.2105)),
        ("Colosseum", CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922)),
        ("Machu Picchu", CLLocationCoordinate2D(latitude: -13.1631, longitude: -72.5450))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup navigation bar
        self.title = "Map List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewLocation))
        
        // Setup table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    // Add new location (Taj Mahal) on '+' button tap
    @objc private func addNewLocation() {
        let newLocation = ("Taj Mahal", CLLocationCoordinate2D(latitude: 27.1751, longitude: 78.0421))
        locations.append(newLocation)
        tableView.reloadData()
    }

    // UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let location = locations[indexPath.row]
        cell.textLabel?.text = location.0
        cell.detailTextLabel?.text = "Latitude: \(location.1.latitude), Longitude: \(location.1.longitude)"
        cell.imageView?.image = UIImage(systemName: "location.fill")
        return cell
    }
    
    // Handle row selection to navigate to the detail view controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = MapDetailViewController()
        detailVC.selectedLocation = locations[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

