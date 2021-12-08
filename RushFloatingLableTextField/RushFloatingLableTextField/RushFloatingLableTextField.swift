//
//  RushFloatingLableTextField.swift
//


import UIKit


enum TextFieldType{
    case normal
    case email
}


class RushFloatingLableTextField: UITextField, UITextFieldDelegate {
    
    var titleLabel = UILabel()
    var lineView = UILabel()
    var viewicon = UIImageView()
    
    
    //Mark:- defin if the app is LTR or RTL
    var isLTRLanguage: Bool = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight {
        didSet{
            updateTextAligment()
        }
    }
    func updateTextAligment() {
        if isLTRLanguage {
            textAlignment = .left
            titleLabel.textAlignment = .left
        } else {
            textAlignment = .right
            titleLabel.textAlignment = .left
        }
    }
    
    
    //Mark:- Assign Lowercased Litters
    var lowercased: Bool = false
    //Mark:- Assign TextField Type
    open var type: TextFieldType = .normal
    
    
    //Mark:- Assign Email validation
    open var isValid:Bool = true
    func emailIsValid() {
        if isValid{
            Cashedtintcolor = disabledColor
        } else {
            Cashedtintcolor = .red
        }
    }
    
    
    //Mark:- Assign TextField tintColor
    open var Cashedtintcolor: UIColor?
    open override var tintColor: UIColor? {
        set {
            super.tintColor = newValue
            Cashedtintcolor = super.tintColor
        }
        get {
            return super.tintColor
        }
    }
    
    
    //Mark:- Assign TextField textColor
    fileprivate var CashedTextColor: UIColor?
    open override var textColor: UIColor? {
        set {
            super.textColor = newValue
            CashedTextColor = super.textColor
        }
        get {
            return super.textColor
        }
    }
    
    
    
    //Mark:- Assign TextField Font
    fileprivate var newfont: UIFont?
    open override var font: UIFont? {
        set {
            newfont = newValue
        }
        get {
            return newfont
        }
    }
    
    //Mark:- Assign TextField disabled Color
    fileprivate var disabledColor: UIColor = .lightGray
    
    open var emptyTextColor: UIColor = .lightGray
    open var filledTextColor: UIColor = .lightGray
    
    
    //Mark:- update colors when is enabled changed
    override open var isEnabled: Bool {
        didSet {
            colorControl()
        }
    }
    
    
    //Mark:-
    fileprivate func colorControl(){
        if !isEnabled {
            titleLabel.textColor = disabledColor
            lineView.backgroundColor = disabledColor
        } else {
            guard let Tintcolor = Cashedtintcolor else {
                return
            }
            // lineView.backgroundColor = Tintcolor
            titleLabel.textColor = Tintcolor
        }
    }
    
    //Mark:- Change tintColor 
    func updateTintColor(){
        Cashedtintcolor = disabledColor
    }
    
    
    //Mark:- Assign the height of TitleLabel from it's text
    fileprivate func titleHeight() -> CGFloat {
        let font = titleLabel.font
        return font!.lineHeight
    }
    
    //Mark:- Update Placeholder Color
    open var placeHolderColor:UIColor = .lightGray
    fileprivate func placeHolderColor(_ color : UIColor) {
        let PlaceholderText = NSAttributedString(string: placeholder ?? "",
                                                 attributes: [NSAttributedString.Key.foregroundColor: color])
        self.attributedPlaceholder = PlaceholderText
    }
    
    //Mark:- Idenfifies whether TextField can Hide the text for securing Password
    override open var isSecureTextEntry: Bool {
        set{
            super.isSecureTextEntry = newValue
        }
        get {
            return super.isSecureTextEntry
        }
    }
    
    
    
    //--------------------------------------------------------
    //--------------------------------------------------------
    //--------------------------------------------------------
    
