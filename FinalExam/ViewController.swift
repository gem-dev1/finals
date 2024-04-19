//
//  ViewController.swift
//  FinalExam
//
//  Created by user239796 on 4/19/24.
//

import UIKit





class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NetworkingCocktailsDelegate {
    
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    var networkingService = NetworkingService.shared
    
    var cocktailList = (UIApplication.shared.delegate as? AppDelegate)!.cocktailsList
    
    
    @IBOutlet weak var ctTableView: UITableView!
    
    
    func didFinishWithListofCocktails(list: [Cocktail]) {
        appDelegate?.cocktailsList = list
        print(appDelegate?.cocktailsList)
        ctTableView.reloadData()
        //
    }
    
    func didFinishWithError() {
        //
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingService.shared.cocktailsDelegate = self
        NetworkingService.shared.getListofCocktails(searchText: "gin");
       
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    //func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        //if searchText.count > 2 {
          //  NetworkingService.shared.getListofCocktails(searchText: searchText)
        //}
        //if searchText.count == 0 {
          //  appDelegate?.cocktailsList = []
            //ctTableView.reloadData()
        //}
    
    //}
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (appDelegate?.cocktailsList.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? cocktailsTableViewCell
        
        cell?.ctName.text = appDelegate?.cocktailsList[indexPath.row].cocktailName
        cell?.ctImg.image = appDelegate?.cocktailsList[indexPath.row].cocktailImage

        // Configure the cell...

        return cell!
        //
    }


}

