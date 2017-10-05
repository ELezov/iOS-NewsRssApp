import UIKit


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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "ShowDetail":
            guard let newsDetailViewController = segue.destination as? DetailNewsViewController  else {
                fatalError("Unexpected destination:\(segue.destination)")
            }
            
            guard let selectedNewsCell = sender as? NewsTableViewCell else{
                fatalError("The selected cell is not being displayed by the table")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedNewsCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            newsDetailViewController.viewModel = self.viewModel.getDetailsViewModel(indexPath.row)
            
        default:
            fatalError("Global prepare Error in NewsTableViewController")
        }
    }
    
}


