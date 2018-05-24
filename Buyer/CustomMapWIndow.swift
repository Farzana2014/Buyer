

import UIKit

//@objc protocol DrawerViewDelegate: class {
//
//    @objc optional func drawerWillShow()
//    @objc optional func drawerDidHideWith(Menu menu: String)
//    @objc optional func drawerShouldHideWith(Menu menu: String)
//
//}

class CustomMapWIndow: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    @IBInspectable var title: String = "This is a default title"
    @IBInspectable var details: String = "This is a default details"
    @IBInspectable var price: Double = 300

   // var delegate:DrawerViewDelegate!
    var viewController:BViewController!



    override init(frame: CGRect) {
        super.init(frame: frame)


        let nibs =  Bundle.main.loadNibNamed("CustomMapWIndow", owner: self, options: nil)
        let loadedView = nibs?.first as! UIView
        self.addSubview(loadedView)
        loadedView.frame = self.bounds

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }

    func updateView() {
        titleLabel.text = title
        detailsLabel.text = details
        priceLabel.text = String(describing: price)

    }

}
