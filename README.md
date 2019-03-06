# iOS Checkout SDK

The iOS SDK library lets you seamlessly integrate the entire payment ecosystem in your iOS application and start accepting payments with Paykun.

## Features | Doc

### Step 1: Importing the Library

Follow the instruction given below to import the SDK library to your Swift or Objective-C project :

1.    Download the SDK from above and unzip it.
2.    Open your project in XCode and go to file under Menu. Select Add files to "yourproject".
3.    Select PayKun.framework in the directory you just unzipped.
4.    Select the Copy items if needed check-box.
5.    Click Add.
6.    Navigate to Target settings > General and add the Paykun.framework in both Embeded Binaries and Linked Frameworks and Libraries.


### Step 2: Initialize the Paykun SDK

To initialize the Paykun SDK, you will need the following:

•    Device API key 

•    Merchant Id

```
import Paykun

class ViewController: UIViewController, PaykunCheckoutDelegate {

var objPaykun: PaykunCheckout!

override func viewDidLoad() {
    super.viewDidLoad()
    objPaykun = PaykunCheckout.init(key: paykunTestKey, merchantId: merchantId, isLive: true,andDelegate: self)
}
```

### Step 3: Pass Payment Parameter and Display Checkout Form

Add the following code to your ViewController or where ever you want to initialize payments:

```
func showPaymentCheckout(){
    objPaykun.checkout(withCustomerName: “name”, customerEmail: “email”, customerMobile: “mobile”, productName: “product”, orderNo: “order”, amount: “amount”, viewController: self);
}
```

### Step 4: Handle Success and Fail Event

Success
```
func onPaymentSucceed(_ responce: [AnyHashable : Any]!) {
    let msg = responce!["req_id"] as! String
    let alert = UIAlertView(title: “Success”, message: "fail with req_id:"+msg, delegate: nil, cancelButtonTitle: "Okay")
    alert.show()
}
```

Fail
```
func onPaymentFailed(_ responce: [AnyHashable : Any]!) {
    let msg = responce!["req_id"] as! String
    let alert = UIAlertView(title: “Error”, message: "fail with req_id:"+msg, delegate: nil, cancelButtonTitle: "Okay")
    alert.show()
}
```


### For further help, see our [Documentation](https://docs.paykun.com) or [Contact Us](https://paykun.com/contact)




