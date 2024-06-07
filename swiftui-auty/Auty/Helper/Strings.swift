//
//  Strings.swift
//  Auty
//
//  Created by Treasure Letter on 17/04/2024.
//

import Foundation

public struct Strings {
  // MARK: - COMMON
  public struct Common {
    
    public static var hello: String {
      return NSLocalizedString("Common.hello", comment: "")
    }
    
    public static var and: String {
      return NSLocalizedString("Common.and", comment: "")
    }
    
    public static var cancel: String {
      return NSLocalizedString("Common.cancel", comment: "")
    }
    
    public static var confirm: String {
      return NSLocalizedString("Common.confirm", comment: "")
    }
    
    public static var save: String {
      return NSLocalizedString("Common.save", comment: "")
    }
    
    public static var register: String {
      return NSLocalizedString("Common.register", comment: "")
    }
    
    public static var logout: String {
      return NSLocalizedString("Common.logout", comment: "")
    }
    
    public static var login: String {
      return NSLocalizedString("Common.login", comment: "")
    }
    
    public static var name: String {
      return NSLocalizedString("Common.name", comment: "")
    }
    
    public static var email: String {
      return NSLocalizedString("Common.email", comment: "")
    }
    
    public static var password: String {
      return NSLocalizedString("Common.password", comment: "")
    }
    
    public static var confirmPassword: String {
      return NSLocalizedString("Common.confirmPassword", comment: "")
    }
    
    public static var skip: String {
      return NSLocalizedString("Common.skip", comment: "")
    }
    
    public static var next: String {
      return NSLocalizedString("Common.next", comment: "")
    }
  }
  
  // MARK: - GENDER
  public struct Gender {
    
    public static var male: String {
      return NSLocalizedString("Gender.male", comment: "")
    }
    
    public static var female: String {
      return NSLocalizedString("Gender.female", comment: "")
    }
    
    public static var other: String {
      return NSLocalizedString("Gender.other", comment: "")
    }
    
  }
  
  // MARK: - AUTHVIEW
  public struct AuthView {
    public static var slogan: String {
      return NSLocalizedString("AuthView.slogan", comment: "")
    }
    
    public static var quote: String {
      return NSLocalizedString("AuthView.quote", comment: "")
    }
  }
  
  // MARK: - LOGINVIEW
  public struct LoginView {
    
    public static var welcomeBack: String {
      return NSLocalizedString("LoginView.welcomeBack", comment: "")
    }
    
    public static var quote: String {
      return NSLocalizedString("LoginView.quote", comment: "")
    }
    
    public static var note: String {
      return NSLocalizedString("LoginView.note", comment: "")
    }
    
    public static var term: String {
      return NSLocalizedString("LoginView.term", comment: "")
    }
    
    public static var privacy: String {
      return NSLocalizedString("LoginView.privacy", comment: "")
    }
    
    public static var alter: String {
      return NSLocalizedString("LoginView.alter", comment: "")
    }
    
    public static var suggest: String {
      return NSLocalizedString("LoginView.suggest", comment: "")
    }
    
    public static var here: String {
      return NSLocalizedString("LoginView.here", comment: "")
    }
  }
  
  // MARK: - HOMEVIEW
  public struct HomeView {
    public static var autyLearning: String {
      return NSLocalizedString("HomeView.autyLearning", comment: "")
    }
    
    public static var course: String {
      return NSLocalizedString("HomeView.course", comment: "")
    }
    
    public static var courseCategory: String {
      return NSLocalizedString("HomeView.courseCategory", comment: "")
    }
    
    public static var info: String {
      return NSLocalizedString("HomeView.info", comment: "")
    }
    
    public static var survey: String {
      return NSLocalizedString("HomeView.survey", comment: "")
    }
    
    public static var progress: String {
      return NSLocalizedString("HomeView.progress", comment: "")
    }
    
    public static var tryOut: String {
      return NSLocalizedString("HomeView.tryOut", comment: "")
    }
    
    public static var recommend: String {
      return NSLocalizedString("HomeView.recommend", comment: "")
    }
    
    public static var topCourse: String {
      return NSLocalizedString("HomeView.topCourse", comment: "")
    }
    
    public static var price: String {
      return NSLocalizedString("HomeView.price", comment: "")
    }
    
    
  }
  
  // MARK: - COURSEVIEW
  public struct CourseView {
    public static var course: String {
      return NSLocalizedString("CourseView.course", comment: "")
    }
    
    public static var myCourse: String {
      return NSLocalizedString("CourseView.myCourse", comment: "")
    }
    
    public static var all: String {
      return NSLocalizedString("CourseView.all", comment: "")
    }
    
    public static var downloaded: String {
      return NSLocalizedString("CourseView.downloaded", comment: "")
    }
    
    public static var book: String {
      return NSLocalizedString("CourseView.book", comment: "")
    }
    
