//
//  QuotesService.swift
//  QuotyFun
//
//  Created by odc on 14/2/2022.
//

import Foundation
import SwiftUI


public final class QuotesService: NSObject{
    private let headers = [
        "x-rapidapi-host": "quotes15.p.rapidapi.com",
        "x-rapidapi-key": "a5b15e0ed9msh2ec5b92028bdf02p1d28e7jsn44ec38f0a765"
    ]
    private var completionHandler: ((Quote)->Void)?
    
    public override init(){
        super.init()
        
    }
    
    public func loadQuotesData (_ completionHandler: @escaping(Quote)->Void){
        self.completionHandler = completionHandler
        
    }
    
    public func makeDataRequest (_ completionHandler: @escaping(Quote?)->Void){

        let request = NSMutableURLRequest(url: NSURL(string: "https://quotes15.p.rapidapi.com/quotes/random/?language_code=en")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                
                if let data = data {
                    print("data m3abya")
                    let result = try? JSONDecoder().decode(APIResponse.self, from: data)
                    guard let result = result else {completionHandler(nil); return}
                    let quote = Quote(response: result)
                    print("el resuuuuuuuuult")
                    print(result)
                    completionHandler(quote)
                    
                }else{
                    completionHandler(nil)
                }
                
            }
        })

        dataTask.resume()
    }

}



struct APIResponse: Decodable{
    let language_code : String
    let content : String
    let tags : [String]
    let originator : APIOriginator
}


struct APIOriginator : Decodable{
    let name : String
    let url : String
}
