//
//  QuoteViewModel.swift
//  QuotyFun
//
//  Created by odc on 14/2/2022.
//

import Foundation

public class QuoteViewModel: ObservableObject {
    
    @Published var languagevalue: String = ""
    @Published var contentValue: String = ""
    @Published var tagsvalue: [String] = [""]
    @Published var authorvalue: String = ""
    @Published var authorurl: String = ""
    public let quoteService : QuotesService
    
    public init(quoteService: QuotesService){
        self.quoteService = quoteService
    }
    
    public func refresh() {
        
        quoteService.makeDataRequest{ quote in
            DispatchQueue.main.async {

                guard let quote = quote else {
                    return
                }
                
                self.languagevalue = quote.language_code
                self.contentValue = quote.content
                self.tagsvalue = quote.tags
                self.authorvalue = quote.author
                self.authorurl = quote.urlAuthor
            }
            
        }
        
    }
}
