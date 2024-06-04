//
//  AutyApp.swift
//  Auty
//
//  Created by Treasure Letter on 31/03/2024.
//

import SwiftUI

@main
struct AutyApp: App {
  // MARK: - PROPERTY  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  @AppStorage("home") var isHomeViewActive: Bool = false
  @AppStorage("information") var isInformationViewActive: Bool = false
  @AppStorage("survey") var isSurveyViewActive: Bool = false
  
  var body: some Scene {
    WindowGroup {
      RegisterView()
//      ZStack {
//        if isOnboardingViewActive {
//          OnboardingView()
//        } else {
//          if isHomeViewActive {
//            HomeView()
//          } else if isInformationViewActive {
//            InformationView()
//          } else if isSurveyViewActive {
//            SurveyView()
//          } else {
//            NavigationView()
//          }
//        }
//      }
//      .onAppear {
//        self.isSurveyViewActive = false
//        self.isInformationViewActive = false
//      }
    }
  }
}
