//
//  HandyStorage+Encodable+Extension.swift
//  HandyStorage
//
//  Created by shndrs on 12/2/24.
//

import Foundation

public extension Encodable {

    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let json = object as? [String: Any] else {
            let context = DecodingError.Context(codingPath: [],
                                                debugDescription: HSStrings.deserializedError)
            throw DecodingError.typeMismatch(type(of: object), context)
        }
        return json
    }
    
    func toJSONString(_ encoder: JSONEncoder = JSONEncoder()) throws -> String {
        let data = try encoder.encode(self)
        return String(decoding: data, as: UTF8.self)
    }
    
}
