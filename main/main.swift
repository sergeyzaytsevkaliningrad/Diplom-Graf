//
//  main.swift
//  Magister
//
//  Created by Сергей Зайцев on 14.03.2025.
//

import Foundation

// Коррекция индексов типов ФУ для старой среды
let fuTypeCorrect: Int = -96

// Определение типов переменных
enum VariableType: UInt {
    case void = 0, bool = 2, char = 4, int = 6, float = 8, double = 10, string = 12, IP = 14, IC = 16
    case PPoint = 18, Graph = 20, FU = 22, Load = 24, mk = 26, LoadVect = 28, LoadVectInd = 30, ICInd = 32, HashList = 34
    case Calc = 100, Prog = 102
    case voidArray = 1000, boolArray = 1002, charArray = 1004, intArray = 1006, floatArray = 1008, doubleArray = 1010, stringArray = 1012
}

// Определение классов для работы с нагрузками
class LoadPoint {
    var type: VariableType = .void // Тип нагрузки
    var pointer: UnsafeRawPointer? = nil // Указатель на данные
    var index: Int = -1 // Индекс поля
    
    // Получение типа нагрузки
    func getType() -> VariableType {
        return self.type
    }
    
    // Определение, является ли нагрузка числом
    func isDigit() -> Bool {
        return [.int, .char, .float, .double].contains(self.type)
    }
    
    // Определение, является ли нагрузка булевым значением
    func isBool() -> Bool {
        return self.type == .bool
    }
    
    // Определение, является ли нагрузка строкой или символом
    func isStrChar() -> Bool {
        return self.type == .string || self.type == .char
    }
    
    // Запись значения в нагрузку
    func write<T>(_ value: T) -> Int {
        guard MemoryLayout<T>.size > 0 else { return 1 }
        self.pointer = UnsafeRawPointer(Unmanaged.passUnretained(value as AnyObject).toOpaque())
        return 0
    }
    
    // Очистка нагрузки
    func clear() {
        self.pointer = nil
        self.type = .void
    }
    
    // Преобразование в строку
    func toStr() -> String {
        return "LoadPoint(type: \(self.type), index: \(self.index))"
    }
}
