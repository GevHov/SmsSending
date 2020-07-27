//
//  ViewController.swift
//  SmsSending
//
//  Created by MacBook Pro on 7/27/20.
//  Copyright © 2020 Gevorg Hovhannisyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array = [MessageModel]()
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        array.append(MessageModel(isMe: true, txt: "Hello"))
        array.append(MessageModel(isMe: false, txt: "Hello bro"))
        array.append(MessageModel(isMe: true, txt: "How are you?"))
        array.append(MessageModel(isMe: false, txt: "Fine!"))
        
        delegates()
    }
    
    func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func sendBtn(_ sender: Any) {
        if let txt = txtField.text, !txt.isEmpty {
            let model = MessageModel(isMe: true, txt: txt)
            array.append(model)
            txtField.text = ""
            tableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = array[indexPath.row]
        
        if model.isMe {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyMessageTableViewCell", for: indexPath) as! MyMessageTableViewCell
            cell.label.text = model.txt
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PartnerTableViewCell", for: indexPath) as! PartnerTableViewCell
            cell.label.text = model.txt
            return cell
            
        }
    }
    
    
}

struct MessageModel {
    let isMe: Bool
    let txt: String
}
