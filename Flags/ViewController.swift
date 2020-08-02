//
//  ViewController.swift
//  Consolidation2
//
//  Created by Damnjan Markovic on 23/07/2020.
//  Copyright © 2020 Damnjan Markovic. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        importCountries()
//        let blankView = UIView()
//        view.backgroundColor = .white
//        blankView.translatesAutoresizingMaskIntoConstraints = false
//        blankView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
//        blankView.heightAnchor.constraint(equalToConstant: 120).isActive = true
//        tableView.addSubview(blankView)
        
        
    }
    

    
    func importCountries() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.contains("country_") {
                let countryName = item.split(separator: "@")
                countries.append(String(countryName[0]))
            }
        }
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].uppercased()
        cell.imageView?.layer.borderWidth = 1
        cell.imageView?.layer.borderColor = UIColor.darkGray.cgColor
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Details") as? DetailsViewController {
            vc.countryName = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
            
        }
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//
//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50
//    }
//
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView(frame:CGRect (x: 0, y: 0, width: 320, height: 80) ) as UIView
//        view.backgroundColor = UIColor.white
//        return view
//    }


}

