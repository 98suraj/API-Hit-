//
//import UIKit
//
//class AlbumViewController: UIViewController {
//
//    @IBOutlet weak var tableViewFive: UITableView!
//
//    var indicater = UIActivityIndicatorView(style: .gray)
//
//    var usermodel: UserCell?
//
//    var albums: [Album]?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableViewFive.delegate = self
//        tableViewFive.dataSource = self
//
//
//        indicater.center = self.view.center
//        self.view.addSubview(indicater)
//        indicater.startAnimating()
//
//        self.navigationItem.title = "Album"
//
//        let postViewNib = UINib(nibName: "SecondCustomTableViewCell", bundle: nil)
//        tableViewFive.register(postViewNib, forCellReuseIdentifier: "SecondCustomTableViewCell")
//
//        let urlstring = "http://jsonplaceholder.typicode.com/posts?userId="
//
//        let api = ThirdAPIManager()
//
//
//            DispatchQueue.main.async {
//                self.indicater.stopAnimating()
//                self.tableViewFive.reloadData()
//
//            }
//
//        }
//
//    }
//extension AlbumViewController: UITableViewDelegate , UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return 4
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//            guard let cell = tableViewFive.dequeueReusableCell(withIdentifier: "SecondCustomTableViewCell") as? SecondCustomTableViewCell else{
//
//                fatalError("Second Custom Table View Cell Not Found")
//
//            }
////
////         if let field1 = commentModel?[indexPath.row] {
////
////            cell.label4.text = field1.title
////
////            cell.label5.text = field1.body
////
////            return cell
////        }
////
////
////    func  numberOfSections(in tableView: UITableView) -> Int {
////
////        return 2
////
////    }
////
////    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
////
////        if section == 0 {
////
////            return "POST"
////
////        }
////
////
////    }
////    }
////
////        }}}
