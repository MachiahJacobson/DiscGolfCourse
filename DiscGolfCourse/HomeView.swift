//
//  HomeView.swift
//  DiscGolfCourse
//
//  Created by Jacobson, Machiah - Student on 10/28/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange, Color.red]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                    VStack(spacing: 40) {
                        ZStack {
                        Text("Aggie Gr       ns Disc Golf Course")
                            .font(.custom("Impact", size: 110,))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.top, 80)
                            Image("grass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100, alignment: .trailing)
                                .padding(.leading, 160)
                                .padding(.bottom, 60)
                            Image("grass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100, alignment: .trailing)
                                .padding(.leading, 300)
                                .padding(.bottom, 60)
                    
                                
                    }
                    Image("sunset")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10)
                    
                    NavigationLink(destination: ContentView()
                        .navigationBarBackButtonHidden(true)) {
                            Text("Start Course")
                                .font(.system(size: 33))
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }
                        .padding(40)
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    HomeView()
}
