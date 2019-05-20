import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var labelThree: UILabel!
    
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var labelOne: UILabel!
  
    override func awakeFromNib() {
        
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
       
        super.setSelected(selected, animated: animated)

    }
    
}
