//
//  SingleTypesAndValue.swift
//  HandyStorage
//
//  Created by shndrs on 9/17/25.
//

import Foundation

// MARK: - Single Types and Values

public enum HandyStorageSingleType: UInt8 {
    
    case bool
    case integer
    case array
    case string
    case double
    case float
    case data
    
}

public enum HandyStorageSingleValue {
    
    case bool(Bool)
    case integer(Int)
    case array(Array<Any>)
    case string(String)
    case double(Double)
    case float(Float)
    case data(Data)
    
}
