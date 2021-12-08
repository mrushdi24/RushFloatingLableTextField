

import UIKit

class HomeVC: UIViewController {
    
    
    var tintColor:UIColor = .systemBlue
    
    
    lazy var Title: RushFloatingLableTextField = {
        let title = RushFloatingLableTextField()
        title.textColor = .black
        title.tintColor = tintColor
        title.filledTextColor = .black
        title.emptyTextColor = .lightGray
        title.placeHolderColor = .lightGray
        title.placeholder = "Title"
        title.font = UIFont(name: "Arial", size: 16)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    
    lazy var FullName: RushFloatingLableTextField = {
        let fullname = RushFloatingLableTextField()
        fullname.textColor = .black
        fullname.tintColor = tintColor
        fullname.filledTextColor = .black
        fullname.emptyTextColor = .lightGray
        fullname.placeHolderColor = .lightGray
        fullname.placeholder = "Name"
        fullname.titleLableText = "Full NAme"
        fullname.font = UIFont(name: "Arial", size: 16)
        fullname.translatesAutoresizingMaskIntoConstraints = false
        return fullname
    }()
    
    
    lazy var Email: RushFloatingLableTextField = {
        let email = RushFloatingLableTextField()
        email.textColor = .black
        email.tintColor = tintColor
        email.filledTextColor = .black
        email.emptyTextColor = .lightGray
        email.placeHolderColor = .lightGray
        email.placeholder = "Email"
        email.lowercased = true
        email.titleLableText = "Email"
        email.type = .email
        email.keyboardType = .emailAddress
        email.font = UIFont(name: "Arial", size: 16)
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    
    lazy var Country: RushFloatingLableTextField = {
        let country = RushFloatingLableTextField()
        country.textColor = .black
        country.tintColor = tintColor
        country.filledTextColor = .black
        country.emptyTextColor = .lightGray
        country.placeHolderColor = .lightGray
        country.placeholder = "Country"
        country.font = UIFont(name: "Arial", size: 16)
        country.translatesAutoresizingMaskIntoConstraints = false
        return country
    }()
    
    
    lazy var Code: RushFloatingLableTextField = {
        let code = RushFloatingLableTextField()
        code.textColor = .black
        code.tintColor = tintColor
        code.filledTextColor = .black
        code.emptyTextColor = .lightGray
        code.placeHolderColor = .lightGray
        code.placeholder = "Code"
        code.keyboardType = .phonePad
        code.font = UIFont(name: "Arial", size: 16)
        code.translatesAutoresizingMaskIntoConstraints = false
        return code
    }()
    
    
    lazy var Phone: RushFloatingLableTextField = {
        let phone = RushFloatingLableTextField()
        phone.textColor = .black
        phone.tintColor = tintColor
        phone.filledTextColor = .black
        phone.emptyTextColor = .lightGray
        phone.placeHolderColor = .lightGray
        phone.placeholder = "Phone"
        phone.keyboardType = .phonePad
        phone.font = UIFont(name: "Arial", size: 16)
        phone.translatesAutoresizingMaskIntoConstraints = false
        return phone
    }()
    
    
    lazy var Password: RushFloatingLableTextField = {
        let password = RushFloatingLableTextField()
        password.textColor = .black
        password.tintColor = tintColor
        password.filledTextColor = .black
        password.emptyTextColor = .lightGray
        password.placeHolderColor = .lightGray
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.font = UIFont(name: "Arial", size: 16)
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    
    lazy var LoginButton: UIButton = {
        let login = UIButton(type: .system)
        login.setTitle("Login", for: .normal)
        let font = UIFont(name: "Arial", size: 17)
        login.titleLabel?.font =  font
        login.tintColor = .white
        login.backgroundColor = tintColor
        login.translatesAutoresizingMaskIntoConstraints = false
        login.layer.masksToBounds = true
        login.layer.cornerRadius = 7.0
        return login
    }()
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddSubViews()
        SetUpUI()
        setLayoutConstraint()
        setUpNavigationBar()
    }
    
    
    //Mark- AddSubViews
    func AddSubViews(){
        
        view.addSubview(Title)
        view.addSubview(FullName)
        view.addSubview(Country)
        view.addSubview(Code)
        view.addSubview(Phone)
        view.addSubview(Email)
        view.addSubview(Password)
        view.addSubview(LoginButton)
    }
    
    //Mark- SetUpUI
    func SetUpUI() {
        title = "Login"
        self.view.backgroundColor = .white
        
        self.view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(singletap))
        tap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tap)
    }
    
