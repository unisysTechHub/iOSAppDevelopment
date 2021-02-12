//
//  ChildAnimationViewController.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 24/09/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import UIKit

class CALayerAnimationViewController: UITableViewController {
   
    
    @IBOutlet weak var contentGravityLabel: UILabel!
    @IBOutlet weak var contentGravityPickerView : UIPickerView!
    @IBOutlet  var switches : [UISwitch]!
    @IBOutlet  var slideLabesl :[UILabel]!
    @IBOutlet  var slides : [UISlider]!
    
    enum Switch : Int
    {
        case displayContents,geometryFlipped,hidden
    }
    enum SlideLables {
        case opacity, cornerRadious
    }
    
    enum Slider : Int
    {
        case opacity,cornerRadious
    }
    var layerViewController : CALayerViewController?
    var contentGravityPickerVisible = false
    var contentGravityValues : [CALayerContentsGravity] = [.right, .top,.center,.bottom,.left,.topLeft]
    override func viewDidLoad() {
        super.viewDidLoad()
        contentGravityPickerView.delegate = self
        initiazeSliderLabels()
        // Do any additional setup after loading the view.
    }
   
    enum Row : Int {
        case contentGravity , contentGravityPickerView,geometryFlipped,hidden
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = Row(rawValue: indexPath.row)
        if row == Row.contentGravityPickerView{
           return contentGravityPickerVisible ? 144 : 0
        }
        else{
        return 44.0
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = Row(rawValue: indexPath.row)
        
        switch row {
        case .contentGravity where !contentGravityPickerVisible :
            showContetGravityPickerView()
        default:
            hideContentsGravityPicker()
            
        }
    }
    
}
extension CALayerAnimationViewController
{
    @IBAction func switchChanged(_ sender: UISwitch) {
        let switchesArrary = self.switches as NSArray
        
       let theSwitch = Switch(rawValue : switchesArrary.index(of: sender))!
       
       switch theSwitch {
        case .displayContents:
            layerViewController?.myView.layer.sublayers![0].contents = sender.isOn ? UIImage(named: "star")?.cgImage : nil
            
       case .geometryFlipped:
        layerViewController?.layer.isGeometryFlipped = sender.isOn
       case .hidden :
       layerViewController?.layer.isHidden = sender.isOn
       }
    }
    
    @IBAction func slidebarDragged(_ sender: UISlider) {
        let slideArray = slides as NSArray
        let slideIndex = slideArray.index(of: sender)
        let theslide = Slider(rawValue: slideIndex )!
        switch theslide {
        case .opacity :
        layerViewController?.layer.opacity = sender.value
        case .cornerRadious :
            layerViewController?.layer.cornerRadius = CGFloat(sender.value)
        }
    
        updateSliderLabel(index: slideIndex)

    }
}
extension CALayerAnimationViewController : UIPickerViewDelegate
{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        contentGravityLabel.text = contentGravityValues[row].rawValue
        layerViewController?.layer.contentsGravity = CALayerContentsGravity(rawValue: contentGravityValues[row].rawValue)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        contentGravityValues[row].rawValue
    }
}
extension CALayerAnimationViewController : UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        contentGravityValues.count
    }
    
        
}

extension CALayerAnimationViewController
{
    func showContetGravityPickerView()
    {
        contentGravityPickerView.isHidden = false
        contentGravityPickerVisible = true
        relayoutTableViewCells()
        let index = contentGravityValues.firstIndex(of: (layerViewController?.layer.contentsGravity)!) ?? 0
        contentGravityPickerView.selectRow(index, inComponent: 0, animated: false)
        contentGravityPickerView.alpha = 0.0
        
        
        UIView.animate(withDuration: 0.25) {
          self.contentGravityPickerView.alpha = 1.0
        }
    }
    
    func hideContentsGravityPicker() {
      if contentGravityPickerVisible {
        tableView.isUserInteractionEnabled = false
        contentGravityPickerVisible = false
        relayoutTableViewCells()

        UIView.animate(
          withDuration: 0.25,
          animations: {
            self.contentGravityPickerView.alpha = 0.0
          }, completion: { _ in
            self.contentGravityPickerView.isHidden = true
            self.tableView.isUserInteractionEnabled = true
          })
      }
    }
}

extension CALayerAnimationViewController
{
    func initiazeSliderLabels()
    {
        for index in Slider.opacity.rawValue...Slider.cornerRadious.rawValue {
                updateSliderLabel(index: index)
        }

    }
    func updateSliderLabel(index : Int)
    {
        let theSlider = Slider(rawValue: index)!
        switch theSlider
        {
        case .opacity :
            slideLabesl[index].text = String(format: "%.1f",slides[index].value)
        case .cornerRadious :
          slideLabesl[index].text = "\(Int(slides[index].value))"
        }
        
    }
    func relayoutTableViewCells() {
      tableView.beginUpdates()
      tableView.endUpdates()
    }
}
