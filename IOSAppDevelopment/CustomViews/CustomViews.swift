//
//  customViews.swift
//  GraphicsSwiftUI
//
//  Created by Ramesh kumar penta on 06/01/21.
//

import Foundation
import SwiftUI
class UnisysTextFieldViewModel : ObservableObject
{
    @Published var fullDivider : Bool = true
    @Published var halfDivider : Bool = false
    @Published var error : String? = nil
    @Published var validAmt : Bool = false
    public func setError(errorMessage error : String)
    {
        switch error {
        case  (let error) where error.isEmpty:
            self.validAmt = true

        default:
            self.validAmt = false

        }
        self.error = error

    }
    public func setFullDivider() {
        self.fullDivider = true
        self.halfDivider = false
    }
    public func setHalfDivider() {
        self.halfDivider = true
        self.fullDivider = false
    }

}
struct UnisysTextField : View
{
    @Environment(\.currencyFormatter) var currencyFormatter
    let label : String
    @Binding var currencyText : Double
    @ObservedObject var viewModel : UnisysTextFieldViewModel
    let  validateFn : (() -> Void)?
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack{
                
                TextField ("currenyText" ,
                           value: $currencyText, formatter: currencyFormatter,
                           onEditingChanged : self.setHalfDivider, onCommit: self.onCommitFn).padding(.init(top: 4, leading: 16, bottom: 0, trailing: 16))
                    .keyboardType(.numberPad)
            }
            
            Text(viewModel.error ?? "" ).padding(.init(top: 0, leading: 16, bottom: 0, trailing: 16)).lineLimit(1).foregroundColor(.red)
                        
            if viewModel.fullDivider {
                Divider().padding(.init(top: 0, leading: 0, bottom: 16, trailing: 16))
            }
            else if viewModel.halfDivider {
                Divider().padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))
            }
            
        }.cornerRadius(3.0).border(Color.gray, width: 1)
    }
    
    func setHalfDivider(vlaue : Bool) {
        
        if self.viewModel.fullDivider {
            viewModel.setHalfDivider()
        }
        
    }
    func onCommitFn() {
        self.validateFn!()
        
    }
    
}


struct UnisysTextView_Previews: PreviewProvider {
    static var previews: some View {
        UnisysTextField(label :"label",currencyText: State(initialValue: 0.0).projectedValue,viewModel : UnisysTextFieldViewModel(),validateFn: {})
    }
}

struct LibraryViewContent: LibraryContentProvider {
    @available(iOS 14.0, *)
    var views: [LibraryItem] {
        LibraryItem(UnisysTextField(label : "label",currencyText: State(initialValue: 0.0).projectedValue,viewModel: UnisysTextFieldViewModel(),validateFn: {}))
    }
}

struct SomeTextView : View
{
    var body: some View
    {
        Text("")
    }
}

