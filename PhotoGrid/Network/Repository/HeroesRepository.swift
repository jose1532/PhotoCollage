//
//  HeroesRepository.swift
//  PhotoGrid
//
//  Created by everis on 10/08/21.
//

import Foundation

struct HeroesRepository: RestAPI {
    func getHeroes(completion: @escaping (ResponseAPI<[Superhero]>) -> Void ) {

        let url = "\(EndPoints.baseURL.rawValue)\(EndPoints.getHeroes.rawValue)"
        callService(urlString: url, verb: .get) { (response: ResponseAPI<[Superhero]>) in
            switch response {
            case .success(let dto):
                completion(.success(dto))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}
