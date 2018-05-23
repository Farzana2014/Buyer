

import UIKit

class BNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override var shouldAutorotate: Bool{
        
        return true
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
        
//        let view = self.visibleViewController as! BViewController
        let view = self.topViewController as! BViewController

        
        let oreintation = view.orientations.first! as UIInterfaceOrientation
//        let orInt :Int = oreintation.rawValue
        
        
        if oreintation == .portrait || oreintation == .landscapeRight {
            return .portrait
        }
        else{
            return .landscapeLeft
        }
        
//        if oreintation == .landscapeLeft || oreintation == .landscapeRight {
//            return oreintation
//        }
//        else{
//            return UIInterfaceOrientation.portrait
//        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        
//        let view = self.visibleViewController as! BViewController
        let view = self.topViewController as! BViewController

        
        let mask = view.supportedOrientations.first! as UIInterfaceOrientationMask
        
        
//        if mask == .landscapeLeft || mask == .landscapeRight{
//            return mask
//        }
//        else{
//            return UIInterfaceOrientationMask.portrait
//        }
        
        if mask == .portrait{
            return .portrait
        }
        else{
            return .landscape
        }

        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   

}
