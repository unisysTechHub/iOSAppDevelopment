//
//  SigninViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 22/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//
import UIKit
import Combine
import SwiftUI
class SigninViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var signIn: UIButton!
//    @State var amount : Double = 9.9
    var cancellables = Set<AnyCancellable>()
    let userNameicon = UIImage(named: "img_user_name")!
    let userNameValidStateIcon = UIImage(named: "img_user_name_green")!
    let userNameInvalidStateIcon = UIImage(named: "img_user_name_red")!
    let passswordIcon = UIImage(named: "password_normal")!
    let passwordValidIcon = UIImage(named: "password_valid")!
    let passwordInvalidIcon = UIImage(named: "password_not_valid")!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        adduserMetadataKeyPaths()
        setUserNameTextFieldLeftView(state: .normal)
        setPasswordTextFieldLeftView(state: .normal)
        subscribeTofetchAPICombineUserNamePublisher()
        subscribeToPasswordPublisherAndupdateLeftView()
        enableSigninButton()
//        let childView = UIHostingController(rootView: UnisysTextField(label : "label",currencyText: $amount,viewModel: UnisysTextFieldViewModel(),validateFn: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/))
//        addChild(childView)
//        childView.view.frame = CGRect(x: 50, y: 400, width: maxWidth, height:
//                                        50)
//        self.view.addSubview(childView.view)
        
    }
    
    func fetchAPICombineUserNamePublisher() -> AnyPublisher<Bool,NetworkError>
    {
        NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification,object: self.userNameTextField).sink { (Notification) in
            self.userNameTextField.progressBar(state: "start")
        }.store(in: &cancellables)
        
        
   return executeAPI(for: listOfusersUrl, model: [UserModel].self)
        .map { $0
                   
        }.combineLatest(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification,object: self.userNameTextField).map  {($0.object as? UITextField)?.text
        }.debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            .setFailureType(to: NetworkError.self)).map { ( users, username) in
            return (users, username)
        }.map {
            (users, username)
            in
            printUserMetaData(user: users[0])
            print("zipcode Name \(users[0][keyPath: zipCodeCompositionKeyPath]!)")
            var usersvar = users
            usersvar[0][keyPath: compnayNameKeyPath] = "companyName"
            return users.contains(where: { user in
                return user.username == username
            })
        }.eraseToAnyPublisher()

    }
    
    func passwordPublisher() -> AnyPublisher<Bool,NotificationCenter.Publisher.Failure> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: passwordTextField)
            .map{($0.object as! UITextField).text}.debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            .map { ( pasword) in
                    switch pasword
                    {
                        case "12345" :
                             return true
                        default :
                            return false
                    }
                      
            }.eraseToAnyPublisher()
    }
    func enableSigninButton() {
        fetchAPICombineUserNamePublisher().combineLatest(passwordPublisher().setFailureType(to: NetworkError.self)).sink { (completion) in
            self.signIn.isEnabled = false
            print("combine emission finished")
        } receiveValue: { (validUser, validPassword) in
            self.signIn.isEnabled = validUser && validPassword
            switch self.signIn.isEnabled
            {
            case true :
                    self.signIn.backgroundColor = UIColor.blue
            case false :
            self.signIn.backgroundColor = UIColor.gray
            }

            
        }.store(in: &cancellables)

    }
    func subscribeTofetchAPICombineUserNamePublisher() {
      fetchAPICombineUserNamePublisher().sink { (completion) in
            print("emssion compated")
        } receiveValue: { (validUser) in
            switch (validUser , self.userNameTextField.text)
               {
            case (true, _)  :
                 self.userNameTextField.progressBar(state: "stop")
                self.setUserNameTextFieldLeftView(state: .validUser)
               case (false,let username) where  username != "":
                self.setUserNameTextFieldLeftView(state: .invalidUser)
            default :
                self.setUserNameTextFieldLeftView(state: .normal)
               }
               
        }
        .store(in: &cancellables)
        
    }
func subscribeToPasswordPublisherAndupdateLeftView()
{
    passwordPublisher().sink { (completion) in
        print("emssion compated")
    } receiveValue: { (validPassword) in
        switch (validPassword , self.passwordTextField.text)
           {
        case (true, _)  :
            self.setPasswordTextFieldLeftView(state: .validUser)
           case (false,let password) where  password != "":
            self.setPasswordTextFieldLeftView(state: .invalidUser)
        default :
            self.setPasswordTextFieldLeftView(state: .normal)
           }
           
    }
    .store(in: &cancellables)
}
  func setUserNameTextFieldLeftView(state : UserNameLeftViewState)
    {
    print(state)
    switch state {
        case .normal :
            self.userNameTextField.setIcon(userNameicon)
        case .validUser :
            self.userNameTextField.setIcon(userNameValidStateIcon)
        case .invalidUser :
        self.userNameTextField.setIcon(userNameInvalidStateIcon)
    }
  }

    func setPasswordTextFieldLeftView(state : PasswordLeftViewState)
      {
      print(state)
      switch state {
          case .normal :
              self.passwordTextField.setIcon(passswordIcon)
          case .validUser :
              self.passwordTextField.setIcon(passwordValidIcon)
          case .invalidUser :
          self.passwordTextField.setIcon(passwordInvalidIcon)
      }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
    enum UserNameLeftViewState {
        case normal
        case validUser
        case invalidUser
    }
    enum PasswordLeftViewState {
        case normal
        case validUser
        case invalidUser
    }

