//
//  UserDefaults.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 2.02.22.
//

import Foundation

@propertyWrapper
struct UserDefault<Value> {
    let key: String
    let defaultValue: Value
    let container = UserDefaults.standard
    
    var wrappedValue: Value {
        get {
            container.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
        }
    }
}
