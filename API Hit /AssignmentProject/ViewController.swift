
import UIKit

class ViewController: UIViewController {
    
    var list: [Detail]?
    
    @IBOutlet weak var tableView: UITableView!
   
    var indicater = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let customNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        
        tableView.register(customNib, forCellReuseIdentifier: "CustomTableViewCell")
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        indicater.center = self.view.center
        
        self.view.addSubview(indicater)
        
        indicater.startAnimating()
        
        self.apiHit()
        
        self.navigationItem.title = "USERS"
        
        }
    
    func apiHit() {
        
        let urlString = "http://jsonplaceholder.typicode.com/users"
        
        let api = APIManager()
        
        Detail.getUserList(apiManager: api, urlString: urlString) { (list, error) in
            
            self.list = list
            
            self.indicater.startAnimating()
            
            DispatchQueue.main.async {
                
                self.indicater.stopAnimating()
                
                self.tableView.reloadData()
                
            }
            
        }
        
    }
    
}

extension ViewController: UITableViewDelegate , UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return list?.count ?? 0
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell else {
         
            fatalError("CustomTableViewCell not found")
        
        }
        
        cell.accessoryType = .disclosureIndicator
        
        if let variable = list?[indexPath.row]{
          
            cell.labelTwo.text = "UserId:- \(variable.id)"
           
            cell.labelOne.text = variable.name
            
            cell.labelThree.text = "Username :- \(variable.username)"
       
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        guard let details = list?[indexPath.row]  else{
       
            return
        
        }
       
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as?
          
            SecondViewController else {
           
                return
        
        }
       
        controller.everyDetail = details
       
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
