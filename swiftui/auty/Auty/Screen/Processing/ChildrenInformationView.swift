//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

// MARK: - ENUM
enum Gender: String, CaseIterable, Identifiable {
  case male
  case female
  case other
  
  var id: Self { self }
  
  func localizedString() -> String {
    switch self {
    case .male:
      return Strings.Gender.male
    case .female:
      return Strings.Gender.female
    case .other:
      return Strings.Gender.other
    }
  }
}

struct ChildrenInformationView: View {
  // MARK: - PROPERTY
  
  
  
  @State private var isAnimating: Bool = false
  
  @State private var nameTextField: String = ""
  @State private var dob = Date()
  @State private var gender: Gender = .male
  
  @State private var questionOne: Bool = false
  @State private var questionTwo: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      // MARK: - BACKGROUND LAYER
      VStack {
        HeaderView(title: Strings.ChildrenInformationView.childrenInformation)
          .padding()
        
        HStack(alignment: .top) {
          Spacer()
          Image("stick")
            .padding(.top, 50)
          
          Spacer()
          Image("children")
        }
        Spacer()
      }
      .shadow(color: .colorBlack.opacity(0.5) ,radius: 5, x: 3, y: 3)
      .opacity(isAnimating ? 1 : 0.4)
      .offset(x: isAnimating ? 0 : 100, y: isAnimating ? 0 : -100)
      .animation(.easeInOut(duration: 1), value: isAnimating)
      
      // MARK: - COMPONENT LAYER
      
      VStack(alignment: .center, spacing: 20) {
        Spacer(minLength: 250)
        // MARK: - INPUTVIEW
        
        // MARK: - NAMEINPUT
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .stroke(.colorBlue, lineWidth: 2)
          
          TextField(Strings.Common.name, text: $nameTextField)
            .font(.system(size: 22, weight: .medium, design: .rounded))
            .padding()
            .textInputAutocapitalization(.never)
        }
        .frame(width: 340, height: 60)
        .shadow(color: .colorBlack.opacity(0.5), radius: 2, x: 2, y: 2)
        
        
        // MARK: - DAYOFBIRTHINPUT
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .stroke(.colorBlue, lineWidth: 2)
            .shadow(color: .colorBlack.opacity(0.5), radius: 2, x: 2, y: 2)
          
          HStack {
            DatePicker(selection: $dob, displayedComponents: .date) {
              Text(Strings.ChildrenInformationView.dob)
                .font(.system(size: 22, weight: .medium, design: .rounded))
                .foregroundStyle(.colorBlack)
                .padding(.horizontal)
            }
            .datePickerStyle(CompactDatePickerStyle()).environment(\.locale, Locale.init(identifier: "vi"))
            .tint(.colorBlack)
            
            Spacer(minLength: 10)
          }
          
          .shadow(color: .colorBlack.opacity(0.5), radius: 8, x: 2, y: 2)
        }
        .frame(width: 340, height: 60)
        
        // MARK: - GENDERINPUT
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .stroke(.colorBlue, lineWidth: 2)
            .shadow(color: .colorBlack.opacity(0.5), radius: 2, x: 2, y: 2)
          
          HStack {
            Text(Strings.ChildrenInformationView.gender)
              .font(.system(size: 22, weight: .medium, design: .rounded))
              .foregroundStyle(.colorBlack)
              .padding(.horizontal)
            
            Spacer(minLength: 10)
            
            Picker("Gender", selection: $gender) {
              ForEach(Gender.allCases, id: \.self) { selected in
                Text(selected.localizedString())
                  .foregroundStyle(.colorWhite)
              }
            }
            .pickerStyle(.menu)
            .tint(.colorBlack)
          }
          .shadow(color: .colorBlack.opacity(0.5), radius: 8, x: 2, y: 2)
        }
        .frame(width: 340, height: 60)
        
        // MARK: -  TOGGLES
        VStack(alignment: .leading) {
          HStack(alignment: .center, spacing: 20) {
            CustomCheckBoxView(isChecked: $questionOne)
            
            Text(Strings.ChildrenInformationView.questionOne)
              .font(.system(size: 15, design: .rounded))
              .multilineTextAlignment(.leading)
            
          }
          .frame(alignment: .leading)
          .padding(.horizontal)
          
          HStack(alignment: .center, spacing: 20) {
            CustomCheckBoxView(isChecked: $questionTwo)
            
            Text(Strings.ChildrenInformationView.questionTwo)
              .font(.system(size: 15, design: .rounded))
              .multilineTextAlignment(.leading)
          }
          .frame(alignment: .leading)
          .padding(.horizontal)
        }
        .padding(.horizontal, 10)
        .shadow(color: .colorBlack.opacity(0.5), radius: 8, x: 1, y: 1)
        
        Spacer()
        
        // MARK: - SUBMIT BUTTON
        HStack(alignment: .center, spacing: 50) {
          // MARK: - SAVE BUTTON
          Button {
            print("\(gender.rawValue)")
          } label: {
            ZStack {
              RoundedRectangle(cornerRadius: 8)
                .fill(Color.yellow)
                .frame(width: 130, height: 40)
              
              HStack {
                Image(systemName: "xmark")
                  .fontWeight(.bold)
                  .foregroundStyle(.colorWhite)
                
                Text(Strings.Common.cancel)
                  .font(.system(size: 20, weight: .bold, design: .rounded))
                  .foregroundStyle(.colorWhite)
              }
            }
          }
          
          // MARK: - CANCEL BUTTON
          Button {
            print("\(gender.rawValue)")
          } label: {
            ZStack {
              RoundedRectangle(cornerRadius: 8)
                .frame(width: 130, height: 40)
              
              HStack {
                Image(systemName: "checkmark")
                  .fontWeight(.bold)
                  .foregroundStyle(.colorWhite)
                
                Text(Strings.Common.save)
                  .font(.system(size: 20, weight: .bold, design: .rounded))
                  .foregroundStyle(.colorWhite)
              }
            }
          }
          
        }
        .shadow(color: .colorBlack.opacity(0.5), radius: 8, x: 2, y: 2)
        
        // MARK: - BUTTONVIEW
        Spacer()
      }
      .opacity(isAnimating ? 1 : 0.4)
      .offset(x: isAnimating ? 0 : -100, y: isAnimating ? 0 : 100)
      .animation(.easeInOut(duration: 1), value: isAnimating)
    }
    .onAppear {
      //      withAnimation {
      isAnimating.toggle()
      //      }
    }
  }
}

// MARK: PREVIEW
#Preview {
  ChildrenInformationView()
}
