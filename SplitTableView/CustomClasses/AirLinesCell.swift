//  DomRoundTripTableViewCell.swift

import UIKit

class AirLinesCell: UITableViewCell {
    
    @IBOutlet weak var airlineLogo: UIImageView!
    @IBOutlet weak var centerLine: UIImageView!
    @IBOutlet weak var airlineName: UILabel!
    @IBOutlet weak var depTime: UILabel!
    @IBOutlet weak var arrTime: UILabel!
    @IBOutlet weak var fromCityCode: UILabel!
    @IBOutlet weak var toCityCode: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var stops: UILabel!
    @IBOutlet weak var specialTag: UILabel!
    @IBOutlet weak var grossFare: UILabel!
    @IBOutlet weak var netFare: UILabel!
    
    @IBOutlet weak var arrTime_splitView: UILabel!
    @IBOutlet weak var netFare_splitView: UILabel!
    @IBOutlet weak var logoHightConst: NSLayoutConstraint!
    @IBOutlet weak var logoWidthConst: NSLayoutConstraint!
    @IBOutlet weak var depTimeLeftConst: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
   
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        DispatchQueue.main.async {
            
            
                if self.frame.size.width < 200 {
                    
                    self.arrTime_splitView.isHidden = false
                    self.netFare_splitView.isHidden = false
                    self.airlineLogo.isHidden = false
                    self.depTime.isHidden = false
                    self.logoHightConst.constant = 45
                    self.logoWidthConst.constant = 45
                     self.depTimeLeftConst.constant = 10
                    self.depTime.font = AppFont.bodyFont
                    self.arrTime_splitView.font = AppFont.bodyFont
                    self.netFare_splitView.font = UIFont.systemFont(ofSize: 16)
     
                    self.airlineName.isHidden = true
                    self.arrTime.isHidden = true
                    self.fromCityCode.isHidden = true
                    self.toCityCode.isHidden = true
                    self.duration.isHidden = true
                    self.stops.isHidden = true
                    self.specialTag.isHidden = true
                    self.grossFare.isHidden = true
                    self.netFare.isHidden = true
                    self.centerLine.isHidden = true
                   
                }else{
                    
                    self.arrTime_splitView.isHidden = true
                    self.netFare_splitView.isHidden = true
                    self.logoHightConst.constant = 56
                    self.logoWidthConst.constant = 56
                    self.depTimeLeftConst.constant = 64
                    self.depTime.font = UIFont.systemFont(ofSize: 18)
     
                    
                    self.airlineLogo.isHidden = false
                    self.airlineName.isHidden = false
                    self.depTime.isHidden = false
                    self.arrTime.isHidden = false
                    self.fromCityCode.isHidden = false
                    self.toCityCode.isHidden = false
                    self.duration.isHidden = false
                    self.stops.isHidden = false
                    self.specialTag.isHidden = false
                    self.grossFare.isHidden = false
                    self.netFare.isHidden = false
                    self.centerLine.isHidden = false
                    
                }
                
 
        }
        
    }
    
    
    

}
