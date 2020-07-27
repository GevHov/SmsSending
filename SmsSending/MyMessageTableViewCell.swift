//
//  MyMessageTableViewCell.swift
//  SmsSending
//
//  Created by MacBook Pro on 7/27/20.
//  Copyright © 2020 Gevorg Hovhannisyan. All rights reserved.
//

import UIKit

class MyMessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        rootView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
