import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textTitleLabel: UILabel!
    
    @IBOutlet weak var textPubDateLabel: UILabel!
    
    weak var viewModel : NewsTableCellViewModel! {
        didSet{
            textTitleLabel.text = viewModel.titleLabel
            textPubDateLabel.text = viewModel.pubDateLabel
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
