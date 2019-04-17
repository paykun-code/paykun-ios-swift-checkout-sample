
import UIKit
import PayKun

class ViewController: UIViewController,PaykunCheckoutDelegate {
    
    var objPaykun: PaykunCheckout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialization method
        objPaykun = PaykunCheckout.init(key:"YourApiKey", merchantId:"YourMerchantId", isLive:true, andDelegate: self)
    }
    
    // MARK: IBAction Method
    @IBAction func showPaymentCheckout(){
        
        var orderId = "\(1 + arc4random_uniform(9))"
        for _ in 0..<9 {
            orderId = orderId + ("\(arc4random_uniform(10))")
        }
    
        // open checkout method
        objPaykun.checkout(withCustomerName:"Paul", customerEmail:"example@mail.com", customerMobile:"", productName:"Stationery", orderNo:orderId, amount: "10", viewController:self)
    }
    
    // MARK: PaykunCheckoutDelegate
    func onPaymentFailed(_ responce: [AnyHashable : Any]) {
        
        let requestId = responce["req_id"] as! String
        let alert = UIAlertController(title: "Oops", message: "fail with req_id:" + requestId, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        // get transaction detail
        objPaykun.getTransactionByPaymentId(requestId, block: { responce in
            print("responce: \(responce)")
        })
    }
    
    func onPaymentSucceed(_ responce: [AnyHashable : Any]) {
        
        let requestId = responce["req_id"] as! String
        let alert = UIAlertController(title: "Success", message: "success with req_id:" + requestId, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        // get transaction detail
        objPaykun.getTransactionByPaymentId(requestId, block: { responce in
            print("responce: \(responce)")
        })
    }
}

