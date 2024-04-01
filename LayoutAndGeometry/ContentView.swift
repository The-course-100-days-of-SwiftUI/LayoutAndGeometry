//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Margarita Mayer on 18/03/24.
//

import SwiftUI


struct ContentView: View {

	let colors: [Color] = [.red, .green, .blue, .yellow, .purple, .pink, .orange]
	
	var body: some View {
		GeometryReader { fullView in
			ScrollView {
				ForEach(0..<50) { index in
					GeometryReader { proxy in
						Text("Row #\(index)")
							.font(.title)
							.frame(maxWidth: .infinity)
//							.background(colors[index % 7])
//							.background(colors [min(Int(proxy.frame(in: .global).maxY) % 100, 6)])
							.background(
								Color(hue: min(Double(proxy.frame(in: .global).maxY) / 850, 1.0)
									  ,saturation: 1.0,
									  brightness: 1.0)
							)
							.rotation3DEffect(
								.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5  ,
								axis: (x: 0, y: 1, z: 0 )
							)
							.opacity(proxy.frame(in: .global).maxY < 30
									 ? 0
									 : (proxy.frame(in: .global).maxY < 200 ? max(0, min(1, Double(proxy.frame(in: .global).maxY / 200))) : 1))
							.scaleEffect(x: max(proxy.frame(in: .global).maxX / 500, 0.5), y: max(proxy.frame(in: .global).maxY / 500, 0.5))
							.onTapGesture {
								print(proxy.frame(in: .global).maxY)
							}
							
							
					}
					.frame(height: 40)
				}

			}
			
		}
	}
}

#Preview {
    ContentView()
}
