//
//  main.swift
//  ReadData
//
//  Created by Ankita Pabbi on 2019-06-14.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import Foundation

print("Hello, World!")

func readJsonFile(jsonFileName: String){
    let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
    guard let jsonData = url else {return} // error handling guaurd let is used instread of if let
    
    guard let data = try? Data(contentsOf: jsonData) else
    {return}
    
    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
        return}
    print(json)
    //----------------------------------
    
    var user = User()
    if let jsonDictionary = json as? [String: Any]{
        if let email = jsonDictionary["email"] as? String{
            print(email)
            user.email = email
        }
        if let name = jsonDictionary["name"] as? String{
            print(name)
            user.name = name
        }
        var address : Address
        if let addressDict = jsonDictionary["address"] as? Dictionary<String, Any>{
            address = Address()
           if let city = addressDict["city"] as? String
           {
            print("city",city)
            address.city = city
            }
        
        // read geo dictionary
        
        var geo: Geo
        if let geoDict = addressDict["geo"] as? Dictionary<String, Any>{
                geo = Geo()
                if let lat = geoDict["lat"] as? String{
                    print("lat is : ",lat)
                    geo.lat = lat
                }
                if let lng = geoDict["lng"] as? String{
                    print("lng is : ",lng)
                    geo.lng = lng
                }
                address.geo = geo
            }
        
           user.address = address
        }
        
        // read company Dictionary
        var company = Company()
        if let companyDict = jsonDictionary["company"] as? Dictionary<String, Any>{
            
            if let bs = companyDict["bs"] as? String{
                print("bs is : ",bs)
                company.bs = bs
            }
            if let catchPhrase = companyDict["catchPhrase"] as? String{
                print("catch phrase : ",catchPhrase)
                company.catchPhrase = catchPhrase
            }
            if let name = companyDict["name"] as? String{
                print("name : ",name)
                company.name = name
            }
            
        }
    }
}
//readJsonFile(jsonFileName: "Users")


func readJsonFileArray(jsonFileName: String){
    let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
    guard let jsonData = url else {return} // error handling guaurd let is used instread of if let
    
    guard let data = try? Data(contentsOf: jsonData) else
    {return}
    
    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
        return}
    print(json)
    //----------------------------------
    
    var user = User()
    if let jsonDictionary = json as? [String: Any]{
        if let email = jsonDictionary["email"] as? String{
            print(email)
            user.email = email
        }
        if let name = jsonDictionary["name"] as? String{
            print(name)
            user.name = name
        }
        var address : Address
        if let addressDict = jsonDictionary["address"] as? Dictionary<String, Any>{
            address = Address()
            if let city = addressDict["city"] as? String
            {
                print("city",city)
                address.city = city
            }
            
            // read geo dictionary
            
            var geo: Geo
            if let geoDict = addressDict["geo"] as? Dictionary<String, Any>{
                geo = Geo()
                if let lat = geoDict["lat"] as? String{
                    print("lat is : ",lat)
                    geo.lat = lat
                }
                if let lng = geoDict["lng"] as? String{
                    print("lng is : ",lng)
                    geo.lng = lng
                }
                address.geo = geo
            }
            
            user.address = address
        }
        
        // read company Dictionary
        var company = Company()
        if let companyDict = jsonDictionary["company"] as? Dictionary<String, Any>{
            
            if let bs = companyDict["bs"] as? String{
                print("bs is : ",bs)
                company.bs = bs
            }
            if let catchPhrase = companyDict["catchPhrase"] as? String{
                print("catch phrase : ",catchPhrase)
                company.catchPhrase = catchPhrase
            }
            if let name = companyDict["name"] as? String{
                print("name : ",name)
                company.name = name
            }
            
        }
    }
}




//func readTextFile(fileName: String){
//    if let url = Bundle.main.path(forResource: "Sample", ofType: "txt")
//    {
//        do{
//            let text = try String(contentsOf: pathOfText){
//           }
//            catch
//            {
//                print("Error while reading text file")
//            }
//    }
//}
