
import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var info: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
       
        super.setSelected(selected, animated: animated)

      
    }
    
}
