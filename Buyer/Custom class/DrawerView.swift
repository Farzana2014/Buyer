//
//  BViewController.swift
//
//
//  Created by jamshed iMac Dhaka on 2/18/18.
//

import UIKit

@objc protocol DrawerViewDelegate: class {
    
    @objc optional func drawerWillShow()
    @objc optional func drawerDidHideWith()
    @objc optional func drawerShouldHideWith()

}



class DrawerView: UIView  {

    @IBOutlet var transView: UIView!
    @IBOutlet var holderLeading: NSLayoutConstraint!
    @IBOutlet weak var versionLabel : UILabel!
    @IBOutlet var tableHolder: UIView!

    var delegate:DrawerViewDelegate!
    var viewController:BViewController!

    
   // var menuArray = [HB_Menu]()
    
    let mainItem = [0,1,5,7,8,9]

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let nibs =  Bundle.main.loadNibNamed("DrawerView", owner: self, options: nil)
        let loadedView = nibs?.first as! UIView
        self.addSubview(loadedView)
        loadedView.frame = self.bounds
    

//        menuArray.append(HB_Menu.Dashboard)
//        menuArray.append(HB_Menu.Fitness)
//        menuArray.append(HB_Menu.Aerobic)
//        menuArray.append(HB_Menu.Muscular)
//        menuArray.append(HB_Menu.Strength)
//        menuArray.append(HB_Menu.Workouts)
//        menuArray.append(HB_Menu.History)
//        menuArray.append(HB_Menu.Technique)
//        menuArray.append(HB_Menu.Library)
//        menuArray.append(HB_Menu.Profile)
//        menuArray.append(HB_Menu.Account)
//        menuArray.append(HB_Menu.Logout)
        
        
        self.holderLeading.constant = 320 //  self.tableHolder.frame.size.width

        
      //  table.reloadData()
     
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(touched))
        transView.addGestureRecognizer(tap)
        
