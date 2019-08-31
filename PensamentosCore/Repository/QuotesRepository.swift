//
//  Repository.swift
//  Pensamentos
//
//  Created by Alessandro on 24/08/19.
//  Copyright © 2019 Alessandro. All rights reserved.
//

import Foundation


protocol QuotesRepositoryProtocol{
    func getRandomQuote()->QuoteEntity
}

class QuotesRepository: QuotesRepositoryProtocol{
    
    var quoutes:[QuoteEntity] = []
    var fileURL = Constants.Repository.url
    var jsonData:Data?
    var jsonDecoder = JSONDecoder()
    
    init() {
        do {
            jsonData = try Data(contentsOf: Constants.Repository.url)
            quoutes  = try! jsonDecoder.decode([QuoteEntity].self , from: jsonData!)
        }catch {
            print("Erro ao acessar URL: \(error)")
        }
    }
    
    func getRandomQuote() -> QuoteEntity {
        let index = Int(arc4random_uniform(UInt32(quoutes.count)))
        return quoutes[index]
    }
    
    
    
}
