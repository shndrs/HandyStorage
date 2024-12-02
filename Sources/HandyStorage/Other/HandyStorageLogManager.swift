//
//  HandyStorageLogManager.swift
//  HandyStorage
//
//  Created by shndrs on 12/2/24.
//

import Foundation

final class HSLogManager: NSObject {
    
    private override init() {}
    
}

// MARK: - Methods

extension HSLogManager {
    
    static func failure(_ input: Any) {
        print("❌❌ --------> \(input)")
    }
    
    static func success(_ input: Any) {
        print("✅✅ ========> \(input)")
    }
    
    
    static func info(input: Any) {
        print("✏️✏️ >>>>>>>> \(input)")
    }
    
}