//        let dictionary = Bundle.main.infoDictionary!
//        let version = dictionary["CFBundleShortVersionString"] as! String
//        versionLabel.text = "Version \(version)"
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
//        showMenu(true)
        showMenu(Show: true)

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    
    @IBAction func closeIconAction(_ sender: Any) {
        
        showHide()
    }
    
    
    
    @objc func touched(){

      showHide()
    }
    
    fileprivate  func showHide(){
    
        print(self.tableHolder.frame)
        print("showHide method")

       // if holderLeading.constant == 320  {
            if self.tableHolder.frame.origin.x != 320  {

            showMenu(Show: false)

        }
        else{
            showMenu(Show: true)
        }
    }
    
    func showMenu(Show show: Bool){
        
        print("show hide menu \(show)")
        if show{
            
            if self.delegate != nil {
                delegate?.drawerWillShow!()
            }
            
            self.isHidden = false
            
            self.superview?.bringSubview(toFront: self)
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [], animations: {
                
                self.tableHolder.frame = CGRect(x:self.frame.size.width-self.tableHolder.frame.size.width, y:60, width: self.tableHolder.frame.size.width, height: self.tableHolder.frame.size.height) // x 0
                print(self.tableHolder.frame)
               // self.tableHolder.layoutIfNeeded()

                print("showing -1")

            }, completion: { (finished: Bool) in
                
                
               // self.holderLeading.constant =  self.frame.size.width
                self.tableHolder.layoutIfNeeded()
                
                print(self.tableHolder.frame)
                print("showing -2")
            })
        }
        else{
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [], animations: {
                
                self.tableHolder.frame = CGRect(x:self.frame.size.width, y:60, width: self.tableHolder.frame.size.width, height: self.tableHolder.frame.size.height) //-1*self.tableHolder.frame.size.width
                
                print(self.tableHolder.frame)
                print("hiding 1 ")
                
            }, completion: { (finished: Bool) in
                
                self.holderLeading.constant = 280 // self.tableHolder.frame.size.width
               // self.tableHolder.layoutIfNeeded()

                self.isHidden = true
                
                if self.delegate != nil {
                    self.delegate?.drawerDidHideWith!()
                }
                
                print(self.tableHolder.frame)
                print("hiding  2")

            })
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   
    
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return menuArray.count
//    }
//
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
//        let rowNumber = indexPath.row
//
//        if mainItem.contains(rowNumber) {
//            return CGFloat(50.0*SIZE_FACTOR_PAD)
//        }
//
//        // subItem.contains(rowNumber)
//        return CGFloat(38.0*SIZE_FACTOR_PAD)
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//
//        var cell : DrawerTableViewCell!
//
//        if let cellD = tableView.dequeueReusableCell(withIdentifier: "DrawerTableViewCell") {
//            cell = cellD as! DrawerTableViewCell
//        }
//        else{
//
//          let nibs =  Bundle.main.loadNibNamed("DrawerTableViewCell", owner: self, options: nil)
//            cell = nibs?.first as! DrawerTableViewCell
//        }
//
////        cell.backgroundColor = Utility.hexStringToUIColor(hex: "F1E510", alpha: 1.0)
////        cell.menuLabel.text = menuArray[indexPath.row].rawValue
////        let rowNumber = indexPath.row
////
////        if mainItem.contains(rowNumber) {
////            cell.menuLabel.font = Utility.customFont(By: 18, style: .Regular)
////            if let imageName = getImageName(From: rowNumber) {
////                cell.menuImage.image = UIImage.init(named: imageName )
////            }
////        } else {
////            cell.menuLabel.font = Utility.customFont(By: 15, style: .Book)
////            cell.menuImage.isHidden = true
////        }
//
//        cell.selectionStyle = .none;
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//
//        //print("didSelectRowAt")
//
//        let menu = menuArray[indexPath.row]
//        
//        if menu == .Logout{
//         //   Utility.logoutToLoginView()
//            return
//        }
//
//        if menu == .Fitness{
//
////            if viewController is DashboardViewController {
////                if let tempVC = viewController as? DashboardViewController {
////                    let from = tempVC.paggingView.currentPage
////
////                    showHide()
////                    tempVC.setHeaderTitle(2)
////                    if from > 2 {
////                        tempVC.showPage(To: 2, fromPage: from, toLeft: true)
////                        tempVC.paggingView.currentPage = 2
////                    } else if from == 1 {
////                        tempVC.showPage(To: 2, fromPage: from, toLeft: false)
////                        tempVC.paggingView.currentPage = 2
////                    } else {
////                        return
////                    }
////                }
////            }
//
//            return
//        }
//
//        if isSelectedViewAppeared(menu){
//            showMenu(Show: false)
//            return
//        }
    
