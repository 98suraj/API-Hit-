import UIKit

class ThirdViewController: UIViewController {

    var head: String?
    
    var id: Int?
    
    var postData: Detail?
    
    var postDetailList: [PostDetail]?
    
    @IBOutlet weak var tableViewThree: UITableView!
    var indicater = UIActivityIndicatorView(style: .gray)
 override func viewDidLoad() {
        
        super.viewDidLoad()

        tableViewThree.delegate = self
        
        tableViewThree.dataSource = self
    indicater.center = self.view.center
    self.view.addSubview(indicater)
    indicater.startAnimating()
    
    let postNib = UINib(nibName: "UserCell", bundle: nil)
    tableViewThree.register(postNib, forCellReuseIdentifier: "UserCell")
    let urlstring = "http://jsonplaceholder.typicode.com/posts?userId=" + "\(postData!.id)"
       
        let api = SecondAPIManager()
        
        PostDetail.getPostList(apiManager: api, urlString: urlstring){ (list, error) in
          
            self.postDetailList = list
           self.indicater.startAnimating()
            DispatchQueue.main.async{
               self.indicater.stopAnimating()
                self.tableViewThree.reloadData()
        
            }
       
        }
}
}
extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return postDetailList?.count ?? 0

    }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {



        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell else {

            fatalError("User Cell Not Found")

        }

        if let abc = postDetailList?[indexPath.row] {

            cell.label.text = abc.title

            cell.info.text = abc.body

        }

        return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "CommentViewController") as? CommentViewController else{

            fatalError("View controllerNot found")

        }

        controller.comments = postDetailList![indexPath.row]
        controller.id = postDetailList![indexPath.row].id

        self.navigationController?.pushViewController(controller, animated: true)

    }

}

