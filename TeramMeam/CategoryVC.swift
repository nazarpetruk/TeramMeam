//
//  CategoryVC.swift
//  TeramMeam
//
//  Created by Nazar Petruk on 03/02/2020.
//  Copyright © 2020 Nazar Petruk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CategoryVC: UIViewController {

    @IBOutlet var tableView: UITableView!

     override func viewDidLoad() {
       super.viewDidLoad()

       startDownload()
     }

     func startDownload() {
       
     }
     
     // MARK: UITableViewDataSource
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 0
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell")!
       return cell
    }
}
