//
//  MyTableViewCell.swift
//  DemoTaskSedin
//
//  Created by Shadab Hussain on 13/02/22.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCreatedAt: UILabel!
    @IBOutlet weak var lblUserLogIn: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func cellConfig(data: UserData?) {
        guard let unwarppedData = data else {return}
        lblTitle.text = unwarppedData.title
        lblUserLogIn.text = unwarppedData.user?.login
        lblCreatedAt.text = unwarppedData.created_at
        
    }

    
    
}
