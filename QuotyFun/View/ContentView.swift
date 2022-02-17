
//
//  ContentView.swift
//  QuotyFun
//
//  Created by odc on 9/2/2022.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ContentView: View {
    @ObservedObject var quoteViewModel: QuoteViewModel
    @State private var showWebView = false
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
            VStack() {
                      HStack{
                          Button(action: {
                              
                          }){
                              Image(systemName: "heart.text.square")
                                  .foregroundColor(Color("Color"))
                                  .font(.system(size: 30))
                                  .aspectRatio(contentMode: .fit)
                          }
                              
                          Spacer()
                          
                          Button(action: {
                              try! Auth.auth().signOut()
                              UserDefaults.standard.set(false, forKey: "status")
                              NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                          }){
                              Image(systemName: "rectangle.portrait.and.arrow.right")
                                  .foregroundColor(Color("Color"))
                                  .font(.system(size: 26))
                                  .aspectRatio(contentMode: .fit)
                          }
                      }
                  
                  .padding(30)
            
                HStack{
                    Spacer()
                    Button("ViewAuthor"){
                        
                        
                        showWebView.toggle()
                        
                        
                    }.sheet(isPresented: $showWebView){
                        WebView(url: URL(string: quoteViewModel.authorurl)!)
                            
                       
                    }.padding(.horizontal,30)
                    
                }
                    VStack(){
                        
                            HStack{
                                Text(quoteViewModel.authorvalue)
                                    .font(.custom("CaviarDreams_Bold", size: 27))
                                    .padding(8)
                                Spacer()
                                
                               
                                .padding()
                                }//Hstack
                            Divider()
                            ScrollView(.vertical){
                                Text(quoteViewModel.contentValue)
                                    .font(.custom("CaviarDreams", size: 20))
                                    .foregroundColor(Color.black)
                            }
                        Divider()
                        Image(systemName: "heart")
                            .font(.system(size: 30))
                            .aspectRatio(contentMode: .fit)
                            .padding()//ScrollView
                        }//GrayVstack
                    .overlay(RoundedRectangle(cornerRadius: 25)
                    .fill(.gray.opacity(0.4)))
                    .padding(.horizontal,20)
                
                
                HStack{
                Text("⇠ Swipe Here ⇢")
                    .padding()
                    .font(.custom("CaviarDreams_Bold", size: 28))
                    
                }.padding(.horizontal,73)
                    .padding(.bottom,100 )
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                .onEnded({ value in
                                 if value.translation.width < 0 {
                                     quoteViewModel.refresh()
                                     print("Conteeeeeeeeeeent")
                                     print(quoteViewModel.contentValue)
                                     print("Languaaaaage")
                                     print(quoteViewModel.languagevalue)
                                     print("tags")
                                     print(quoteViewModel.tagsvalue)
                                     print("link")
                                     print(quoteViewModel.authorurl)
                                 }

                                 if value.translation.width > 0 {
                                     print("previous")
                                 }
                             }))
                
             
                ScrollView(.horizontal , showsIndicators: false){
                Text (quoteViewModel.tagsvalue.joined(separator: "      "))
                    .font(.custom("CaviarDreams_Bold", size: 18))
                    .foregroundColor(Color("Color"))
                }.padding(20)
  
            }//ParentVStack
        }.task //Zstack
        {
            quoteViewModel.refresh()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(quoteViewModel: QuoteViewModel(quoteService: QuotesService()))
    }
}





