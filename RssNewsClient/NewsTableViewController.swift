import UIKit
import FeedKit


class NewsTableViewController: UIViewController, UITableViewDataSource {

    
    var viewModel: NewsTableViewModel!{
        didSet{
            viewModel.updateDate{
                    self.tableView.reloadData()
            }
        }
    }
    
    let cellIdentifier = "NewsTableViewCell"
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        let newsManager = NewsManager()
        let newsTableViewModel = NewsTableViewModel(newsManager: newsManager)
        self.viewModel = newsTableViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.viewModel.numberOfNews())
        return self.viewModel.numberOfNews()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NewsTableViewCell
        
        cell?.viewModel = self.viewModel.cellViewModel(indexPath.row)
        
        return cell!
    }

}