//        if menu == .Aerobic || menu == .Muscular || menu == .Strength {
//            if let vcId = viewcontrollerID(menu){
//
//            ViewManager.navigate(From: viewController, To: vcId, data: (menu == .Aerobic ?  1 : menu == .Muscular ? 2 : menu == .Strength ? 3:0) as AnyObject)
//            }
//        }
//        else if let view = viewInStack(menu){
//
//            //showHide()
//
//            viewController.navigationController?.popToViewController(view, animated: true)
//        }
//        else{
//
//           // showHide()
//
//            showMenu(Show: false)
//
//            if let vcId = viewcontrollerID(menu){
//
//
//                if menu == .Aerobic || menu == .Muscular || menu == .Strength {
//                    ViewManager.navigate(From: viewController, To: vcId, data: (menu == .Aerobic ?  1 : menu == .Muscular ? 2 : menu == .Strength ? 3:0) as AnyObject)
//                }
//                else {
//                    ViewManager.navigate(From: viewController, To: vcId, data: nil)
//                }
//            }
//        }
    
    }
    
    func isSelectedViewAppeared()-> Bool{
        
      //  let view = viewController.navigationController?.topViewController as! BViewController
        
//        if menu == .Dashboard && view.isKind(of: viewClass(menu)){
//            return true
//        }
//
//        if menu == .Fitness && view.isKind(of: viewClass(menu)){
//            return true
//        }
//
//        if menu == .Aerobic && view.isKind(of: viewClass(menu)){
//            return true
//        }
//
//        if menu == .Muscular && view.isKind(of: viewClass(menu)){
//            return true
//        }
//
//        if menu == .Strength && view.isKind(of: viewClass(menu)){
//            return true
//        }
//
//        if menu == .Workouts && view.isKind(of: viewClass(menu)){
//            return true
//        }
//
//        if menu == .History && view.isKind(of: viewClass(menu)){
//            return true
//        }
//
//        if menu == .Technique && view.isKind(of: viewClass(menu)){
//            return true
//        }
//
//        if menu == .Library && view.isKind(of: viewClass(menu)){
//            return true
//        }
//
//        if menu == .Profile && view.isKind(of: viewClass(menu)){
//            return true
//        }
//
//        if menu == .Account && view.isKind(of: viewClass(menu)){
//            return true
//        }
//
//        if menu == .Logout && view.isKind(of: viewClass(menu)){
//            return true
//        }

        
        
        return false

    }
    
    func viewInStack()->BViewController!{
        
        var theView : BViewController!
        
//        let app = AppDelegate.shared()
//
//        let views = app.navigation?.viewControllers
//
//        for view in views!{
//
//
//            if menu == .Dashboard && view.isKind(of: viewClass(menu)){
//                theView = view as! BViewController
//                break;
//            }
//            else if menu == .Fitness && view.isKind(of: viewClass(menu)){
//                theView = view as! BViewController
//                break;
//            }
//            else if menu == .Workouts && view.isKind(of: viewClass(menu)){
//                theView = view as! BViewController
//                break;
//            }
//            else if menu == .Profile && view.isKind(of: viewClass(menu)){
//                theView = view as! BViewController
//                break;
//            }
//            else if menu == .Account && view.isKind(of: viewClass(menu)){
//                theView = view as! BViewController
//                break;
//            }
//            else if menu == .Fitness && view.isKind(of: viewClass(menu)){
//                theView = view as! BViewController
//                break;
//            }
//        }
        
       
        
        return theView
    }
    
    func viewClass()->AnyClass{
        
//        if menu == .Dashboard{
//            return DashboardViewController.self
//        }
//
//        if menu == .Fitness{
//            return FitnessDetailsViewController.self
//        }
////
//        if menu == .Profile{
//            return ProfileSetUpViewController.self
//        }
////
//        if menu == .Library{
//            return ExerciseHomeViewController.self
//        }
////
//        if menu == .History{
//            return WorkoutsHistoryViewController.self
//        }
////
////
//        if menu == .Workouts{
//            return WorkoutsHomeViewController.self
//        }
//
//        if menu == .Technique  {
//            return MyTechniqueHomeViewController.self
//        }
//        if menu == .Aerobic  {
//            return FitnessDetailsViewController.self
//        }
//        if menu == .Strength  {
//            return FitnessDetailsViewController.self
//        }
//        if menu == .Muscular  {
//            return FitnessDetailsViewController.self
//        }
//
////
//        if menu == .Account{
//            return UpdatePasswordViewController.self
//        }
//
//
        
        
        return Any.self as! AnyClass
    }
    
    func viewcontrollerID()->String!{
        

        
//        if menu == .Dashboard{
//            return DashboardVC
//        }
//        if menu == .Fitness  {
//            return FitnessDetailVC
//        }
//        if menu == .Aerobic  {
//            return FitnessDetailVC
//        }
//
//        if menu == .Muscular  {
//            return FitnessDetailVC
//        }
//
//        if menu == .Strength{
//            return FitnessDetailVC
//        }
//        if menu == .Workouts{
//            return WorkoutsHomeVC
//        }
//        if menu == .History{
//            return WorkoutsHistoryVC
//        }
//        if menu == .Technique{
//            return MyTechniqueHomeVC
//        }
//        if menu == .Library{
//            return ExerciseHomeVC
//        }
//        if menu == .Profile{
//            return ProfileSetUpVC
//        }
//        if menu == .Account{
//            return UpdatePasswordVC
//        }

        
        return nil
    }
    
    fileprivate func getImageName(From rownumber: Int) -> String? {
        
        let string = "cNav"
        switch rownumber {
        case 0:
            return string + "Dash"
        case 1:
            return string + "Fitn"
        case 5:
            return string + "Work"
        case 7:
            return string + "Tech"
        case 8:
            return string + "Exer"
        case 9:
            return string + "Prof"
        default:
            return nil
        }
        
    }

   

