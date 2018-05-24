//
//  BViewController.swift
//  Jamshe
//
//  Created by Jamshed Dhaka on 2/18/18.
//

import UIKit

class BViewController: UIViewController , DrawerViewDelegate {
    
    
    var data : Any!
    
    var hasBackButton = false
    var hasMenuButton = false
    var hasIcon = false
    var goToRootButton = false

    
    var topBar : FNavbarView!
   // var listingView: ListingView!

   // @IBOutlet weak var listingView: ListingView!

    var drawerView : DrawerView!
    
    var isShowingDrawerView = false
    
    var autoLockDisable = false
    
    
    var orientations : [UIInterfaceOrientation] = [UIInterfaceOrientation.portrait]
    var supportedOrientations : [UIInterfaceOrientationMask] = [UIInterfaceOrientationMask.portrait]
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        if hasBackButton || hasMenuButton || hasIcon{
            addTopBar()
        }
        
        

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var value : NSNumber!
        
        
        if let currOrien =  UIDevice.current.value(forKey: "orientation") as! NSNumber! {
            
            for orn in orientations{
                
                if orn.rawValue == currOrien.intValue {
                    
                    value = NSNumber(value: orn.rawValue)
                    break
                }
            }
        }
        
        
        
        if let _ = value{
            
        }
        else{
            let oreintation = orientations.first! as UIInterfaceOrientation
            let orInt :Int = oreintation.rawValue
            
            value = NSNumber(value: orInt)
        }
        
        
        UIDevice.current.setValue(value, forKey: "orientation")
        
        UIViewController.attemptRotationToDeviceOrientation()
        

    }
    
    
    
    
    func addTopBar(){
        
        guard let xibs =  Bundle.main.loadNibNamed("FNavbarView", owner: self, options: nil) else{
            return
        }
        
        topBar = xibs.first as! FNavbarView
        
        topBar.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topBar)
        
        //        let height = (94.0*self.view.frame.size.width)/375.0
        
        //        topBar.frame = CGRect(x:0, y:0, width: self.view.frame.size.width, height:height)
        
        let heightConstant: CGFloat = 20 // Utility.deviceModelVersion() == "iPhone X" ? 44 : 20
        let topCons = NSLayoutConstraint.init(item: topBar, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: heightConstant)
        let leadCons = NSLayoutConstraint.init(item: topBar, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailCons = NSLayoutConstraint.init(item: topBar, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let heightCons = NSLayoutConstraint.init(item: topBar, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 44.0/375.0, constant: 0)


        self.view.addConstraint(topCons)
        self.view.addConstraint(leadCons)
        self.view.addConstraint(trailCons)
        self.view.addConstraint(heightCons)
        
        
        
        if hasMenuButton || hasBackButton {
            topBar.backMenuButton.isHidden = false
            
            if hasBackButton {
              //  topBar.backMenuButton.setImage(UIImage.init(named: "backIcon"), for: .normal)
              //  topBar.backMenuButton.addTarget(self, action: #selector(navigationBackAction), for: .touchUpInside)
            }
            else{
              //  topBar.backMenuButton.setImage(UIImage.init(named: "menuIcon"), for: .normal)
               // topBar.backMenuButton.addTarget(self, action: #selector(navigationMenuAction), for: .touchUpInside)
            }
            
            topBar.searchTF.addTarget(self, action: #selector(searchFromText), for: .editingDidEndOnExit)
            topBar.rightButton.addTarget(self, action: #selector(navigationMenuAction), for: .touchUpInside) // right menu


        }
        else{
            topBar.backMenuButton.isHidden = true
        }
        
        
       // topBar.titleLabel.text = titleText
        //topBar.titleLabel.font = Utility.customFont(By: 15, style: .UltraRegular)
        
    }
    
    var titleText: String!{
        
        didSet{
            
            //            topBar.titleLabel.text = titleText
            
//            if let tb = topBar{
//            }
            
        }
    }
    @objc func searchFromText(){
        
        print(topBar.searchTF.text!)
        topBar.searchTF.text = ""
        // Call Text Search API
        print("searchFromText")
    }
    

    
    @objc func navigationBackAction(){
        

        
        
    }
    
    @objc func navigationMenuAction(){ // right menu
        
        //print("menuAction")
        
        //                    topBar.titleLabel.text = ""
        

        if let _ = drawerView {

            print("Shown already")
            drawerView.showMenu(Show: drawerView.isHidden)

        }
        else{
            print("Shown first time")

            
            drawerView = DrawerView.init(frame: self.view.bounds)
            self.view.addSubview(drawerView)
            drawerView.delegate = self
            drawerView.backgroundColor = UIColor.clear
            drawerView.viewController = self
        }
    

    }
    
    @objc func fetchVenuList(){
        
        print("fetchVenuList2")

        
    }

    
    
    func drawerWillShow(){
        
        if let _ = topBar{
            topBar.rightButton.isUserInteractionEnabled = false
        }
    }
    
    func drawerDidHideWith(){
        
        if let _ = topBar{
            topBar.rightButton.isUserInteractionEnabled = true
        }
    }
    
    func menuTouched(){
        
    }

  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

