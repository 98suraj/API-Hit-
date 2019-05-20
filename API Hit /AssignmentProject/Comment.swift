import Foundation

class Comment {
    
    var title: String = ""
    
    var body: String = ""
    
    init(with dict: [String: Any]) {
        
        if let value = dict["name"] as? String {
            
            self.title = value
            
            print(value)
            
        }
        
        if let value = dict["body"] as? String {
            
            self.body = value
            
        }
        
    }
    
    class func commentList(dictList: [[String: Any]]) -> [Comment] {
        
        var tempList = [Comment]()
        
        for dict in dictList {
            
            let comment = Comment(with: dict)
            
            tempList.append(comment)
            
        }
        
        return tempList
        
    }
    
    class func getCommentList(apiManager: SecondAPIManager, urlString: String, callback: @escaping (_ list: [Comment]?, _ error:
        
        Error?) -> Void) {
        
        apiManager.executeAPI(url: urlString) { (response: [[String: Any]]?, error: Error?) in
            
            guard let results = response! as? [[String: Any]] else {
                
                callback(nil, nil)
                
                return
                
            }
            
            let commentList = Comment.commentList(dictList: results)
            
            callback(commentList, nil)
            
            }
        
    }
    
}
