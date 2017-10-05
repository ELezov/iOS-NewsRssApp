import UIKit

class DetailNewsViewController: UIViewController {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    var viewModel: DetailNewsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleTextLabel.text = viewModel.title
        //self.descriptionTextLabel.text = viewModel.description
        //print("Detail  ", viewModel.title, viewModel.description)
        self.descriptionTextLabel.from(html: viewModel.description)

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

extension UILabel {
    func from(html: String) {
        if let htmlData = html.data(using: String.Encoding.unicode) {
            do {
                self.attributedText = try NSAttributedString(data: htmlData,
                                                             options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                                                             documentAttributes: nil)
            } catch let e as NSError {
                print("Couldn't parse \(html): \(e.localizedDescription)")
            }
        }
    }
}
