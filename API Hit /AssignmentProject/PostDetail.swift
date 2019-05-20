import Foundation

class PostDetail {
    
    var id: Int = 0
    
    var title: String = ""
    
    var body: String = ""
    
    init(with dict: [String: Any]) {
        
        if let value = dict["title"] as? String {
            
            self.title = value
            
        }
        
        if let value = dict["body"] as? String {
            
            self.body = value
            
        }
        
        if let value = dict["id"] as? Int {
            
            self.id = value
            print(self.id)
            
        }
        
    }
    
    class func postList(dictList: [[String: Any]]) -> [PostDetail] {
        
        var tempList = [PostDetail]()
        
        for dict in dictList {
            
            let post = PostDetail(with: dict)
            
            tempList.append(post)
            
        }
        
        return tempList
        
    }
    
    class func getPostList(apiManager: SecondAPIManager, urlString: String, callback: @escaping (_ list: [PostDetail]?, _ error:
        
        Error?) -> Void) {
        
        apiManager.executeAPI(url: urlString) { (response: [[String: Any]]?, error: Error?) in
            
            guard let results = response! as? [[String: Any]] else {
                
                callback(nil, nil)
                
                return
                
            }
            
            let postList = PostDetail.postList(dictList: results)
            
            callback(postList, nil)
            
            }
        
    }
    
}
