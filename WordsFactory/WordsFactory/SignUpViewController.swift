struct test: Codable{
    var accessToken: String
    var refreshToken: String
}

class SignUpViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var PasswordRepeatTextField: UITextField!
    
    @IBOutlet weak var testView: UIView!
    
    
    @IBOutlet weak var MessageEmail: UILabel!
    @IBOutlet weak var MessagePassword: UILabel!
    @IBOutlet weak var MessageRepeatPassword: UILabel!
    
    
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EmailTextField.delegate = self
        PasswordTextField.delegate = self
        PasswordRepeatTextField.delegate = self
        self.setupToHideKeyboardOnTapOnView()
        
        MessageEmail.isHidden = true
        MessagePassword.isHidden = true
        MessageRepeatPassword.isHidden = true
        
        
        
        SignUpButton.layer.cornerRadius = 28
        SignUpButton.addGradient()
        SignUpButton.addShadow()
        BackButton.layer.cornerRadius = 28
        BackButton.addShadow()
    }
    
    
    
    @IBAction func GoToStartScreenViewController(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
