//
//  ViewManager.swift
//
//  Created by Jamshed iMac Dhaka on 2/18/18.
//

import Foundation
import UIKit

class ViewManager: NSObject {

    class func navigate(From fromView: AnyObject, To toView: String, data: AnyObject!){
        
        let nav = fromView.navigationController!
        
        if let stackView = viewInStack(VCId: toView){
            nav?.popToViewController(stackView, animated: true)
            return
        }
        
        let view = viewController(By: toView)
        view.data = data
        
        nav?.pushViewController(view, animated: true)
        
    }
    
    //MARK: - private methods
    fileprivate  class func viewInStack(VCId vcId: String)->BViewController!{
    
        var theView : BViewController!
        
        let app = AppDelegate.shared()
        
        let views = app.navigation?.viewControllers
        
        for view in views!{
            
            if vcId == "DashBoardViewController" && view.isKind(of: viewClass(VCId: vcId)){
                theView = view as! BViewController
                break;
            }
            else if vcId == "SearchresultViewController" && view.isKind(of: viewClass(VCId: vcId)){
                theView = view as! BViewController
                break;
            }
            else if vcId == "PaymentViewController" && view.isKind(of: viewClass(VCId: vcId)){
                theView = view as! BViewController
                break;
            }
            
            else if vcId ==  "BookingViewController" && view.isKind(of: viewClass(VCId: vcId)){
                theView = view as! BViewController
                break;
            }
            else if vcId == "NotificationViewController" && view.isKind(of: viewClass(VCId: vcId)){
                theView = view as! BViewController
                break;
            }
            else if vcId == "ReservationViewController" && view.isKind(of: viewClass(VCId: vcId)){
                theView = view as! BViewController
                break;
            }
            
        }
    
        return theView
    }
    
    fileprivate class func viewController(By vcId: String)->BViewController{
        
        let storyboard = self.storyboardForViewController(vcId: vcId)
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcId) as! BViewController
        
        return viewController
    }
    
    fileprivate class func storyboardForViewController(vcId: String) -> UIStoryboard! {
        
        var storyboard : UIStoryboard!

        if (vcId == "DashBoardViewController") {
            
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard
        }
        if (vcId == "SearchResultViewController") {

            storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard
        }
        
        if (vcId == "PaymentViewController") {
            
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard
        }
        if (vcId == "BookingViewController") {
            
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard
        }
        
        if (vcId == "NotificationViewController") {
            
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard
        }
        
        if (vcId == "ReservationViewController") {
            
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            return storyboard
        }
        
        
        
        
        return nil
    }
    
    fileprivate class  func viewClass(VCId vcId: String)->AnyClass{
        
        if vcId == "DashBoardViewController" {
            return DashBoardViewController.self
        }

        if vcId == "SearchResultViewController" {
            return SearchResultViewController.self
        }

        if vcId == "PaymentViewController"{
            return PaymentViewController.self
        }
        
        if vcId == "BookingViewController" {
            return BookingViewController.self
        }
        
        if vcId == "NotificationViewController"{
            return NotificationViewController.self
        }
        
        if vcId == "ReservationViewController"{
            return ReservationViewController.self
        }
        
        
        
//        if vcId == WorkoutsSelectVC{
//            return WorkoutsSelectViewController.self
//        }
//
//        if vcId == WorkoutsCustomSelectionVC{
//            return WorkoutsCustomSelectionViewController.self
//        }
//
//        if vcId ==  MyTechniqueHomeVC{
//            return MyTechniqueHomeViewController.self
//        }
//        if vcId ==  ExerciseHomeVC{
//            return ExerciseHomeViewController.self
//        }
        
//
//        if vcId == SessionHistoryVC{
//            return SessionHistoryViewController.self
//        }
//        
//        
//        if vcId == ProfileSetUpVC{
//            return ProfileSetUpViewController.self
//        }
//        
//        if vcId == UpdatePasswordVC{
//            return UpdatePasswordViewController.self
//        }
//        
//        if vcId == WorkoutVC{
//            return WorkoutViewController.self
//        }
        
        return Any.self as! AnyClass
    }
    
}
