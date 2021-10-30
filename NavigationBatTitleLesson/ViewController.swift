//
//  ViewController.swift
//  NavigationBatTitleLesson
//
//  Created by UrataHiroki on 2021/10/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let titleDatas = ["Swift","Kotlin","Dart","Python","Ruby","Java","PHP","Go","JavaScript","TypeScript","C#","C++",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectCell = tableView.cellForRow(at: indexPath)
        
        let secoundVC = storyboard?.instantiateViewController(identifier: "secoundVC") as! SecoundViewController
        secoundVC.navigationItem.title = "\(selectCell?.textLabel?.text ?? "error")を選択"
        navigationController?.pushViewController(secoundVC, animated: true)
        
    }
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = titleDatas[indexPath.row]
        
        return cell
    }

}

