//
//  TableViewController.swift
//  JPCApp
//
//  Created by lakeem muhammad on 4/18/18.
//  Copyright © 2018 lakeem muhammad. All rights reserved.
//

import UIKit


var myIndex = 0;

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Let the ViewModel handle importing xml and data preparation.
        let testData = ViewModel()
        let listOfSchoools = testData.loadAndPrepData()
        //this is only for debug and testing. This block can be ignored.
        for school in listOfSchoools{
            print(school.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataPrepComplete.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

       cell.textLabel?.text = dataPrepComplete[indexPath.row].schoolName
    return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segueA", sender: self)
    }
    
    


}
