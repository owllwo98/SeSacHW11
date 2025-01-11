//
//  ViewController.swift
//  SeSacHW11
//
//  Created by 변정훈 on 1/8/25.
//

import UIKit
import MapKit
import Combine

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var categorySegment: UISegmentedControl!
    @IBOutlet var mapKitView: MKMapView!
    @IBOutlet var categoryButton: UIButton!
    
    private var viewModel = mapkitViewModel()
    
    let restaurant = RestaurantList().restaurantArray
    var newRestaurant: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        mapKitView.delegate = self
        
        newRestaurant = restaurant
        
        segmentConfigure()
        
        categoryButtonConfigure()
        
        onfigureMapView()
        
    }
    
    
    func onfigureMapView() {
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        
        mapKitView.region = MKCoordinateRegion(center: center, latitudinalMeters: 2000, longitudinalMeters: 2000)
        
        for i in newRestaurant {
            let annotation = MKPointAnnotation()
            annotation.title = i.name
            annotation.coordinate = CLLocationCoordinate2D(latitude: i.latitude, longitude: i.longitude)
            mapKitView.addAnnotation(annotation)
        }
  
    }
    
    func segmentConfigure() {
        categorySegment.setTitle("전체", forSegmentAt: 0)
        categorySegment.setTitle("한식", forSegmentAt: 1)
        categorySegment.insertSegment(withTitle: "양식", at: 2, animated: true)
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            newRestaurant = restaurant
            mapKitView.removeAnnotations(mapKitView.annotations)
            onfigureMapView()
        case 1:
            newRestaurant = restaurant.filter {$0.category == "한식"}
            mapKitView.removeAnnotations(mapKitView.annotations)
            onfigureMapView()
        case 2:
            newRestaurant = restaurant.filter {$0.category == "양식"}
            mapKitView.removeAnnotations(mapKitView.annotations)
            onfigureMapView()
        default:
            break
        }
    }
    
    func categoryButtonConfigure() {
        categoryButton.setTitle("Filter", for: .normal)
        categoryButton.setTitleColor(.lightGray, for: .normal)
    }
    
    @IBAction func categoryButtonTapped(_ sender: UIButton) {
        let saveAlert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let ok = UIAlertAction(title: "취소", style: .cancel)
        let all = UIAlertAction(title: "전체", style: .default) { _ in
            self.newRestaurant = self.restaurant
            self.mapKitView.removeAnnotations(self.mapKitView.annotations)
            self.onfigureMapView()
        }
        let korean = UIAlertAction(title: "한식", style: .default) { _ in
            self.newRestaurant = self.restaurant.filter {$0.category == "한식"}
            self.mapKitView.removeAnnotations(self.mapKitView.annotations)
            self.onfigureMapView()
        }
        let western = UIAlertAction(title: "양식", style: .default) { _ in
            self.newRestaurant = self.restaurant.filter {$0.category == "양식"}
            self.mapKitView.removeAnnotations(self.mapKitView.annotations)
            self.onfigureMapView()
        }
        
        saveAlert.addAction(ok)
        saveAlert.addAction(all)
        saveAlert.addAction(korean)
        saveAlert.addAction(western)
        
        present(saveAlert, animated: true)
        
       
    }
    
}

