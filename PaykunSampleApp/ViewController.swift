
import UIKit
import PayKun

class ViewController: UIViewController,PaykunCheckoutDelegate {
    
    var objPaykun: PaykunCheckout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objPaykun = PaykunCheckout.init(key: "297E1CBBD172DA76325163469CB8D1EA", merchantId: "357851063624213", isLive: false, andDelegate: self)
    }
    
    // MARK: IBAction Method
    @IBAction func showPaymentCheckout(){
        
        var orderId = "\(1 + arc4random_uniform(9))"
        for _ in 0..<9 {
            orderId = orderId + ("\(arc4random_uniform(10))")
        }
    
        objPaykun.checkout(withCustomerName: "Paul", customerEmail: "example@mail.com", customerMobile: "", productName: "Stationery", orderNo: orderId, amount: "10", viewController: self)
    }
    
    // MARK: PaykunCheckoutDelegate
    func onPaymentFailed(_ responce: [AnyHashable : Any]) {
        
        let requestId = responce["req_id"] as! String
        let alert = UIAlertController(title: "Oops", message: "fail with req_id:" + requestId, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func onPaymentSucceed(_ responce: [AnyHashable : Any]) {
        
        let requestId = responce["req_id"] as! String
        let alert = UIAlertController(title: "Success", message: "success with req_id:" + requestId, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

