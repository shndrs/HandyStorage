//
//  HandyStorage+String+Extension.swift
//  HandyStorage
//
//  Created by shndrs on 12/2/24.
//

import Foundation

public extension String {
    
    func fromJson<T: Codable>(type: T.Type) -> T? {
        let jsonData = Data(self.utf8)
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(T.self, from: jsonData)
            return object
        } catch {
            return nil
        }
    }
    
    func fromJsonArray<T: Codable>() -> [T]? {
        let jsonData = Data(self.utf8)
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode([T].self, from: jsonData)
            return object
        } catch {
            return nil
        }
    }
    
}
