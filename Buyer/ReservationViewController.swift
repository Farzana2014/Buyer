//
//  ReservationViewController.swift
//  Buyer
//
//  Created by jamshed iMac Dhaka on 5/24/18.
//  Copyright © 2018 NO. All rights reserved.
//

import UIKit

class ReservationViewController: BViewController {

    override func viewDidLoad() {
        
        self.hasMenuButton = true
        self.hasIcon = true
        self.titleText = "ReservationViewController"
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction  func goToBookingScreen(_ sender: Any) {
        //showHide()
        print("goToBookingScreen")
       // navigateToCorrespondingVC(Index: 3)
        ViewManager.navigate(From: self, To: "BookingViewController", data: nil)

    }
    
    @IBAction  func goToPaymentScreen(_ sender: Any) {
      //  showHide()
        print("goToBookingScreen")
       // navigateToCorrespondingVC(Index: 3)
        ViewManager.navigate(From: self, To: "PaymentViewController", data: nil)

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
