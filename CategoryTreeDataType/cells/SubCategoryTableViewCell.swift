
import UIKit

class SubCategoryTableViewCell: UITableViewCell {
    
    var subview = UIView(frame: CGRect(x: 25, y: -10, width: UIScreen.width - 100, height: 70))
    var title = UILabel()
    var image = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupMobileOperatorCell()
        
        addSubview(subview)
        
    }
    
    // MARK: - MobileOperator
    func setupMobileOperatorCell() {
        
        // setup image view
        image.frame.origin.x = 10
        image.frame.origin.y = 30
        image.frame.size.width = 70
        image.frame.size.height = 20
        
        // setup title view
        title.frame.origin.x = 110
        title.frame.origin.y = 5
        title.frame.size.width = subview.frame.width*2/3
        title.frame.size.height = subview.frame.height
        title.font = .systemFont(ofSize: 15)
        title.textColor = .black
        
        // setup bonus
        let bonus = UIImageView(frame: CGRect(x: UIScreen.width-100, y: 30, width: 50, height: 25))
        bonus.image = UIImage(named: "bonus")
        
        subview.addSubview(bonus)
        subview.addSubview(image)
        subview.addSubview(title)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
