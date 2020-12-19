//
//  Date+Extension.swift
//  SwiftUISample
//
//  Created by Mine on 7.12.2020.
//
import Foundation

public extension Date {
    var widgetText: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return "\(formatter.string(from: self)) \n ☺️"
    }
    
    func adding(second: Int) -> Date {
        return Calendar.current.date(byAdding: .second, value: second, to: self)!
    }
}
