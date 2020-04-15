# iOS Checkout SDK

The iOS SDK library lets you seamlessly integrate the entire payment ecosystem in your iOS application and start accepting payments with [PayKun](https://paykun.com)

This framework only supports iOS version 9.0 and later

## Features | Doc

### Step 1: How to Generate Access Token For Device

*   Device access token is bounded with the application package name; hence one Access Token per Application will be granted. 

*   You can generate/regenerate Access token and API KEY by logging into your PayKun Admin panel.

*    Go to: Settings => Security => Device API KEY Here you will find generate button, if you have not generated any Device Access Token before.

*    You must provide the package name of your application to generate the access token.

*   If you have ever generated any Access Token, you will see Package Name with Creation date of it. You won’t be able to retrieve any old Access Token (Due to security concerns), that’s why we have provided regenerate option.

```
Note: Once you regenerate API KEY, your old API KEY will immediately stop working. So be double sure and cautious before regenerating API KEY.
```

### Step 2: Importing the Library

Follow the instruction given below to import the SDK library to your Swift or Objective-C project :

1.    Download the SDK from above and unzip it.
2.    Open your project in XCode and go to file under Menu. Select Add files to "yourproject".
3.    Select PayKun.framework in the directory you just unzipped.
4.    Select the Copy items if needed check-box.
5.    Click Add.
6.    Navigate to Target settings > General and add the Paykun.framework in both Embeded Binaries and Linked Frameworks and Libraries(below xcode 11).
```
Note: For Xcode 11 and later, ensure that you have the framework added in Frameworks, Libraries, and Embed Content under Target settings - General. Change Embed status from - 'Do not Embed' to 'Embed & Sign'.
```

### Step 3: Initialize the Paykun SDK

To initialize the Paykun SDK, you will need the following:

*    Device API key 

*    Merchant Id

*    isLive (true for live environment and false for test environment)

```swift
import Paykun

class ViewController: UIViewController, PaykunCheckoutDelegate {

    var objPaykun: PaykunCheckout!

    override func viewDidLoad() {
        super.viewDidLoad()
        objPaykun = PaykunCheckout.init(key: "YourApiKey", merchantId: "YourMerchantId", isLive: true, andDelegate: self)
    }
}
```

### Step 4: Pass Payment Parameter and Display Checkout Form

Add the following code to your ViewController or where ever you want to initialize payments:

```swift
func showPaymentCheckout(){
    objPaykun.checkout(withCustomerName: “name”, customerEmail: “email”, customerMobile: “mobile”, productName: “product”, orderNo: “order”, amount: “amount”, currency: "currency code", viewController: self);
}
```

### Step 5: Handle Success and Fail Event

Success
```swift
func onPaymentSucceed(_ responce: [AnyHashable : Any]) {
    print("responce: \(responce)")
}
```

Fail
```swift
func onPaymentFailed(_ responce: [AnyHashable : Any]) {
    print("responce: \(responce)")
}
```

### Get Transaction Details

```swift
objPaykun.getTransactionByPaymentId("PaymentId", block: { responce in
    print("responce: \(responce)")
})
```


### For further help, see our [Documentation](https://paykun.com/docs) or [Contact Us](https://paykun.com/contact)

