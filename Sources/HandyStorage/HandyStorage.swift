// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

final public class HandyStorage: NSObject, @unchecked Sendable {
    
    static let shared = HandyStorage()
    
    private lazy var core: HandyStorageCore = {
        return HandyStorageCore()
    }()
    
    private override init() {}
    
}

// MARK: - Methods

extension HandyStorage {
    
    // MARK: - Saving Object
    
    func save<T: Codable>(object: T,
                          key: String,
                          callback: HSCallback? = nil) {
        if let objectString = core[key] {
            var codableArray: [T] = objectString.fromJsonArray() ?? []
            codableArray.append(object)
            core[key] = try? codableArray.toJSONString()
            callback?(true, nil)
        } else {
            core[key] = try? [object].toJSONString()
            callback?(true, nil)
        }
    }
    
    // MARK: - Saving Array Object
    /// - NOTE: By saving the your array the privious table data will be replace by your array
    /// then be careful with this method
    
    func saveArray<T: Codable>(arrayObject: [T],
                               key: String,
                               callback: HSCallback? = nil) {
        core[key] = try? arrayObject.toJSONString()
    }
    
    // MARK: - Loading Object
    
    func load<T: Codable>(key: String) -> [T] {
        if let objectString = core[key] {
            let codableArray: [T] = objectString.fromJsonArray() ?? []
            return codableArray
        } else {
            return []
        }
    }
    
    // MARK: - Deleting Object
    
    func delete<T: Codable>(object: T,
                            key: String,
                            callback: HSCallback? = nil) {
        if let objectString = core[key] {
            var codableArray: [T] = objectString.fromJsonArray() ?? []
            if codableArray.contains(where: {(try? $0.toJSONString()) == (try? object.toJSONString())}) {
                guard let index = codableArray
                    .firstIndex(where: {(try? $0.toJSONString()) == (try? object.toJSONString())}) else {
                    callback?(false, HSStrings.databaseDeleteError)
                    return
                }
                codableArray.remove(at: index)
                core[key] = try? codableArray.toJSONString()
                callback?(true, nil)
            } else {
                callback?(false, HSStrings.databaseDeleteError)
            }
        } else {
            callback?(false, HSStrings.databaseDeleteError)
            HSLogManager.failure(HSStrings.databaseDeleteError)
        }
    }
    
    // MARK: - Updating Object
    
    func update<T: Codable>(oldObject: T,
                            newObject: T,
                            key: String,
                            callback: HSCallback? = nil) {
        if let objectString = core[key] {
            var codableArray: [T] = objectString.fromJsonArray() ?? []
            if codableArray.contains(where: {(try? $0.toJSONString()) == (try? oldObject.toJSONString())}) {
                guard let index = codableArray
                    .firstIndex(where: {(try? $0.toJSONString()) == (try? oldObject.toJSONString())}) else { return }
                codableArray.remove(at: index)
                codableArray.insert(newObject, at: index)
                core[key] = try? codableArray.toJSONString()
                callback?(true, nil)
            } else {
                callback?(false, HSStrings.databaseDeleteError)
            }
        } else {
            callback?(false, HSStrings.databaseDeleteError)
            HSLogManager.failure(HSStrings.databaseUpdateError)
        }
    }
    
    // MARK: - Delete Table
    
    func delete(table: String) {
        core[table] = nil
    }
    
}