    //Mark- Setup NavigationBar
    func setUpNavigationBar(){
        self.setNavigationBar()
        self.showNavigation()
        self.clearNavigationBg()
        self.navigationLargTitle()
        self.navigationTintColor(tintColor: .black)
        
    }
    
    
    //Mark:- SetUpLayOutConstrain
    func setLayoutConstraint(){
        //Mark:- Title Layout Constrain
        NSLayoutConstraint.activate([
            Title.topAnchor.constraint(equalTo: view.topAnchor, constant: Screen.height / 8),
            Title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Screen.width / 8),
            Title.heightAnchor.constraint(equalToConstant: 30),
            Title.widthAnchor.constraint(equalToConstant: 50),
        ])
        //Mark:- FullName Layout Constrain
        NSLayoutConstraint.activate([
            FullName.topAnchor.constraint(equalTo: Title.topAnchor, constant: 0),
            FullName.leadingAnchor.constraint(equalTo: Title.trailingAnchor, constant: 25),
            FullName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(Screen.width / 8)),
            FullName.heightAnchor.constraint(equalTo: Title.heightAnchor),
        ])
        //Mark:- Country Layout Constrain
        NSLayoutConstraint.activate([
            Country.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 30),
            Country.leadingAnchor.constraint(equalTo: Title.leadingAnchor),
            Country.trailingAnchor.constraint(equalTo: FullName.trailingAnchor),
            Country.heightAnchor.constraint(equalTo: Title.heightAnchor),
        ])
        //Mark:- Code Layout Constrain
        NSLayoutConstraint.activate([
            Code.topAnchor.constraint(equalTo: Country.bottomAnchor, constant: 30),
            Code.leadingAnchor.constraint(equalTo: Country.leadingAnchor),
            Code.heightAnchor.constraint(equalTo: Title.heightAnchor),
            Code.widthAnchor.constraint(equalToConstant: 60),
        ])
        //Mark:- Phone Layout Constrain
        NSLayoutConstraint.activate([
            Phone.topAnchor.constraint(equalTo: Code.topAnchor, constant: 0),
            Phone.leadingAnchor.constraint(equalTo: Code.trailingAnchor, constant: 25),
            Phone.trailingAnchor.constraint(equalTo: Country.trailingAnchor),
            Phone.heightAnchor.constraint(equalTo: Title.heightAnchor),
        ])
        //Mark:- Email Layout Constrain
        NSLayoutConstraint.activate([
            Email.topAnchor.constraint(equalTo: Code.bottomAnchor, constant: 30),
            Email.leadingAnchor.constraint(equalTo: Country.leadingAnchor),
            Email.trailingAnchor.constraint(equalTo: Country.trailingAnchor),
            Email.heightAnchor.constraint(equalTo: Title.heightAnchor),
        ])
        //Mark:- Password Layout Constrain
        NSLayoutConstraint.activate([
            Password.topAnchor.constraint(equalTo: Email.bottomAnchor, constant: 30),
            Password.leadingAnchor.constraint(equalTo: Email.leadingAnchor),
            Password.trailingAnchor.constraint(equalTo: Email.trailingAnchor),
            Password.heightAnchor.constraint(equalTo: Title.heightAnchor),
        ])
        //Mark:- LoginButton Layout Constrain
        NSLayoutConstraint.activate([
            LoginButton.topAnchor.constraint(equalTo: Password.bottomAnchor, constant: Screen.height / 9),
            LoginButton.leadingAnchor.constraint(equalTo: Password.leadingAnchor),
            LoginButton.heightAnchor.constraint(equalToConstant: 40),
            LoginButton.widthAnchor.constraint(equalTo: Password.widthAnchor),
        ])
    }
    
    //Mark:- Actions
    @objc func singletap(){
        view.endEditing(true)
    }
    
    
    
}

