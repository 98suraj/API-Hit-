import Foundation

class ThirdAPIManager {
    
    func executeAPI(url: String, callback: @escaping (_ data: [[String: Any]]?, _ error: Error?) -> Void) {
        
        let url = URL(string: url)!
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            
            if let errorIs = error {
                
                callback(nil, errorIs)
                
                return
                
            }
            
            guard let jsonResponse = ThirdDataParsing.jsonWith(data: data!) as? [[String: Any]] else {
                
                return
                
            }
            
            //            print(jsonResponse)
            
            callback(jsonResponse, nil)
            
        }
        
        task.resume()
        
    }
    
}
