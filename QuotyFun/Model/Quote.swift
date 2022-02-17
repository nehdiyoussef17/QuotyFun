//
//  Quote.swift
//  QuotyFun
//
//  Created by odc on 14/2/2022.
//

import Foundation


public struct Quote:Decodable {
    let language_code : String
    let content : String
    let tags : [String]
    let author : String
    let urlAuthor : String


    init(response: APIResponse){
    language_code = response.language_code
    content = response.content
    tags = response.tags
    author = response.originator.name
    urlAuthor = response.originator.url
    }
    
}
