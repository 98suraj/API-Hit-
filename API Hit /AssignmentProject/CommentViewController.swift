import UIKit

class CommentViewController: UIViewController {
    
    var comments: PostDetail?
    var selectRowIndex : Int?
    var id: Int?
    
   var commentModel: [Comment]?
    
    var sectionHead: String = "Loading Please wait"
    
    @IBOutlet weak var tableViewFour: UITableView!
    
    var indicater = UIActivityIndicatorView(style: .gray)
    
        override func viewDidLoad() {
        
        super.viewDidLoad()
        
            let postViewNib = UINib(nibName: "PostViewCellTableViewCell", bundle: nil)
            tableViewFour.register(postViewNib, forCellReuseIdentifier: "PostViewCellTableViewCell")
            
            
            let personalTableNib = UINib(nibName: "PersonalTableViewCell", bundle: nil)
            tableViewFour.register(personalTableNib, forCellReuseIdentifier: "PersonalTableViewCell")
            
        let commentNib = UINib(nibName: "CustomCell", bundle: nil)
        
        tableViewFour.register(commentNib, forCellReuseIdentifier: "CustomCell")
        
        let postNib = UINib(nibName: "PostCell", bundle: nil)
            
            tableViewFour.delegate = self
            tableViewFour.dataSource = self
            
        
        tableViewFour.register(postNib, forCellReuseIdentifier: "PostCell")
        
        navigationItem.title = "Post's Comment"
        
            self.apiHit()
            indicater.center = self.view.center
            self.view.addSubview(indicater)
            indicater.startAnimating()
        
    }
    
    
    
    func apiHit() {
        
        let urlString = "http://jsonplaceholder.typicode.com/comments?postId=" + "\(comments!.id)"
        
        let api = SecondAPIManager()
        
    Comment.getCommentList(apiManager: api, urlString: urlString) { (list, error) in
        
            self.sectionHead = "Comment (5)"
            
            self.commentModel = list
            self.indicater.startAnimating()
            DispatchQueue.main.async {
                self.indicater.stopAnimating()
                self.tableViewFour.reloadData()
                
            }
            
        }
        
    }
    
}

extension CommentViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
            
        }
        
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
     if indexPath.section == 0 {
        
            guard let cell = tableViewFour.dequeueReusableCell(withIdentifier: "PostViewCellTableViewCell") as? PostViewCellTableViewCell else{
                
                fatalError("Post View Cell Not Found")
                
            }

            cell.label3.text = comments?.title

            cell.label2.text = comments?.body
        
        return cell
    }

     guard let cell = tableViewFour.dequeueReusableCell(withIdentifier: "PersonalTableViewCell") as? PersonalTableViewCell else{
            fatalError("Personal TableCell Not Found")

        }

    if let field = commentModel?[indexPath.row] {

            cell.name.text = field.title

            cell.id.text = field.body

        }
        if let SelectRowIndexIs = selectRowIndex, SelectRowIndexIs == indexPath.row {
            cell.id.numberOfLines = 0
        }else{
            cell.id.numberOfLines = 2
        }


    
        return cell
        
    }
    
    func  numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
        
    }
    
func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            
            return "POST"
            
            }
        
        return sectionHead
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let  SelectRowIndexIs = selectRowIndex else{
            
            selectRowIndex = indexPath.row
            tableViewFour.reloadData()
        
          return
            
        }
        
        

        if   SelectRowIndexIs == indexPath.row {
            selectRowIndex = nil
            tableViewFour.reloadData()
            return
        }

        selectRowIndex = indexPath.row
        tableViewFour.reloadData()
    }
    
    
}
