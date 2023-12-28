import Combine
import Foundation
import SwiftUI

public class YearPickerModel {
    @Published public var initialYear: Int
    @Published public var selectedYear: Int?
    @Published public var selectedDate = Date()
    private let maxInitialYear = 2020
    private let minInitialYear = 1890
    
    public init(initialYear: Int) {
        self.initialYear = initialYear
    }
    
    public var shouldShowDatePicker: Bool {
        selectedYear != nil
    }
    
    public var displayedYears: String {
        "\(initialYear) - \(initialYear + 9)"
    }
    
    public var isDisabledForward: Bool {
        initialYear >= maxInitialYear
    }
    
    public func isDisabled(year: Int) -> Bool {
        year < initialYear || year > initialYear + 9
    }
    
    public var isDisabledBackward: Bool {
        initialYear <= minInitialYear
    }

    public func select(year: Int) {
        // https://github.com/onmyway133/blog/issues/54
        var component = Calendar.current.dateComponents([.year, .month, .day], from: selectedDate)
        component.year = year
        if let newDate = Calendar.current.date(from: component) {
            selectedDate = newDate
        }
        withAnimation(.easeOut(duration: 0.1)) {
            selectedYear = year
        }
    }

    public func navigateForwad() {
        initialYear = min(initialYear + 10, maxInitialYear)
    }
    
    public func navigateBackwad() {
        initialYear = max(initialYear - 10, minInitialYear)
    }
}

extension YearPickerModel: ObservableObject {}
