 //
//  BackSplash.swift
//  WeatherForecast
//
//  Created by Palash Roy on 3/15/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import SwiftUI

struct BackSplash: View {
    var body: some View {
        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
    }
}

struct BackSplash_Previews: PreviewProvider {
    static var previews: some View {
        BackSplash()
    }
}
