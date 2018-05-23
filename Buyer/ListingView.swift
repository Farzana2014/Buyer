///**
// MIT License
//
// Copyright (c) 2018 MaherKSantina
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
// */
//
//import UIKit
//
////@objc protocol DrawerViewDelegate: class {
////
////    @objc optional func drawerWillShow()
////    @objc optional func drawerDidHideWith(Menu menu: String)
////    @objc optional func drawerShouldHideWith(Menu menu: String)
////
////}
//
//class ListingView: UIView {
//
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var detailsLabel: UILabel!
//    @IBOutlet weak var priceLabel: UILabel!
//
//    @IBInspectable var title: String = "This is a default title"
//    @IBInspectable var details: String = "This is a default details"
//    @IBInspectable var price: Double = 300
//
//   // var delegate:DrawerViewDelegate!
//    var viewController:BViewController!
//
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//
//        let nibs =  Bundle.main.loadNibNamed("ListingView", owner: self, options: nil)
//        let loadedView = nibs?.first as! UIView
//        self.addSubview(loadedView)
//        loadedView.frame = self.bounds
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        updateView()
//    }
//
//    func updateView() {
//        titleLabel.text = title
//        detailsLabel.text = details
//        priceLabel.text = String(describing: price)
//
//    }
//
//}
