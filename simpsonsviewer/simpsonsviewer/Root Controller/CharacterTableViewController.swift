//
//  CharacterTableViewController.swift
//  simpsonsviewer
//
//  Created by Nathan Kellert on 4/25/23.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    
    var characterTableViewModel: CharactersTableViewModel!
    
    var url = URL(string: "http://api.duckduckgo.com/?q=simpsons+characters&format=json")!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clearsSelectionOnViewWillAppear = false

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characterTableViewModel.characters.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let character = characterTableViewModel.characters[indexPath.row]
        cell.textLabel?.text = character.name
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CharacterTableViewController: CharactersTableViewModelDelegate {
    func didRecieveCharacters() {
        tableView.reloadData()
    }
}
