
import UIKit

class PaymentCategoriesFullViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var selectedCell: IndexPath = []
    var category = Category(id: 1, parentId: 0)
    var id = 1
    var parentId = 0
    var navigationTitle = "Оплата"
    var items = Array<Category>()
    var isCategoryOpened = false
    var images = [String]()
    var titles = [String]()
    var mobileOperatorImage = [String]()
    var mobileOperatorTitle = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupData()
    }
    
    func setup() {
        
        navigation()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        tableView.allowsSelection = false
        tableView.tableHeaderView = UIView()

    }
    
    func navigation() {
        
        title = navigationTitle
        
        let search = UIImage(named: "search")
        let back = UIImage(named: "back")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: search, style: .plain, target: self, action: #selector(searchTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(backTapped))
        
    }
    
    func call(id: Int) {
        
        let viewController = MobileOperatorsViewController(nibName: "MobileOperatorsViewController", bundle: nil)
        
        viewController.id = id
        viewController.parentId = 0
        viewController.childs = category.children!
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    // MARK: Actions
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        
        call(id: id)
    
    }
    
    @objc func searchTapped() {
        
        // code here
    
    }
    
    @objc func backTapped() {
        
        // code here
    
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 60 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        
        let cell = Bundle.main.loadNibNamed("CategoryTableViewCell", owner: self, options: nil)?.first as! CategoryTableViewCell
        
        cell.title.text = item.title
        cell.image.image = UIImage(named: item.image!)
        
        if indexPath.row == 0 {
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            cell.addGestureRecognizer(tap)
        
        }
        
        return cell
        
    }
    
    // MARK: - Set Data
    
    func setupData() {
        
        // set image
        for image in 1...15 {
            
            images.append(String(image))
        
        }
        
        // set title
        titles = ["Мобильные операторы",
                  "Интернет провайдеры",
                  "Телефония",
                  "Гос. и Коммунальные услуги",
                  "Служба такси",
                  "Онлайн сервисы",
                  "Обучение",
                  "Благотворительность",
                  "Покупки",
                  "Объявление и реклама",
                  "Рестораны и кафе",
                  "Хостинг провайдеры",
                  "Медицина",
                  "Авиабилеты",
                  "Электронные кошельки"
        ]
        
        // sub category datas
        // set image
        mobileOperatorImage = ["Beeline", "Ums", "Ucell", "Uzmobile", "Uzmobile", "Beeline", "Beeline", "Beeline"]
        
        // set title
        mobileOperatorTitle = ["Beeline",
                                   "UMS",
                                   "Ucell",
                                   "UzMobile GSM",
                                   "UzMobile CDMA",
                                   "Beeline (Россия)",
                                   "Beeline (Казахстан)",
                                   "Beeline (Кыргызстан)"
        ]
        
        for index in 0..<titles.count {
            
            var children = [Category]()
            var sub = Category(id: 1, parentId: index + 1, title: titles[index], image: images[index])
            
            for subIndex in 0..<mobileOperatorTitle.count {
                
                children.append(Category(id: subIndex + 1, parentId: subIndex, title: mobileOperatorTitle[subIndex], image: mobileOperatorImage[subIndex]))
                sub.children = children
            
            }
            
            category.addChild(sub)
        
        }
        
        items = category.children!

    }

}
