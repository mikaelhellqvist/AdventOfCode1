import Foundation

class Converter {
    
    func convertToArrayFrom(string: String) -> [String] {
        
        var stringToConvert = string
        //pathData = "R5, L5, R5, R3"
        //pathData = "L2, R3"
        //pathData = "R2, R2, R2"
        stringToConvert = stringToConvert.replacingOccurrences(of: " ", with: "")
        let array = stringToConvert.components(separatedBy: ",")
        
        return array
    }
}
