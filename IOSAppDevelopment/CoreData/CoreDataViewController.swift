//
//  CoreDataViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 13/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit
import CoreData
import CoreFoundation
import Combine

class CoreDataViewController: UIViewController, UITextFieldDelegate {
    var appDelegate : AppDelegate?
    var persistentContainer : PersistentContainer?
    var cancellables = Set<AnyCancellable>()
    var cancellable: Cancellable?
    var cancellable1 : AnyCancellable?

    var profileModel = ProfileDataModel.init()
    @objc var userInfo = UserInfo()

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signUp(_ sender: UIButton) {
       signup()
       showSignupCompletionAlert()
    }
    @IBAction func login(_ sender: Any) {
     if isValidCredentials()
     { //showMessage(message: "Signin Successfull")
//        let controler = UIViewController()
//        controler.view.backgroundColor = .white
        
        let storyboard = UIStoryboard(name: "CoreData", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "emplist")
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
        }
     else
     {showMessage(message: "Invalid  Credentials")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        executeAPI(for: urlString, model : HumanReviewOutputModel.self ).sink { (completionError) in
             switch completionError
             {
             case .failure(let error ):
                 print(error)
             case .finished:
                     print("httpResponse publisher emission finished ")
             }
         } receiveValue: { (humanReviewOpModel) in
             print("Result Type ")
             print()
         }

        let url = URL(string: "https://loan-on-property-applcation-bucket.s3.ap-south-1.amazonaws.com/customer-poreprty-documents111111/loan-property-doucments-human-review-wokk-flow/2020/11/11/02/23/59/human-loop-name-1234/output.json")!
        let connectable = URLSession.shared
            .dataTaskPublisher(for: url).map() { $0.data }.decode(type: HumanReviewOutputModel.self, decoder: JSONDecoder())
        
        
      

        connectable.receive(on: RunLoop.main).sink(receiveCompletion: { print ("Received completion: \($0).") },
                                                   receiveValue: { humanReviewOutputModel in print ("Received value: \(humanReviewOutputModel.awsManagedHumanLoopRequestSource).")}).store(in: &cancellables)

       
        cancellable = performAsyncActionAsFuture()
            .sink() { _ in print("Future succeeded.") }
        cancellable = performAsyncActionAsFutureWithParameter()
            .sink() { rn in print("Got random number \(rn).") }

        userName.delegate = self
        cancellable = userInfo.publisher(for: \.lastLogin).sink(receiveCompletion: { _ in print("userinfo emission completed")
        }, receiveValue: { (date) in
            print("KVO recived value \(date)")
        })
        userInfo.lastLogin = Date()
        cancellable = Timer.publish(every: 1, on: .main, in: .default)
                .autoconnect()
            .map({ (data) in Date() })
            .assign(to:\.lastUpdated, on: profileModel)
        print("profile last upated \(profileModel.lastUpdated)")
//
//                    .receive(on: DispatchQueue.main).sink(receiveValue: { (data) in
//                        let dat = data as Date
//                print(dat)
//             })
            
            

       let textFieldPublisher =  NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: userName)
            .map( {
                ($0.object as? UITextField)?.text
            })    .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)

        
        textFieldPublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] value in
                print("UITextField.text changed to: \(value)")
            })
            .store(in: &cancellables)
        
        
        appDelegate  = UIApplication.shared.delegate as? AppDelegate
        print("core data viewDidLoad")
        
        let sub = URLSession.shared.dataTaskPublisher(for: url).tryMap { (data, response) in
         guard let httpResponse = response as? HTTPURLResponse,
             httpResponse.statusCode == 200 else {
                 throw URLError(.badServerResponse)
             }
        
         print("trymap")
         return data
         }.decode(type: HumanReviewOutputModel.self, decoder: JSONDecoder()).receive(on: RunLoop.main).sink(receiveCompletion: { print ("Received completion: \($0).") },
                  receiveValue: { humanReviewOutputModel in print ("Received value: \(humanReviewOutputModel.awsManagedHumanLoopRequestSource).")})
        
        cancellable1 = executeAPI(for: urlString, model : HumanReviewOutputModel.self).sink(receiveCompletion: { (error) in
            switch error
            {
            case .finished :
                    print("finished")
            case .failure(let error) :
                print("error")
            }
           
        }, receiveValue: { (model) in
            print("future succedded \(model.awsManagedHumanLoopRequestSource)")
        })
        // Do any additional setup after loading the view.
    }
        
//    func textFieldDidChangeSelection(_ textField: UITextField) {
//        print(textField.text)
//    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)

    }
    

   
    func showMessage(message : String)
    {let alert = UIAlertController(title: "Sign in", message: " \(message) ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler:nil
        ))
        self.present(alert, animated: true, completion: nil)
        
    }
   func signup()
    {
        let  context = appDelegate!.persistentContainer.viewContext
        let credentialsEntity =  NSEntityDescription.entity(forEntityName: "Credentials", in: context)
        let credentials = NSManagedObject(entity: credentialsEntity!, insertInto: context)

        credentials.setValue("admin1", forKey: "userName")
        credentials.setValue("password", forKey: "password")
        credentials.setValue(false, forKey: "active")
        
        persistentContainer?.saveContext()

    

        
    }
    
    func showSignupCompletionAlert()
    {
        let credentials  = getUserCredintialsFromStore()
        
        let alert = UIAlertController(title: "Signup successfull", message: "user name : \(credentials?.userName ?? "admin") \n password : \(credentials?.password ?? "password")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func getUserCredintialsFromStore() -> (userName : String, password :String)?
    {        let  context = appDelegate!.persistentContainer.viewContext
        
        let request =     NSFetchRequest<NSFetchRequestResult>(entityName: "Credentials")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        let predictate = NSPredicate( format: "userName == %@",  self.userName.text! )
        request.predicate = predictate
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
               print(data.value(forKey: "userName") as! String)
                return (data.value(forKey: "userName") as! String ,data.value(forKey: "password") as! String )
          }
            
        } catch {
            print("Failed")
        }
        return nil
    }
    
   
    func isValidCredentials() -> Bool
    {

        if let userName = self.userName.text ,
           let password = self.password.text,
           let credentials = getUserCredintialsFromStore()
        {
            return userName.elementsEqual(credentials.userName) &&
                password.elementsEqual(credentials.password)
        }
        else
        {
            return false
        }
        
    }
    
    
    
}
extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .eraseToAnyPublisher()
    }
    
}
