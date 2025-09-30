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
        /// - Note: `synchronize()` is a method that forces UserDefaults to write any unsaved changes to disk immediately.
        ///         Normally, UserDefaults saves changes automatically at periodic intervals or when the app goes to the background
        ///         `synchronize()` It blocks the current thread until the write is complete
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
