//
//  ViewController.swift
//  DemoTest
//
//  Created by Jamshed Dhaka on 5/23/18.
//  Copyright © 2018 NO. All rights reserved.
//

import UIKit
import GoogleMaps
import Alamofire

class DashBoardViewController: BViewController , GMSMapViewDelegate   {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        

        
        
        self.hasMenuButton = true
        self.hasIcon = true
        self.titleText = "DASHBOARD"
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect(x:0, y:60, width: self.view.frame.width, height: self.view.frame.height-60), camera: camera)
        //view = mapView
        mapView.delegate = self
        // Creates a marker in the center of the map.
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        //self.view.addSubview(mapView)
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: -33.80, longitude: 151.30)
        marker2.title = "Sydney 2"
        marker2.snippet = "Australia 2"
        marker2.map = mapView
        self.view.addSubview(mapView)
        
        
        //Alamofire
        var authenticatedJsonHeaders: [String: String] {
            get {
                return [
                    "Content-Type": "application/json",
                    "Authorization": "Bearer aPJ84GDepzzGi5uRlWWh639pyEBYfQ"
                ]
            }
        }


        let url = "https://sa711.herokuapp.com/api/seller/?city__name=Dhaka"

        Alamofire.request(url, headers: authenticatedJsonHeaders).responseJSON { (response) in
            print("response %@",response)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func drawerDidHideWith(){
        super.drawerDidHideWith()
        

    }
    
    // MARK: - GMSMapView  delegate methods
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView?
    {
      //  let index:Int! = Int(marker.accessibilityLabel!)
        
      //  let customInfoWindow =  Bundle.main.loadNibNamed("CustomMapWIndow", owner: self, options: nil)?.first as! CustomMapWIndow

      // let customInfoWindow = Bundle.main.loadNibNamed("FNavbarView", owner: self, options: nil) as! FNavbarView
       // customInfoWindow.titleLabel.text = customInfoWindow.title
       // customInfoWindow.detailsLabel.text = customInfoWindow.details
      //  customInfoWindow.priceLabel.text = "88" //String(format: "%.0f", customInfoWindow.price)

       // customInfoWindow.Title.text = States[index].name
       // customInfoWindow.Direction_Button.tag = index
       // customInfoWindow.Direction_Button.addTarget(self, action: #selector(GetDirectionsAction(sender:)), for: .touchUpInside)

//        var infoWindow = CustomMapWIndow(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
//
//        infoWindow.backgroundColor = UIColor.red
//        //set up information to be shown
////        infoWindow.Name.text = (marker.userData as! location).name
////        infoWindow.Price.text = (marker.userData as! location).price.description
////        infoWindow.Zone.text = (marker.userData as! location).zone.rawValue
////        infoWindow.button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
//        return CustomMapWIndow
        
        return nil
    }
    
   
    
//    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//
//        return false
//
//    }

}

