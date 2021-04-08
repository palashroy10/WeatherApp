//
//  BottomScroller.swift
//  WeatherForecast
//
//  Created by Palash Roy on 3/17/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import SwiftUI

struct BottomScroller: View {
    @ObservedObject var forecastViewModel: ForecastViewModel
    
    var body: some View {
       
            ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        
                        ForEach(forecastViewModel.forecastList()) { forecast in
                            ZStack{
                                Rectangle().fill(Color(.white))
                                .frame(width: 200, height: 200)
                                .cornerRadius(40.0)
                                
                                
                                
                                VStack(alignment: .leading) {
                                    Text("\(forecast.date)").foregroundColor(Color(.gray))
                                    HStack {
                                        Image(systemName: forecast.wimage)
                                        .resizable() .foregroundColor(Color("secondary")).background(Color("lightPink"))
                                            .frame(width: 80, height: 80)
                                            .cornerRadius(20)
                                            .padding(.leading, -5)
                                        
                                        VStack(alignment: .leading, spacing: 5){
                                            HStack {
                                                Text("\(forecast.min)")
                                                Image(systemName: "arrow.down").resizable().frame(width: 7, height: 10)
                                            }
                                            HStack {
                                                Text("\(forecast.max)")
                                                Image(systemName: "arrow.up").resizable().frame(width: 7, height: 10)
                                            }
                                            Text("Hum: \(forecast.hum)%")
                                            Text("Win: \(forecast.wind)")
                                        }.foregroundColor(Color(.gray))
                                    }
                                    
//                                }
                                
                                
                                }.frame(width: 200, height: 200)
                                    .background(Color(.white))
                            .cornerRadius(40)
                                
                            
                            
                            }
                        
                        
                    }.padding(.horizontal, 10)
            }.frame(height: 200)
        }.frame(width: UIScreen.main.bounds.width)
        
        
    }
}

struct BottomScroller_Previews: PreviewProvider {
    static var previews: some View {
        BottomScroller(forecastViewModel: ForecastViewModel()).background(Color.blue)
    }
}
