//
//  ResultBuilder.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 13/07/21.
//  Copyright © 2021 Ramesh kumar penta. All rights reserved.
//

import Foundation
@resultBuilder
struct SmoothieArrayBuilder {
     typealias Component = [Smoothie]
    static func buildExpression(_ element: Smoothie) -> Component {
        return [element]
    }
    static func buildOptional(_ component: Component?) -> Component {
        guard let component = component else { return [] }
        return component
    }
    static func buildEither(first component: Component) -> Component {
        return component
    }
    static func buildEither(second component: Component) -> Component {
        return component
    }
    static func buildArray(_ components: [Component]) -> Component {
        return Array(components.joined())
    }
    static func buildBlock(_ components: Component...) -> Component {
        return Array(components.joined())
    }
    static func buildExpression(_ expression: Void) -> SmoothieBuilder.Component {
        
        return []
    }
}


class Smoothie {
    var id : String
    var title : String
    var description : String
    var ingrediants : [MeasuredIngrediant]
    init(id : String,title : String, @SmoothieBuilder _ makeIngrediants : () -> (String,[MeasuredIngrediant])) {
        self.id = id
        self.title = title
        let (description, ingrediants) = makeIngrediants()
        self.description = description
        self.ingrediants = ingrediants
    }
}
extension Smoothie {
    
}

enum Ingrediant {
    case orange
    case avocado
    case blueBerry
}

class MeasuredIngrediant {
    var ingrediant : Ingrediant
    var measurement : Measurement<UnitVolume>
    init(_ ingrediant : Ingrediant, measurment : Measurement<UnitVolume>) {
        self.ingrediant = ingrediant
        self.measurement = measurment
    }
   
}

extension Ingrediant {
    func mesure(with unit : UnitVolume) -> MeasuredIngrediant {
        MeasuredIngrediant(self,measurment: Measurement(value: 1, unit: unit))
    }
}

extension MeasuredIngrediant {
    func scale(by scale : Double) -> MeasuredIngrediant {
        MeasuredIngrediant( ingrediant,measurment: self.measurement * scale)
    }
}

@SmoothieArrayBuilder
func all(includedPaid : Bool) -> [Smoothie] {
    Smoothie(id: "berry-blue", title: "Berry Blue") {
        "Test"
        Ingrediant.avocado.mesure(with: .cups).scale(by: 1.5)
    }
    Smoothie(id: "berry-blue", title: "Berry Blue") {
        "Test"
        Ingrediant.avocado.mesure(with: .cups).scale(by: 1.5)
    }
    if includedPaid {
        Smoothie(id: "berry-blue", title: "Berry Blue") {
            "Test"
            Ingrediant.avocado.mesure(with: .cups).scale(by: 1.5)
        }
        Smoothie(id: "berry-blue", title: "Berry Blue") {
            "Test"
            Ingrediant.avocado.mesure(with: .cups).scale(by: 1.5)
        }
    }
    
    
    
    }
    
    

@resultBuilder
enum SmoothieBuilder {
    typealias Component = [MeasuredIngrediant]
    
    @available(*, unavailable, message:  "first element must be string")
    static func buildBlock( _ components: Component) -> (String,Component) {
        fatalError()
    }
    static func buildBlock( _ description : String, _ components: Component) -> (String,Component) {
        return (description,components)
    }
    static func buildExpression(_ element: MeasuredIngrediant) -> Component {
        return [element]
    }
    
    static func buildExpression(_ element: String) -> String {
        return element
    }
    static func buildEither(first component: SmoothieBuilder.Component) -> SmoothieBuilder.Component {
        return component
    }
    
    static func buildEither(second component: SmoothieBuilder.Component) -> SmoothieBuilder.Component {
        return component
    }
    static func buildOptional(_ component: SmoothieBuilder.Component?) -> SmoothieBuilder.Component {
        guard let components = component else {
            return []
        }
        
        return components
    }
    
    
}



