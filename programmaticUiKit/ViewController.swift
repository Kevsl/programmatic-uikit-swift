
import UIKit
import SwiftUI


class ViewController: UIViewController {
    
    let emailTF = UITextField()
    let passwordTF = UITextField()
    let loginButton = UIButton()
  

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        setupButton()
        setupTfs()
        
    }
    
    func setupButton(){
        view.addSubview(loginButton)
        loginButton.backgroundColor = .red
        loginButton.tintColor = .white
        loginButton.setTitle("Login", for: .normal)

        loginButton.translatesAutoresizingMaskIntoConstraints = false
  
        NSLayoutConstraint.activate([
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -100),
            
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            
            loginButton.heightAnchor.constraint(equalToConstant: 44)
 
        ])
        
        loginButton.addTarget(self, action: #selector(navigateToHome), for: .touchUpInside)
    }

    func setupTfs(){
        setupTF(emailTF,"Email",false,view.topAnchor,100 )
        setupTF(passwordTF,"Password",true,emailTF.bottomAnchor,50 )
    }

    func setupTF(_ tf:UITextField,_ placeholder:String,_ isSecure:Bool ,_ topConstraint:NSLayoutYAxisAnchor,_  topConstant:CGFloat){

        view.addSubview(tf)
        tf.placeholder = placeholder
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = isSecure
        tf.delegate = self
        
        

        tf.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            tf.leftAnchor.constraint(equalTo: view.leftAnchor, constant:  50),
            
            tf.topAnchor.constraint(equalTo: topConstraint, constant:  topConstant),
            
            tf.widthAnchor.constraint(equalToConstant: 300),
            
            tf.heightAnchor.constraint(equalToConstant: 44)
        ])
        
    }
    
    @objc func navigateToHome(){
        
        guard let email = emailTF.text, let pass = passwordTF.text else{
            return
        }
        
        print(email, pass)
        
    }
    
    
    

}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
