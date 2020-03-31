//  Created by Umer Khan on 30/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.

import UIKit

class SegueController: UIViewController {
    
    private let formVCSegueID: String = "FormVCSegueID"
    private let recordsVCSegueID: String = "RecordsVCSegueID"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Perform Segues
    @IBAction func addRecordButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: formVCSegueID, sender: nil)
        
        
    }
    
    @IBAction func searchRecordButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: recordsVCSegueID, sender: nil)
        
    }
    
    @IBAction func viewAllRecordsButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: recordsVCSegueID, sender: nil)
        
    }
    
    
    
    


}

