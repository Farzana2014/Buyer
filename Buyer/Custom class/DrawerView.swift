//
//  BViewController.swift
//
//
//  Created by jamshed iMac Dhaka on 2/18/18.
//

import UIKit

@objc protocol DrawerViewDelegate: class { // Not used currenlty
    
    @objc optional func drawerWillShow()
    @objc optional func drawerDidHideWith()
    @objc optional func drawerShouldHideWith()
    
}

enum HB_Menu_Rights : String {
    case Dashboard = " DASHBOARD"
    case Searchresult   = "Search Result"
    case payment   =  "Payment"
    case Booking   = "Booking"
    case Notification   =  "Notification"
    case Reservation   =  "Reservation"
    //    case Muscular  = "       - MUSCULAR ENDURANCE"
    //    case Strength  = "       - STRENGTH/POWER"
    //    case Workouts  = " WORKOUTS"
    //    case History   = "       - HISTORY"
    //    case Technique = " MY TECHNIQUE"
    //    case Library   = " EXERCISE LIBRARY"
    //    case Profile   = " PROFILE"
    //    case Account   = "       - ACCOUNT SETTINGS"
    //    case Logout    = "       - LOG OUT"
    case Unknown   = "  Unknown"
}

class DrawerView: UIView  {
    
    @IBOutlet var transView: UIView!
    @IBOutlet var holderLeading: NSLayoutConstraint!
    @IBOutlet weak var versionLabel : UILabel!
    @IBOutlet var tableHolder: UIView!
    
    var delegate:DrawerViewDelegate! // stil not used. Later buyer code could use it to show their left side menu
    var viewController:BViewController!
    
    @IBOutlet var venuFetchButton: UIButton!
    
    
    var menuArray = [HB_Menu_Rights]()
    
    let mainItem = [0,1,5,7,8,9]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let nibs =  Bundle.main.loadNibNamed("DrawerView", owner: self, options: nil)
        let loadedView = nibs?.first as! UIView
        self.addSubview(loadedView)
        loadedView.frame = self.bounds
        
        
        menuArray.append(HB_Menu_Rights.Dashboard)
        menuArray.append(HB_Menu_Rights.Searchresult)
        menuArray.append(HB_Menu_Rights.payment)
        menuArray.append(HB_Menu_Rights.Booking)
        menuArray.append(HB_Menu_Rights.Notification)
        menuArray.append(HB_Menu_Rights.Reservation)

        
        
        self.holderLeading.constant = 320 //  self.tableHolder.frame.size.width
        
        
        //  table.reloadData()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(touched))
        transView.addGestureRecognizer(tap)
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //        showMenu(true)
        showMenu(Show: true)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    
    // MARK: - IBAction navigation VC  methods
    @IBAction func closeIconAction(_ sender: Any) {
        
        showHide()
    }
    
    // This code can code reusable : Currently we have shown right menu and we have option to add left menu ; hambergur option. We can add left menu using subclass of viewcontroller when merge code.
    // Follow     @IBAction  func goToPaymentScreen(_ sender: Any) method style to navigate and add the corresponding VC, SToryboard ID to viewInStack, viewClass ,viewcontrollerID and  in viewmanager class. Don't take extra headache.
    
    @IBAction  func fetchVenuList(_ sender: Any) {
        
        // fetchVenuList(){
        showHide()
        
        print("fetchVenuList")
        navigateToCorrespondingVC(Index: 1)
    }
    
    @IBAction  func goToDashBoardFromRight(_ sender: Any) {
        
        showHide()
        navigateToCorrespondingVC(Index: 0)
    }
    
    @IBAction  func goToPaymentScreen(_ sender: Any) {
        showHide()
        print("goToPaymentScreen")
        navigateToCorrespondingVC(Index: 2)
    }
    
    @IBAction  func goToBookingScreen(_ sender: Any) {
        
        showHide()
        print("goToBookingScreen")
        navigateToCorrespondingVC(Index: 3)
    }
    
    @IBAction  func goToNotificationScreen(_ sender: Any) {
        showHide()
        print("goToNotificationScreen")
        navigateToCorrespondingVC(Index: 4)
    }
    
