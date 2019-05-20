import UIKit

import MapKit

class SecondViewController: UIViewController {
    
    var everyDetail: Detail?
    
    var coordinat: [String:Any]?
    
    let screenSize = UIScreen.main.bounds

    var too = [
        
        ExpandableName(isExpanded: true, names: ["ID", "NAME","USER NAME"]),
       
        ExpandableName(isExpanded: true, names: ["EMAIL", "PHONE","WEBSITE"]),
       
        ExpandableName(isExpanded: true, names: ["STREET", "SUIET","CITY"]),
       
        ExpandableName(isExpanded: true, names: ["COMPANY NAME", "CATCH PHRASE","BS"]),
    
        ]

    @IBOutlet weak var tableViewTwoo: UITableView!
 
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        coordinat = everyDetail!.address!["geo"] as! [String: Any]

        navigationItem.title = everyDetail?.name
        
        tableViewTwoo.delegate = self
        
        tableViewTwoo.dataSource = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "POSTS", style: .done, target: self, action:
            
            #selector(addTapped))
       
        navigationItem.title = everyDetail?.name
        
    }
    
    @objc func addTapped(){
       
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "Third") as?
            
            ThirdViewController else{
            
                fatalError("Third View Controller Not Found")
            
        }

        controller.postData = everyDetail

        controller.head = everyDetail?.name
       
        
        controller.postData = everyDetail
        
        self.navigationController?.pushViewController(controller, animated: true)
        
   }
    
    func openMapForPlace() {

        let lat = (coordinat!["lat"] as! NSString).doubleValue

        let lng = (coordinat!["lng"] as! NSString).doubleValue

        let regionDistance:CLLocationDistance = 10000

        let coordinates = CLLocationCoordinate2DMake(lat , lng)

        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)

        let options = [ MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),

                        MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)

        ]

        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)

        let mapItem = MKMapItem(placemark: placemark)

        mapItem.name = "Place Name"

        mapItem.openInMaps(launchOptions: options)

    }
    
}
extension SecondViewController: UITableViewDelegate ,  UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        return 50
   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if section == 0 || section == 1 || section == 3 {
//
//            return 3
//
//        }
//
//        return 5
        if !too[section].isExpanded {
            return 0
        }
        return too[section].names.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCell(withIdentifier: "CellId")
        
        if cell == nil {
           
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellId")
       
        }

        if indexPath.section == 0 {
           
            if indexPath.row == 0 {
              
                cell?.textLabel!.text = "USER ID"
                
                cell?.detailTextLabel!.text = "\(everyDetail!.id)"
          
            }
            
            else if indexPath.row == 1 {

                cell?.textLabel!.text = "NAME"
                
                cell?.detailTextLabel!.text = "\(everyDetail!.name)"
           
            }
           
            else if indexPath.row == 2 {

                cell?.textLabel!.text = "USER NAME"
                
                cell?.detailTextLabel!.text = "\(everyDetail!.username)"
            
            }
        
        }
       
        if indexPath.section == 1 {
            
                        if indexPath.row == 0 {
            
                            cell?.textLabel!.text = "EMAIL"
            
                            cell?.detailTextLabel!.text = "\(everyDetail!.email)"
            
                        }
            
                        else if indexPath.row == 1 {
                          
                            cell?.textLabel!.text = "PHONE"
            
                            cell?.detailTextLabel!.text = "\(everyDetail!.phone)"
                        
                        }
            
                        else if indexPath.row == 2 {
            
                            cell?.textLabel!.text = "WEBSITE"
            
                            cell?.detailTextLabel!.text = "\(everyDetail!.website)"
                        
            }
            
            }
        
        if indexPath.section == 2 {
            
            if indexPath.row == 0 {
                
                cell?.textLabel!.text = "STREET"
                
                cell?.detailTextLabel!.text = "\(everyDetail!.address!["street"]!)"
                
            }
                
            else if indexPath.row == 1 {
                
                cell?.textLabel!.text = "SUITE"
                
                cell?.detailTextLabel!.text = "\(everyDetail!.address!["suite"]!)"

            }
                
            else if indexPath.row == 2 {
                
                cell?.textLabel!.text = "CITY"
                
                cell?.detailTextLabel!.text = "\(everyDetail!.address!["city"]!)"

            }
           
            else if indexPath.row == 3 {
                
                cell?.textLabel!.text = "ZIPCODE"
                
                cell?.detailTextLabel!.text = "\(everyDetail!.address!["zipcode"]!)"

            }
            
        }
       
        if indexPath.section == 3 {
            
            if indexPath.row == 0 {
                
                cell?.textLabel!.text = "COMPANY NAME"
                
                cell?.detailTextLabel!.text = "\(everyDetail!.company!["name"]!)"
                
            }
                
            else if indexPath.row == 1 {
               
                cell?.textLabel!.text = "CATCH PHRASE"
                
                cell?.detailTextLabel!.text = "\(everyDetail!.company!["catchPhrase"]!)"
                
            }
                
            else if indexPath.row == 2 {
                
                cell?.textLabel!.text = "BS"
                
                cell?.detailTextLabel!.text = "\(everyDetail!.company!["bs"]!)"
                
          }
            
      
        }

        return cell!
   
    }
   
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection Section: Int) -> UIView? {
            
            let customView = UIView()
            
            let button = UIButton(type: .system)
            
            let title = UILabel()
            
            button.frame = CGRect(x: screenSize.maxX-20, y: 10, width: 10, height: 10)
            
            title.frame = CGRect(x: screenSize.maxX-(screenSize.maxX-20), y: 5, width: 200, height: 15)
            
//            button.backgroundColor = .blue
        
            button.setTitle("+", for: .normal)
            
                 customView.addSubview(button)
            
                 customView.addSubview(title)
            
            
            let frame = tableView.frame
            
            if Section == 0{
                
                title.text = "PERSONAL INFO"
                
                button.addTarget(self, action: #selector(openCloseExp), for: .touchUpInside)
                
                button.tag = Section
                
                return customView
                
            }
                
            else if Section == 1{
                
                title.text = "CONTACT DETAILS"
                
                button.addTarget(self, action: #selector(openCloseExp), for: .touchUpInside)
                
                button.tag = Section
                
                return customView
                
            }
                
            else if Section == 2{
                
                title.text = "ADDRESS"
                
                button.addTarget(self, action: #selector(openCloseExp), for: .touchUpInside)
                
                button.tag = Section
                
                return customView
                
            }
            
            title.text = "COMPANY"
            
            button.addTarget(self, action: #selector(openCloseExp), for: .touchUpInside)
            
            button.tag = Section
            
            return customView
            
        }
    
    @objc func openCloseExp(button: UIButton){

        let section = button.tag

        var indexPaths = [IndexPath]()

        for row in too[section].names.indices{

            print(0, row)

            let indexPath = IndexPath(row: row, section: section)

            indexPaths.append(indexPath)

        }
        let isExpanded = too[section].isExpanded

        too[section].isExpanded = !isExpanded

        button.setTitle(isExpanded ? "+" : "-", for : .normal)

        if isExpanded{

            tableViewTwoo.deleteRows(at: indexPaths, with: .fade)

        }else{
        
            tableViewTwoo.insertRows(at: indexPaths, with: . fade)
        
        }

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 2 && indexPath.row == 4 {
            
            openMapForPlace()
            
        }
        
    }

}
