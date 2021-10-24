//
//  ViewController.swift
//  Horizontal_TableView_Demo
//
//  Created by 준수김 on 2021/10/24.
//

import UIKit

private let cellID = "CollectionTableViewCell"

class ViewController: UIViewController {
    
    

    @IBOutlet var tableView: UITableView!
    
    var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        models.append(Model(text: "햄버거", imageName: "햄버거"))
        models.append(Model(text: "치킨", imageName: "치킨"))
        models.append(Model(text: "피자", imageName: "피자"))
        models.append(Model(text: "감자튀김", imageName: "감자튀김"))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count //테이블뷰 조절
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //cell의 높이를 250으로 일괄 설정
        return 250.0
    }
}