    @IBAction  func goToReservationScreen(_ sender: Any) {
        showHide()
        print("goToReservationScreen")
        navigateToCorrespondingVC(Index: 5)
    }
    
    
    func navigateToCorrespondingVC (Index ID:Int) {
        
        let menu = menuArray[ID]
        if let view = viewInStack(menu){
            viewController.navigationController?.popToViewController(view, animated: true)
        }
        else{
            if let vcId = viewcontrollerID(menu){
       
                ViewManager.navigate(From: viewController, To: vcId, data: nil)
            }
        }
    }
    
    @objc func touched(){
        
        showHide()
    }
    
    fileprivate  func showHide(){
        
        print(self.tableHolder.frame)
        print("showHide method")
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
                self.tableHolder.layoutIfNeeded()
                
                //  print("showing -1")
                
            }, completion: { (finished: Bool) in
                
                
                // self.holderLeading.constant =  self.frame.size.width
                self.tableHolder.layoutIfNeeded()
                
                print(self.tableHolder.frame)
                // print("showing -2")
            })
        }
        else{
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [], animations: {
                
                self.tableHolder.frame = CGRect(x:self.frame.size.width, y:60, width: self.tableHolder.frame.size.width, height: self.tableHolder.frame.size.height) //-1*self.tableHolder.frame.size.width
                
                print(self.tableHolder.frame)
                // print("hiding 1 ")
                
            }, completion: { (finished: Bool) in
                
                self.holderLeading.constant = 280 // self.tableHolder.frame.size.width
                // self.tableHolder.layoutIfNeeded()
                
                self.isHidden = true
                
                if self.delegate != nil {
                    self.delegate?.drawerDidHideWith!()
                }
                
                print(self.tableHolder.frame)
                //  print("hiding  2")
                
            })
        }
    }
    
    
    
    
    
    
}

func isSelectedViewAppeared(_ menu: HB_Menu_Rights)-> Bool{
    
    //    let view = ViewManager.navigationController?.topViewController as! BViewController
    //
    //    if menu == .Dashboard && view.isKind(of: viewClass(menu)){
    //        return true
    //    }
    //
    //    if menu == .Searchresult && view.isKind(of: viewClass(menu)){
    //        return true
    //    }
    //
    return false
    
}

func viewInStack(_ menu: HB_Menu_Rights)->BViewController!{
    
    
    var theView : BViewController!
    
    let app = AppDelegate.shared()
    
    let views = app.navigation?.viewControllers
    
    for view in views!{
        
        
        if menu == .Dashboard && view.isKind(of: viewClass(menu)){
            theView = view as! BViewController
            break;
        }
        else if menu == .Searchresult && view.isKind(of: viewClass(menu)){
            theView = view as! BViewController
            break;
        }
        else if menu == .payment && view.isKind(of: viewClass(menu)){
            theView = view as! BViewController
            break;
        }
        else if menu == .Booking && view.isKind(of: viewClass(menu)){
            theView = view as! BViewController
            break;
        }
        else if menu == .Notification && view.isKind(of: viewClass(menu)){
            theView = view as! BViewController
            break;
        }
        else if menu == .Reservation && view.isKind(of: viewClass(menu)){
            theView = view as! BViewController
            break;
        }
    }
    
    
    
    return theView
}

func viewClass(_ menu: HB_Menu_Rights)->AnyClass{
    
    if menu == .Dashboard{
        return DashBoardViewController.self
    }
    
    if menu == .Searchresult{
        return SearchResultViewController.self
    }
    
    if menu == .payment{
        return SearchResultViewController.self
    }
    
    if menu == .Booking{
        return BookingViewController.self
    }
    
    if menu == .Notification{
        return NotificationViewController.self
    }
    if menu == .Reservation{
        return ReservationViewController.self
    }
    
    return Any.self as! AnyClass
}

func viewcontrollerID(_ menu: HB_Menu_Rights)->String!{

    if menu == .Dashboard{
        return "DashBoardViewController"
    }
    if menu == .Searchresult  {
        return "SearchResultViewController"
    }
    if menu == .payment  {
        return "PaymentViewController"
    }
    
    if menu == .Booking  {
        return "BookingViewController"
    }
    
    if menu == .Notification  {
        return "NotificationViewController"
    }
    
    if menu == .Reservation  {
        return "ReservationViewController"
    }
    
    
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





