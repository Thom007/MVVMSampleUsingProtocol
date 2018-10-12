//
//  ArticleViewModel.swift
//  MVVMSampleUsingProtocol
//
//  Created by for Work on 5/30/2561 BE.
//  Copyright © 2561 for Work. All rights reserved.
//

import UIKit
import Alamofire

//protocol FetchDelegate: class {
//    func presentList(info: [ArticleModel]? )
//}

class ArticleViewModel {
    
    weak var delegate: FetchDelegate?
    
//    func fetchArticles(completion: @escaping ([ArticleModel]?) -> ()) {
//        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=49a36c5fd89c4852921acea7351aa95f"
//        let url = URL(string: urlString)
//        Alamofire.request(url!).responseObject { (response: DataResponse<URLResponse>) in
//            completion(response.result.value?.articles)
//        }
//    }
    
    func fetchArticles()  {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=49a36c5fd89c4852921acea7351aa95f"
        let url = URL(string: urlString)
        Alamofire.request(url!).responseObject { (response: DataResponse<URLResponse>) in
            let urlResponse = response.result.value?.articles ?? []
            self.delegate?.presentList(info: urlResponse)
        }
    }
}

