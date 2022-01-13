
import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    var subview = UIView(frame: CGRect(x: 25, y: -10, width: UIScreen.width - 50, height: 70))
    var title = UILabel()
    var image = UIImageView()
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        setupPaymentCell()
        
        addSubview(subview)
        
    }
    
    // MARK: - Payment
    
    func setupPaymentCell() {
        
        // setup image view
        image.frame.origin.x = 10
        image.frame.origin.y = 30
        image.frame.size.width = 20
        image.frame.size.height = 20
        
        // setup title view
        title.frame.origin.x = 50
        title.frame.origin.y = 5
        title.frame.size.width = subview.frame.width - 50
        title.frame.size.height = subview.frame.height
        title.font = .systemFont(ofSize: 15)
        title.textColor = .black
        
        subview.addSubview(image)
        subview.addSubview(title)
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
