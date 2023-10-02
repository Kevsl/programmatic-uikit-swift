import UIKit

let defaults = UserDefaults.standard


func setupUDString(_ value:String,_ key:String  ){
    defaults.set(value, forKey: key)
}

func readUDString(_ key: String) -> String{
    
    guard let selectedString = defaults.string(forKey: key) else{
        return "error"
    }
    
return selectedString


}


//
//defaults.set("voiture", forKey: "Vehicle")
//
//defaults.string(forKey: "Vehicle")
