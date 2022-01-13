
import UIKit

class MobileOperatorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var id = 1
    var parentId = 0
    var items = Array<Category>()
    var category = Category()
    var childs = [Category]()
    var navigationTitle = "Мобильные операторы"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        category.parentId = parentId
        category.id = id
        category.children = childs
        print(childs[0].children!)
        items = category.children![parentId].children!
    }
    
    func setup() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.allowsSelection = false
        tableView.tableHeaderView = UIView()
        
        items = Category(id: id, parentId: parentId).children!
        navigation()
    }
    
    func navigation() {
        title = navigationTitle
        
        let search = UIImage(named: "search")
        let back = UIImage(named: "back")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: search, style: .plain, target: self, action: #selector(searchTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backTapped))
        
    }
    
    // MARK: - Actions
    
    @objc func searchTapped() {
        
        // code here
    
    }
    
    @objc func backTapped() {
        
        navigationController?.popViewController(animated: true)
    
    }

    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 60 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        let cell = Bundle.main.loadNibNamed("SubCategoryTableViewCell", owner: self, options: nil)?.first as! SubCategoryTableViewCell
        
        cell.title.text = item.title
        cell.image.image = UIImage(named: item.image!)
        
        return cell
    }

}
