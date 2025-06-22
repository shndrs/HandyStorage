//
//  HandyStorageCore.swift
//  HandyStorage
//
//  Created by shndrs on 12/2/24.
//

import Foundation

// MARK: - Local Database Core

final public class HandyStorageCore: NSObject {
    
    public var current: UserDefaults {
        return defaults
    }
    
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    // MARK: - Get and Set String Data to Database
    ///
    
    subscript(key: String) -> String? {
        get {
            defaults.synchronize()
            return defaults.string(forKey: key)
        } set {
            defaults.synchronize()
            defaults.set(newValue, forKey: key)
            defaults.synchronize()
        }
    }
    
}