    //Mark:- Add RushFloatingTextField SetUp to SubView
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        setUpTextField()
        
    }
    
    
    //Mark:- SetUp RushFloatingTextField
    fileprivate func setUpTextField(){
        self.autocorrectionType = .no
        borderStyle = .none
        delegate = self
        
        if text != "" {
            animateLableUp()
            colorControl()
            enableBorderColor()
        }
        
        if isSecureTextEntry {
            createViewIcon()
        }
        createTitleLabel()
        createBorder()
        updateTextAligment()
        updateLabelFont()
        updateText()
        addEditingChangedObserver()
        placeHolderColor(placeHolderColor)
        
        
    }
    
    
    
    
    //Mark:- Creat Lable and Add it to TextField
    fileprivate func createTitleLabel() {
        self.addSubview(titleLabel)
    }
    
    //Mark:- Creat Bottom Line to TextField
    fileprivate func createBorder() {
        //        disableBorderColor()
        let line  = UIView(frame: CGRect(x: 0, y: self.frame.height-1 , width: self.frame.width, height: 1))
        line.backgroundColor = emptyTextColor
        self.addSubview(line)
        self.addSubview(lineView)
    }
    
    //Mark:- Remove Bottom Line from TextField
    fileprivate func disableBorderColor() {
        lineView.frame = CGRect(x: 0, y: self.frame.height-1 , width: self.frame.width, height: 1)
        lineView.backgroundColor = emptyTextColor
        
    }
    //Mark:- Add Bottom Line to TextField
    fileprivate func enableBorderColor() {
        lineView.frame = CGRect(x: 0, y: self.frame.height-2 , width: self.frame.width, height: 2)
        lineView.backgroundColor = Cashedtintcolor
    }
    
    
    //Mark:- Setup placeholder text
    open var cashedtitleLableText:String = ""
    open var titleLableText:String = ""
    override var placeholder: String? {
        set{
            super.placeholder = newValue
            titleLableText = super.placeholder!
        }
        get {
            return super.placeholder
        }
    }
    
    
    
    //Mark:- Update TitleLabel Text to equal The same text of TextField placeholder and to the text color be the same of TextField Tint color
    fileprivate func updateText(){
        cashedtitleLableText = titleLableText
        titleLabel.text = titleLableText.uppercased()
        titleLabel.textColor = Cashedtintcolor
    }
    //Mark:- Update TitleLabel Font to equal The same Font name of TextField  but with different font Size
    fileprivate func updateLabelFont(){
        guard let font = self.newfont else {
            return
        }
        titleLabel.font = UIFont(name: font.fontName, size: 13)
    }
    
    //--------------------------------------------------------
    
    //Mark:- Creat View Iconn for Password TextField
    fileprivate func createViewIcon() {
        let height = self.frame.size.height
        let width = self.frame.size.width
        viewicon.frame = CGRect(x: width - height / 2  , y: height / 4, width: height / 2, height: height / 2)
        viewicon.image = UIImage(named: "view_on")
        setImageTintColor(imageview: viewicon, color: disabledColor)
        
        viewicon.isUserInteractionEnabled = true
        let viewIconGesture = UITapGestureRecognizer(target: self, action: #selector(viewIconTapped))
        viewIconGesture.numberOfTapsRequired = 1
        viewicon.addGestureRecognizer(viewIconGesture)
        self.addSubview(viewicon)
    }
    
    //Mark:- Tap Actions for password textField View Icon
    @objc func viewIconTapped(_ sender : UITapGestureRecognizer){
        
        if isSecureTextEntry {
            viewicon.image = UIImage(named: "view_of")
            setImageTintColor(imageview: viewicon, color: disabledColor)
            isSecureTextEntry = false
        } else {
            viewicon.image = UIImage(named: "view_on")
            setImageTintColor(imageview: viewicon, color: disabledColor)
            isSecureTextEntry = true
        }
    }
    
    //--------------------------------------------------------
    
    //Mark:- Define padding for password TextField
    var passPadding = UIEdgeInsets(
        top: 0,
        left: 5,
        bottom: 3,
        right: 25
    )
    //Mark:- Define padding for TextField
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 5,
        bottom: 3,
        right: 0
    )
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        if isSecureTextEntry {
            return rect.inset(by: passPadding)
        } else {
            return rect.inset(by: textPadding)
        }
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        if isSecureTextEntry {
            return rect.inset(by: passPadding)
        } else {
            return rect.inset(by: textPadding)
        }
    }
    
    //--------------------------------------------------------
    //--------------------------------------------------------
    
    
    //Mark:- Add Editing Change Observer to Make TitleLable Animation
    var isUp: Bool = false
    fileprivate func addEditingChangedObserver() {
        self.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    
    //Mark:-
    
    
    @objc open func editingChanged() {
        if text == "" {
            isUp = false
            Cashedtintcolor = emptyTextColor
            animateLableDown()
            enableBorderColor()
        } else {
            Cashedtintcolor = tintColor
            if lowercased {
                text = text?.lowercased()
            }
            if isUp {
                if type == .email {
                    if let text = text {
                        if isValidEmail(text){
                            Cashedtintcolor = tintColor
                            titleLableText = placeholder!
                            isValid = true
                        } else {
                            titleLableText = "Email not Valid"
                            Cashedtintcolor = .red
                            isValid = false
                        }
                    }
                } else {
                    
                }
            } else {
                animateLableUp()
                enableBorderColor()
                isUp = true
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if self.text != ""{
            if type == .email {
                if isValid{
                    Cashedtintcolor = tintColor
                } else {
                    Cashedtintcolor = .red
                }
            } else {
                Cashedtintcolor = tintColor
                enableBorderColor()
                updateText()
            }
        } else {
           
            Cashedtintcolor = emptyTextColor
            enableBorderColor()
        }
    }
    //Mark:- Assign Animation Setting when textField End Editing
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        if text == "" {
            disableBorderColor()
            Cashedtintcolor = emptyTextColor

        } else {
           // updateTintColor()
            enableBorderColor()
            animateLableUp()
           emailIsValid()
            Cashedtintcolor = filledTextColor

            if lowercased {
                text = text?.lowercased()
            }
            
        }
    }
   
    
    //Mark:- Animate TitleLabel Up and show
    fileprivate func animateLableUp(){
        UIView.animate(withDuration: 0.2) {
            self.titleLabel.alpha = 1.0
            self.titleLabel.frame = CGRect(x: 0, y: -self.titleHeight() , width: self.frame.size.width, height: self.titleHeight())
        }
    }
    
    //Mark:- Animate TitleLabel down and hide
    fileprivate func animateLableDown(){
        UIView.animate(withDuration: 0.2) {
            self.titleLabel.alpha = 0.0
            self.titleLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.titleHeight())
        }
    }
    
    
    //--------------------------------------------------------
    //--------------------------------------------------------
    //--------------------------------------------------------
    
    
    
    
    //Mark:- Change icon tint color
    fileprivate func setImageTintColor(imageview: UIImageView, color: UIColor){

        let templateImage = imageview.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        imageview.image = templateImage
        imageview.tintColor = color
    }
    
    //Mark:- Validation
    fileprivate func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
    
    
    
}
