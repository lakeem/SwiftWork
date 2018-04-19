//
//  TableViewController.swift
//  20180418-LM-NYCSchools
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
        let getFileNames = SetUpFiles()
        _ = testData.loadAndPrepData(getFileNamesFrom: getFileNames)
        
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
