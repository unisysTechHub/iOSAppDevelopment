//
//  ProfileDataModel.swift
//  IOSAppDevelopment
//
//  Created by Ramesh kumar penta on 08/12/20.
//  Copyright © 2020 Ramesh kumar penta. All rights reserved.
//

import Foundation

class ProfileDataModel {
    var lastUpdated  = Date()
}
@dynamicMemberLookup
class UserModel : Decodable {
    var id: Int?
    var name: String?
    var username : String?
    
    var email : String?
    var   address : AddressModel?
    var    phone : String?
    var    website:String?
     var   company: CompanyModel?
    
    subscript<T>(dynamicMember member: KeyPath<AddressModel, T>) -> T {
        get { return address![keyPath: member] }
    }
    subscript<T>(dynamicMember member: KeyPath<GeoModel, T>) -> T {
        get { return address!.geo![keyPath: member] }
    }
    subscript<T>(dynamicMember member: KeyPath<CompanyModel, T>) -> T {
        get { return company![keyPath: member] }
    }
}

class AddressModel : Decodable
{
    
    var street :String?
    var  suite : String?
    var city : String?
    var zipcode: String?
    var geo : GeoModel?
    
}

class GeoModel: Decodable
{
    var  lat :String?
     var lng: String?
    
}

class CompanyModel : Decodable
{
   var organization: String?
   var catchPhrase:  String?
   var bs: String?
    enum  CodingKeys : String, CodingKey {
        case organization = "name"
        
    }
}

var compnayNameKeyPath : ReferenceWritableKeyPath<UserModel,String> = \UserModel.company!.organization!
var zipCodeKeyPath = \UserModel.address?.zipcode
var lngKeyPath = \UserModel.address?.geo?.lng

var addressKeyPath = \UserModel.address!
let zipCodeCompositionKeyPath  = addressKeyPath.appending(path: \AddressModel.zipcode)
var usermetaData : [PartialKeyPath<UserModel>] = []

func adduserMetadataKeyPaths()
 {
    usermetaData.append(\UserModel.name)
    usermetaData.append(\UserModel.username)
    usermetaData.append(\UserModel.address?.zipcode)
    
 }

func printUserMetaData(user : UserModel)
{
    print("organziation name \(user.organization)")
    for metaData in usermetaData
    {
        print(user[keyPath: metaData])
    }
}