    public static var allMyCourse: String {
      return NSLocalizedString("CourseView.allMyCourse", comment: "")
    }
  }
  
  // MARK: - PROFILEVIEW
  public struct ProfileView {
    public static var profile: String {
      return NSLocalizedString("ProfileView.profile", comment: "")
    }
    
    public static var setting: String {
      return NSLocalizedString("ProfileView.setting", comment: "")
    }
    
    public static var payment: String {
      return NSLocalizedString("ProfileView.payment", comment: "")
    }
    
    public static var information: String {
      return NSLocalizedString("ProfileView.information", comment: "")
    }
    
    public static var frequentlyAsk: String {
      return NSLocalizedString("ProfileView.frequentlyAsk", comment: "")
    }
    
    public static var customerCare: String {
      return NSLocalizedString("ProfileView.customerCare", comment: "")
    }
    
    public static var aboutus: String {
      return NSLocalizedString("ProfileView.aboutus", comment: "")
    }
  }
  
  // MARK: - NAVIGATIONVIEW
  public struct NavigationView {
    public static var learning: String {
      return NSLocalizedString("NavigationView.learning", comment: "")
    }
    
    public static var information: String {
      return NSLocalizedString("NavigationView.information", comment: "")
    }
    
    public static var survey: String {
      return NSLocalizedString("NavigationView.survey", comment: "")
    }
  }
  
  // MARK: - ONBOARDINGVIEW
  public struct OnboardingView {
    public static var welcome: String {
      return NSLocalizedString("OnboardingView.welcome", comment: "")
    }
    
    public static var note: String {
      return NSLocalizedString("OnboardingView.note", comment: "")
    }
    
    public static var getStarted: String {
      return NSLocalizedString("OnboardingView.getStarted", comment: "")
    }
  }
  
  // MARK: - CHILDRENINFORMATIONVIEW
  public struct ChildrenInformationView {
    
    public static var childrenInformation: String {
      return NSLocalizedString("ChildrenInformationView.childrenInformation", comment: "")
    }
    
    public static var dob: String {
      return NSLocalizedString("ChildrenInformationView.dob", comment: "")
    }
    
    public static var gender: String {
      return NSLocalizedString("ChildrenInformationView.gender", comment: "")
    }
    
    public static var questionOne: String {
      return NSLocalizedString("ChildrenInformationView.questionOne", comment: "")
    }
    
    public static var questionTwo: String {
      return NSLocalizedString("ChildrenInformationView.questionTwo", comment: "")
    }
    
  }
  
  // MARK: - SURVEYVIEW
  public struct SurveyView {
    
    public static var title: String {
      return NSLocalizedString("SurveyView.title", comment: "")
    }
    
    public static var progress: String {
      return NSLocalizedString("SurveyView.progress", comment: "")
    }
    
    public static var notOften: String {
      return NSLocalizedString("SurveyView.notOften", comment: "")
    }
    
    public static var often: String {
      return NSLocalizedString("SurveyView.often", comment: "")
    }
    
    public static var veryOften: String {
      return NSLocalizedString("SurveyView.veryOften", comment: "")
    }
    
  }
  
  // MARK: - REGISTERVIEW
  public struct RegisterView {
    
    public static var welcome: String {
      return NSLocalizedString("RegisterView.welcome", comment: "")
    }
    
    public static var quote: String {
      return NSLocalizedString("RegisterView.quote", comment: "")
    }
    
    public static var signUpWithGoogle: String {
      return NSLocalizedString("RegisterView.signUpWithGoogle", comment: "")
    }
    
    public static var signUpWithFaceBook: String {
      return NSLocalizedString("RegisterView.signUpWithFaceBook", comment: "")
    }
    
    public static var suggest: String {
      return NSLocalizedString("RegisterView.suggest", comment: "")
    }
    
    public static var login: String {
      return NSLocalizedString("RegisterView.login", comment: "")
    }
    
  }
  
  // MARK: - CARTVIEW
  public struct CartView {
    
    public static var cart: String {
      return NSLocalizedString("CartView.cart", comment: "")
    }
    
    public static var hours: String {
      return NSLocalizedString("CartView.hours", comment: "")
    }
    
    public static var subTotal: String {
      return NSLocalizedString("CartView.subTotal", comment: "")
    }
    
    public static var discount: String {
      return NSLocalizedString("CartView.discount", comment: "")
    }
    
    public static var promocode: String {
      return NSLocalizedString("CartView.promocode", comment: "")
    }
    
    public static var total: String {
      return NSLocalizedString("CartView.total", comment: "")
    }
    
    public static var payment: String {
      return NSLocalizedString("CartView.payment", comment: "")
    }
    
    public static var remind: String {
      return NSLocalizedString("CartView.remind", comment: "")
    }
    
  }
}
