//
//  ViewController.swift
//  DemoTest
//
//  Created by Jamshed Dhaka on 5/23/18.
//  Copyright © 2018 NO. All rights reserved.
//

import UIKit
import GoogleMaps


class ViewController: BViewController {


    override func viewDidLoad() {
        
        
        self.hasMenuButton = true
        self.hasIcon = true
        self.titleText = "DASHBOARD"
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect(x:0, y:60, width: self.view.frame.width, height: self.view.frame.height-60), camera: camera)
        //view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        self.view.addSubview(mapView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func drawerDidHideWith(){
        super.drawerDidHideWith()
        
//        if menu == HB_Menu.Dashboard.rawValue{
//            if paggingView.currentPage != 1{
//                for button in paggingView.buttons{
//
//                    if button.tag == 1{
//                        button.sendActions(for: .touchUpInside)
//                        break;
//                    }
//                }
//            }
//
//        }
//
    }
    
    
    @IBAction func gotoPayment(_ sender: Any) {
        
        var storyboard : UIStoryboard!
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! BViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }

}

