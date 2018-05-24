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

class ViewController: BViewController , GMSMapViewDelegate   {


    let payFort = PayFortController.init(enviroment: KPayFortEnviromentSandBox)
    
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
        
        
//        //Payment API test
//        let request = NSMutableDictionary.init()
//        request.setValue("1000", forKey: "amount")
//        request.setValue("AUTHORIZATION", forKey: "command")
//        request.setValue("USD", forKey: "currency")
//        request.setValue("email@domain.com", forKey: "customer_email")
//        request.setValue("en", forKey: "language")
//        request.setValue("112233682686", forKey: "merchant_reference")
//        request.setValue("token" , forKey: "sdk_token")
//
//
//
//        payFort?.callPayFort(withRequest: request, currentViewController: self,
//                             success: { (requestDic, responeDic) in
//                                print("success")
//                                print("responeDic=(responeDic)")
//                                print("responeDic=(responeDic)")
//        },
//                             canceled: { (requestDic, responeDic) in
//                                print("canceled")
//                                print("requestDic=(requestDic)")
//                                print("responeDic=(responeDic)")
//        },
//                             faild: { (requestDic, responeDic, message) in
//                                print("faild")
//                                print("requestDic=(requestDic)")
//                                print("responeDic=(responeDic)")
//                                print("message=(message)")
//        })
     
        
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
//    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView?
//    {
//        let index:Int! = Int(marker.accessibilityLabel!)
//       // let customInfoWindow = Bundle.main.loadNibNamed("CustomMapWIndow", owner: self, options: nil)?[0] as! CustomMapWIndow
//       // customInfoWindow.Timings.text = States[index].time
//       // customInfoWindow.Title.text = States[index].name
//       // customInfoWindow.Direction_Button.tag = index
//       // customInfoWindow.Direction_Button.addTarget(self, action: #selector(GetDirectionsAction(sender:)), for: .touchUpInside)
//
//        return customInfoWindow
//    }
    
    // MARK: - IBACTION  
    @IBAction func gotoPayment(_ sender: Any) {
        
        var storyboard : UIStoryboard!
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! BViewController
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }

}

