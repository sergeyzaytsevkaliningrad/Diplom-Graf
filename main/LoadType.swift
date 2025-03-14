//
//  LoadType.swift
//  Magister
//
//  Created by Сергей Зайцев on 14.03.2025.
//

import Foundation

// Определение типов нагрузок
enum LoadType {
    case dInt
    case dFloat
    case dDouble
    case dBool
    case dString
    case dChar
    case dIP
    case dIC
    case dLoadVect
    case dLoadVectInd
    case dICInd
}

// Структура для представления нагрузки
struct LoadPointProt {
    var type: LoadType
    var point: Any?
    var ind: Int = 0
    
    func getType() -> LoadType {
        // Логика определения типа нагрузки
        return type
    }
    
    func dataSize() -> Int {
        // Логика определения размера данных
        return 0
    }
    
    func isDigit() -> Bool {
        // Логика проверки, является ли нагрузка числом
        return false
    }
    
    func isBool() -> Bool {
        // Логика проверки, является ли нагрузка булевым значением
        return false
    }
    
    func toInt(defaultValue: Int = 0) -> Int {
        // Логика преобразования нагрузки в Int
        return defaultValue
    }
    
    func toDouble(defaultValue: Double = 0.0) -> Double {
        // Логика преобразования нагрузки в Double
        return defaultValue
    }
    
    func toBool(defaultValue: Bool = false) -> Bool {
        // Логика преобразования нагрузки в Bool
        return defaultValue
    }
    
    func toStr(defaultValue: String = "") -> String {
        // Логика преобразования нагрузки в String
        return defaultValue
    }
    
    func write(value: Any) -> Int {
        // Логика записи значения в нагрузку
        return 0
    }
    
    func clone() -> LoadPointProt {
        // Логика клонирования нагрузки
        return self
    }
}

// Структура для представления ИП (информационной пары)
struct IP {
    var atr: Int
    var load: LoadPointProt
}

// Структура для представления ИК (информационного комплекса)
typealias IC = [IP]

// Пример функции для работы с ИК
func atrSearch(ic: IC, atr: Int) -> Bool {
    return ic.contains { $0.atr == atr }
}

func atrCounter(ic: IC, atr: Int) -> Int {
    return ic.filter { $0.atr == atr }.count
}

func icDel(ic: inout IC) {
    ic.removeAll()
}

func icCopy(ic: IC) -> IC {
    return ic.map { IP(atr: $0.atr, load: $0.load.clone()) }
}

// Пример использования
//var ic: IC = [
//    IP(atr: 1, load: LoadPoint(type: .dInt, point: 42)),
//    IP(atr: 2, load: LoadPoint(type: .dString, point: "Hello"))
//]
//
//let hasAtr1 = atrSearch(ic: ic, atr: 1)
//let atr1Count = atrCounter(ic: ic, atr: 1)
//
//print("Has atr 1: \(hasAtr1)")
//print("Atr 1 count: \(atr1Count)")
//
//icDel(ic: &ic)
//print("IC after deletion: \(ic)")
//
//let copiedIC = icCopy(ic: ic)
//print("Copied IC: \(copiedIC)")
