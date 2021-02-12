//
//  CATextLayerViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 29/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

class CATextLayerViewController: UIViewController {
    var  textLayer  =  CATextLayer()
    private enum Constants {
      static let baseFontSize: CGFloat = 24.0
    }
   
    let noteworthyLightFont = CTFontCreateWithName("Noteworthy-Light" as CFString, Constants.baseFontSize, nil)
    
    let helveticaFont = CTFontCreateWithName("Helvetica" as CFString, Constants.baseFontSize, nil)
    
    @IBOutlet weak var viewForTextLayer : UIView!
    @IBOutlet weak var alignmentSegmnetControl : UISegmentedControl!
    @IBOutlet weak var fontSegmentControl : UISegmentedControl!
    @IBOutlet weak var truncationSegmentControl : UISegmentedControl!
    @IBOutlet weak var fontSizeSliderLabel            : UILabel!
    @IBAction func onWrapTextSwitchToggled(sender : UISwitch) {
        textLayer.isWrapped = sender.isOn
    }
    enum Font : Int {
        case helvetica = 0,noteworthLight = 1
    }
        
    enum TextTruncation : Int {
        case start, middle, end
    }
    enum TextAlignment : Int
    {
        case  left,center,justified,right
    }
    
    var calyer = CALayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextLayer()
         calyer.frame = viewForTextLayer.bounds
        calyer.backgroundColor = UIColor.black.cgColor
        viewForTextLayer.layer.addSublayer(calyer)
        viewForTextLayer.layer.addSublayer(textLayer)
        
        fontSizeSliderLabel.text = "\(Int(textLayer.fontSize ))%"
        fontSizeSliderLabel.backgroundColor = UIColor.green

    }
    
    func setUpTextLayer()
    {
        textLayer.frame = viewForTextLayer.bounds.inset(by: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2))
        let string = (1...20).map{_ in "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce auctor arcu quis velit congue dictum."}.joined(separator: " ")
//        textLayer.borderColor = UIColor.gray.cgColor
//        textLayer.borderWidth = 1
    
        textLayer.backgroundColor = UIColor.white.cgColor
        textLayer.string = string
        textLayer.font = helveticaFont
        
        textLayer.alignmentMode = .center
        textLayer.truncationMode = .start
        textLayer.foregroundColor = UIColor.gray.cgColor
        textLayer.isWrapped = true
        textLayer.fontSize = Constants.baseFontSize
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.cornerRadius = 10
        
          
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

extension CATextLayerViewController
{
    @IBAction func onFontsegmentControlChanged(sender : UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case Font.helvetica.rawValue :
            textLayer.font = helveticaFont
        case Font.noteworthLight.rawValue :
        textLayer.font = noteworthyLightFont
        default :
            textLayer.font = helveticaFont
        }
        
    }
   
    @IBAction func onFontSizeSliderChanged(sender : UISlider) {
        fontSizeSliderLabel.text = "\(Int(sender.value ))%"
        textLayer.fontSize = CGFloat(sender.value)

    }
    
}

extension CATextLayerViewController
{
    @IBAction func onTruncationSegmentChanged(sender : UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case TextTruncation.start.rawValue:
            textLayer.truncationMode = .start
        case TextTruncation.middle.rawValue :
        textLayer.truncationMode = .middle
        case TextTruncation.end.rawValue :
        textLayer.truncationMode = .end
        default:
            textLayer.truncationMode = .start
        }
    }
    
    @IBAction func onAlignmentSegmentChanged(sender : UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case TextAlignment.left.rawValue:
            textLayer.alignmentMode = .left
        case TextAlignment.center.rawValue :
            textLayer.alignmentMode = .center
        case TextAlignment.justified.rawValue :
        textLayer.alignmentMode = .justified
        case TextAlignment.right.rawValue :
        textLayer.alignmentMode = .right
        default :
            textLayer.alignmentMode = .center
        }
    }
    
}

