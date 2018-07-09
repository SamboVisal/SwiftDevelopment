
import UIKit

class DialPadController: UIViewController {
    
    let dialPadPropertype = DialPadPropertype()
    
    private var textFieldFrame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 0.18, pY: 0.25, w: self.view.frame.width*0.89, h: self.view.frame.height*0.16)
    }
    
    private var squareCancelBtn : CGRect {
        
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 1.42, pY: 0.1, w: self.view.frame.width*0.18, h: self.view.frame.height*0.086 )
        
    }
    
    private var text1Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 0.3, pY: 0.60, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    private var text2Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 0.85, pY: 0.60, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    private var text3Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 1.4, pY: 0.60, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    private var text4Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 0.3, pY: 0.85, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    private var text5Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 0.85, pY: 0.85, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    private var text6Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 1.4, pY: 0.85, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    private var text7Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 0.3, pY: 1.1, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    private var text8Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 0.85, pY: 1.1, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    private var text9Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 1.4, pY: 1.1, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    
    private var text10Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 0.3, pY: 1.35, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    private var text0Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 0.85, pY: 1.35, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    private var text11Frame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 1.4, pY: 1.35, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }
    
    private var callFrame: CGRect {
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        return View.squareFrame(midX: midX
            , midY: midY, pX: 0.85, pY: 1.6, w: self.view.frame.width*0.19607843, h: self.view.frame.height*0.0862069 )
    }

   

    

}

// APP Lycel
extension DialPadController {
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        keypadPropertypeFunc()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        keypadPropertypeFrame()
    }
    
    
    
}

// APP UI
extension DialPadController {
    
    func keypadPropertypeFrame() {
        self.dialPadPropertype.textField.frame = self.textFieldFrame
        self.dialPadPropertype.cancelBtn.frame = squareCancelBtn
        self.dialPadPropertype.textField.rightView = self.dialPadPropertype.cancelBtn
        self.dialPadPropertype.textField.rightViewMode = .always
    
        
        self.dialPadPropertype.text1.frame = self.text1Frame
        self.dialPadPropertype.text1.layer.cornerRadius = 0.5 * self.dialPadPropertype.text1.bounds.size.width
        self.dialPadPropertype.text1.clipsToBounds = true
        
        self.dialPadPropertype.text2.frame = self.text2Frame
        self.dialPadPropertype.text2.layer.cornerRadius = 0.5 * self.dialPadPropertype.text2.bounds.size.width
        self.dialPadPropertype.text2.clipsToBounds = true
        
        self.dialPadPropertype.text3.frame = self.text3Frame
        self.dialPadPropertype.text3.layer.cornerRadius = 0.5 * self.dialPadPropertype.text3.bounds.size.width
        self.dialPadPropertype.text3.clipsToBounds = true
        
        self.dialPadPropertype.text4.frame = self.text4Frame
        self.dialPadPropertype.text4.layer.cornerRadius = 0.5 * self.dialPadPropertype.text4.bounds.size.width
        self.dialPadPropertype.text4.clipsToBounds = true
        
        self.dialPadPropertype.text5.frame = self.text5Frame
        self.dialPadPropertype.text5.layer.cornerRadius = 0.5 * self.dialPadPropertype.text5.bounds.size.width
        self.dialPadPropertype.text5.clipsToBounds = true
        
        self.dialPadPropertype.text6.frame = self.text6Frame
        self.dialPadPropertype.text6.layer.cornerRadius = 0.5 * self.dialPadPropertype.text6.bounds.size.width
        self.dialPadPropertype.text6.clipsToBounds = true
        
        self.dialPadPropertype.text7.frame = self.text7Frame
        self.dialPadPropertype.text7.layer.cornerRadius = 0.5 * self.dialPadPropertype.text7.bounds.size.width
        self.dialPadPropertype.text7.clipsToBounds = true
        
        self.dialPadPropertype.text8.frame = self.text8Frame
        self.dialPadPropertype.text8.layer.cornerRadius = 0.5 * self.dialPadPropertype.text8.bounds.size.width
        self.dialPadPropertype.text8.clipsToBounds = true
        
        self.dialPadPropertype.text9.frame = self.text9Frame
        self.dialPadPropertype.text9.layer.cornerRadius = 0.5 * self.dialPadPropertype.text9.bounds.size.width
        self.dialPadPropertype.text9.clipsToBounds = true
        
        
        
        self.dialPadPropertype.text10.frame = self.text10Frame
        self.dialPadPropertype.text10.layer.cornerRadius = 0.5 * self.dialPadPropertype.text10.bounds.size.width
        self.dialPadPropertype.text10.clipsToBounds = true
        
        self.dialPadPropertype.text0.frame = self.text0Frame
        self.dialPadPropertype.text0.layer.cornerRadius = 0.5 * self.dialPadPropertype.text0.bounds.size.width
        self.dialPadPropertype.text0.clipsToBounds = true
        
        self.dialPadPropertype.text11.frame = self.text11Frame
        self.dialPadPropertype.text11.layer.cornerRadius = 0.5 * self.dialPadPropertype.text11.bounds.size.width
        self.dialPadPropertype.text11.clipsToBounds = true
        
        self.dialPadPropertype.call.frame = self.callFrame
        self.dialPadPropertype.call.layer.cornerRadius = 0.5 * self.dialPadPropertype.call.bounds.size.width
        self.dialPadPropertype.call.clipsToBounds = true
        
        
       
        
    }
    
    func keypadPropertypeFunc() {
        
        self.view.addSubview(dialPadPropertype.text1)
        self.view.addSubview(dialPadPropertype.text2)
        self.view.addSubview(dialPadPropertype.text3)
        self.view.addSubview(dialPadPropertype.text4)
        self.view.addSubview(dialPadPropertype.text5)
        self.view.addSubview(dialPadPropertype.text6)
        self.view.addSubview(dialPadPropertype.text7)
        self.view.addSubview(dialPadPropertype.text8)
        self.view.addSubview(dialPadPropertype.text9)
        self.view.addSubview(dialPadPropertype.text10)
        self.view.addSubview(dialPadPropertype.text0)
        self.view.addSubview(dialPadPropertype.text11)
        self.view.addSubview(dialPadPropertype.call)
        self.view.addSubview(dialPadPropertype.textField)
    }
}
