//
//  TestView.swift
//  QuotyFun
//
//  Created by odc on 16/2/2022.
//

import SwiftUI
import Firebase

struct TestView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.white
            VStack() {
                      HStack{
                          Spacer()
                              Image(systemName: "rectangle.portrait.and.arrow.right")
                                  .foregroundColor(Color("Color"))
                                  .font(.system(size: 30))
                                  .aspectRatio(contentMode: .fit)
                      }
                  
                  .padding(10)
            
                    VStack(){
                        
                            HStack{
                                Text("Author")
                                   
                                    .font(.custom("CaviarDreams_Bold", size: 30))
                                Spacer()
                                Image(systemName: "person.circle")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 60))
                                }//Hstack
                            Divider()
                        ScrollView(){
                                Text("Content")
                                    .font(.custom("CaviarDreams", size: 30))
                                    .foregroundColor(Color.black)
                            }
                        
                        Image(systemName: "heart")
                            .font(.system(size: 30))
                            .aspectRatio(contentMode: .fit)
                            .padding()//ScrollView
                        }//GrayVstack
                    .overlay(RoundedRectangle(cornerRadius: 25,style: .continuous)
                    .fill(.gray.opacity(0.4)))
                    .padding()
                
                Text("⇠ Swipe Here ⇢")
                    .padding(30)
                    .font(.custom("CaviarDreams_Bold", size: 18))
                ScrollView(.horizontal){
                Text ("Tags Tags Tags Tags Tags Tags Tags Tags Tags Tags Tags Tags Tags ")
                    .font(.custom("CaviarDreams_Bold", size: 18))
                    .foregroundColor(Color("Color"))
                }.padding()
  
            }//ParentVStack
        }//Zstack
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
