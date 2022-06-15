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
    
    fileprivate func chechEmail() {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        if (EmailTextField.text == "") {
            MessageEmail.isHidden = false
            MessageEmail.text = "Заполните поле!"
        }
        else if (NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: EmailTextField.text) == false) {
            MessageEmail.isHidden = false
            MessageEmail.text = "Введите корректный E-mail!"
        }
    }
    
    fileprivate func checkPassword() {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%.*?&#])[A-Za-z\\dd$@$!%.*?&#]{8,}"
        if (PasswordTextField.text == "") {
            MessagePassword.isHidden = false
            MessagePassword.text = "Заполните поле!"
        }
        else if (NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: PasswordTextField.text) == false) {
            MessagePassword.isHidden = false
            MessagePassword.text = "Формат пароля:[a-z A-Z 0-9 $@$!%.*?&#]"
        }
    }
    
    
    fileprivate func checkRepeatPassword() {
        if (PasswordRepeatTextField.text == "") {
            MessageRepeatPassword.isHidden = false
            MessageRepeatPassword.text = "Повторите пароль!"
        }
        else if (PasswordTextField.text != PasswordRepeatTextField.text) {
            MessageRepeatPassword.isHidden = false
            MessageRepeatPassword.text = "Пароли не совпадают!"
        }
    }
}
