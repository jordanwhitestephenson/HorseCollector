//
//  ViewController.swift
//  HorseCollector
//
//  Created by Jordan Stephenson on 5/30/17.
//  Copyright © 2017 JordansHorseCollector. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableVIew: UITableView!
    
    var horses : [Horse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
      tableVIew.dataSource = self
        tableVIew.delegate = self
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            horses = try context.fetch(Horse.fetchRequest())
            print(horses)
            tableVIew.reloadData()

        }
        catch {
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return horses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let horse = horses[indexPath.row]
        cell.textLabel?.text = horse.title
        cell.imageView?.image = UIImage(data: horse.image as! Data)
        return cell
    }

}

