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


    let payFort = PayFortController.init(enviroment: KPayFortEnviromentSandBox)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let request = NSMutableDictionary.init()
        request.setValue("1000", forKey: "amount")
        request.setValue("AUTHORIZATION", forKey: "command")
        request.setValue("USD", forKey: "currency")
        request.setValue("email@domain.com", forKey: "customer_email")
        request.setValue("en", forKey: "language")
        request.setValue("112233682686", forKey: "merchant_reference")
        request.setValue("token" , forKey: "sdk_token")
        
        
        
        payFort?.callPayFort(withRequest: request, currentViewController: self,
                             success: { (requestDic, responeDic) in
                                print("success")
                                print("responeDic=(responeDic)")
                                print("responeDic=(responeDic)")
        },
                             canceled: { (requestDic, responeDic) in
                                print("canceled")
                                print("requestDic=(requestDic)")
                                print("responeDic=(responeDic)")
        },
                             faild: { (requestDic, responeDic, message) in
                                print("faild")
                                print("requestDic=(requestDic)")
                                print("responeDic=(responeDic)")
                                print("message=(message)")
        })
        
        
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
        //self.view.addSubview(mapView)
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

