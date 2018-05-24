//
//  PaymentViewController.swift
//  Buyer
//
//  Created by Jamshed iMac Dhaka on 5/24/18.
//  Copyright © 2018 NO. All rights reserved.
//

import UIKit

class PaymentViewController: BViewController {

    let payFort = PayFortController.init(enviroment: KPayFortEnviromentSandBox)

    override func viewDidLoad() {
        
        self.hasMenuButton = true
        self.hasIcon = true
        self.titleText = "PaymentViewController"
        
        
        super.viewDidLoad()

                //Payment API test
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
                                        print("responeDic=\(responeDic!)")
                                        print("responeDic=\(responeDic!)")
                },
                                     canceled: { (requestDic, responeDic) in
                                        print("canceled")
                                        print("requestDic=\(requestDic!)")
                                        print("responeDic=\(responeDic!)")
                },
                                     faild: { (requestDic, responeDic, message) in
                                        print("faild")
                                        print("requestDic=\(requestDic!)")
                                        print("responeDic=\(responeDic!)")
                                        print("message=\(message!)")
                })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
