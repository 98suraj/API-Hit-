class Detail {
    
    var name: String = ""
    
    var id: Int = 0
   
    var username: String = ""
    
    var email: String = ""
    
    var address: [String: Any]?
   
    var phone: String = ""
    
    var website: String = ""
   
    var company: [String: Any]?
   
    static var count: Int = 0
   
    var arr = [String: Any]()
   
    var arr2 = [Any]()
   
    var di = [String: Any]()
   
    var loc = [String: Any]()
    
    init(with dict: [String: Any]) {
        
        if let value = dict["id"] as? Int {
            
            self.id = value
            
            di["id"] = self.id
            
        }
        if let value = dict["name"] as? String {
            
            self.name = value
            
            di["name"] = self.name
            
        }
        if let value = dict["username"] as? String {
            
            self.username = value
            
            di["username"] = self.username
            
        }
        
        if let value = dict["email"] as? String {
            
            self.email = value
            
            di["email"] = self.email
        }
        
        if let value = dict["address"] as? [String: Any] {
            
            self.address = value
            
            for i in address! {
                
                di[i.key] = i.value
                
            }
            
        }
        
        if let value = dict["phone"] as? String {
            
            self.phone = value
            
            di["phone"] = self.phone
            
        }
        
        if let value = dict["website"] as? String {
            
            self.website = value
            
            di["website"] = self.website
            
        }
        
        
        if let value = dict["company"] as?  [String: Any] {
            
            self.company = value
            
            for i in company! {
                
                di[i.key] = i.value
                
            }
          
        }
        
    }
    class func userList(dictList: [[String: Any]]) -> [Detail] {
        
        var tempList = [Detail]()
        
        for dict in dictList {
            
            let user = Detail(with: dict)
            
            tempList.append(user)
            
            count = count + 1
            
        }
        
        return tempList
        
    }
    
    class func getUserList(apiManager: APIManager , urlString: String, callback: @escaping (_ list: [Detail]?, _ error: Error?) -> Void) {
        
        apiManager.executeAPI(url: urlString) { (response: [[String: Any]]?, error: Error?) in
            
            guard let results = response! as? [[String: Any]] else {
                
                callback(nil, nil)
                
                return
            }
            
            let userList = Detail.userList(dictList: results)
            
            callback(userList, nil)
            
        }
        
    }
    
}
