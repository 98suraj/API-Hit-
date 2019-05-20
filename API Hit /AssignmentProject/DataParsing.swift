import Foundation

class DataParsing {
    
    static func jsonWith(data: Data) -> Any? {
        
        guard let jsonResponse = try?
            
            JSONSerialization.jsonObject(with: data, options:
                
                JSONSerialization.ReadingOptions.mutableContainers)
            
            else {
                
                return nil
                
        }
        
        return jsonResponse
        
    }
    
}

