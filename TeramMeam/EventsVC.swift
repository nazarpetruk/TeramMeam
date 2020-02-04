//
//  EventsVC.swift
//  TeramMeam
//
//  Created by Nazar Petruk on 03/02/2020.
//  Copyright © 2020 Nazar Petruk. All rights reserved.
//

import UIKit
import RxSwift

class EventsVC: UIViewController {

   @IBOutlet var tableView: UITableView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var daysLabel: UILabel!

    override func viewDidLoad() {
      super.viewDidLoad()

      tableView.rowHeight = UITableViewAutomaticDimension
      tableView.estimatedRowHeight = 100
    }

    @IBAction func sliderAction(slider: UISlider) {
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventCell
      return cell
    }
}
