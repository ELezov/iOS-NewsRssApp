import UIKit

class DetailNewsViewController: UIViewController {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    var viewModel: DetailNewsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleTextLabel.text = viewModel.title
        self.descriptionTextLabel.text = viewModel.description

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
