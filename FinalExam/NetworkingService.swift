//
//  NetworkingService.swift
//  FinalExam
//
//  Created by user239796 on 4/19/24.
//

import Foundation
import UIKit


protocol NetworkingCocktailsDelegate {
    func didFinishWithListofCocktails(list: [Cocktail]);
    func didFinishWithError();
}
protocol NetworkingIngredientsDelegate {
    func didFinishWithListofIngredients(dogImgUrl: String);
    func didFinishWithError();
}

class NetworkingService {
    static var shared = NetworkingService()
    
    var cocktailsDelegate: NetworkingCocktailsDelegate?
    var ingredientsDelegate: NetworkingIngredientsDelegate?
    
    func getListofCocktails(searchText: String) {
        let urlObj = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=\(searchText)")!
        let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
            
            if let _ = error {
                self.cocktailsDelegate?.didFinishWithError()
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                self.cocktailsDelegate?.didFinishWithError()
                return
            }
            
            ///
            if let jsonString = String(data: data!, encoding: .utf8) {
                print(jsonString)
                // convert json string ===> List of String
                do{
                    let dic = try JSONSerialization.jsonObject(with: data!) as? NSDictionary
                    let mainDic = dic!.value(forKey: "drinks") as? [NSDictionary]
                    var ctList = [Cocktail]()
                    
                    
                    for item in mainDic! {
                        
                        let name =  item.value(forKey: "strDrink") as? String
                        let id =  item.value(forKey: "idDrink") as? String
                        let imgStr = item.value(forKey: "strDrinkThumb") as? String
                        var imageData = Data()
                        do {
                            let urlObj = URL(string: imgStr!)
                            if let goodURL = urlObj {
                                imageData = try Data(contentsOf: goodURL)
                                let actualImage =  UIImage(data: imageData)
                                let tempCt = Cocktail(cocktailImage: actualImage, cocktailName: name!, cocktailId: id!)
                                ctList.append(tempCt)
                            }
                        } catch{
                            let actualImage =  UIImage(named: "folder")
                            let tempCt = Cocktail(cocktailImage: actualImage, cocktailName: name!, cocktailId: id!)
                            ctList.append(tempCt)
                                    
                        }
                    }
                    
                    
                    //print(ctList)
                    DispatchQueue.main.async {
                        self.cocktailsDelegate?.didFinishWithListofCocktails(list: ctList)
                    }
                    
                } catch {
                    print("Error parsing JSON: \(error)")
                    self.cocktailsDelegate?.didFinishWithError()
                }
            }
            
        }
        
        task.resume()
    }
    
    func getListofDogPictures(cocktailId: String){
        
    }
    
}
