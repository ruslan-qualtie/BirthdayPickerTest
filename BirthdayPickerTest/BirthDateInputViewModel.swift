import Combine
import Foundation

public class BirthDateInputViewModel {
    @Published public var birthDate: String = ""
    
    
    public var displayedBirthDate: String {
        birthDate.isEmpty ? "DD/MM/YYYY" : birthDate
    }

    public var birthDateFormatter: DateFormatter {
        DateFormatter.monthDayYear
    }

    public var initialDate: Date {
        DateFormatter.iso.date(from: "2000-01-01T00:00:00+0000")!
    }
}

extension BirthDateInputViewModel: ObservableObject {}
