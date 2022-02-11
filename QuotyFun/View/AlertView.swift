//
//  WelcomeView.swift
//  QuotyFun
//
//  Created by odc on 9/2/2022.
//

import SwiftUI


enum AlertViewType
{
    
    case Warning
    case Error
    case Success
        
}

struct AlertView: View {
    
    @State var color = Color.black.opacity(0.7)
    var error : String
    @Binding var type : AlertViewType?
     
    func getBackgroudColor() -> Color
    {
        switch self.type
        {
        case .Warning:
            return Color("asfer")
        case .Error:
            return Color("a7mer")
        case .Success:
            return Color("a5dher")
        case .none:
            return Color("a5dher")
        }
        
    }
    
    
    func getTitle()->String
    {
        switch self.type
        {
        case .Warning:
            return "Warning"
        
        case .Error:
            return "Error"
        
        case .Success:
            return "Success"
        case .none:
            return "Error"
        }
    }
    
    var body: some View {
        GeometryReader{_ in
            VStack{
                HStack{
                    Text(getTitle())
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                
                Button(action: {
                    
                    self.type = nil
                    
                })
                {
                    Text("Ok !")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 160)
                }
                .background(getBackgroudColor())
                .cornerRadius(10)
                .padding(.top, 20)
                .padding(.bottom, 20)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
            .padding(.horizontal,30)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
        
    }
}

