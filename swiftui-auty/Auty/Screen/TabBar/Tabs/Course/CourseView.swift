//
// Created by Treasure Letter ♥
//
// https://github.com/tinit4ever
//

import SwiftUI

struct CourseView: View {
  // MARK: - PROPERTY
  
  
  @State private var selectedSegment: CoursePicker = .myCourse
  @State var temp: String = ""
  
  enum CoursePicker: String, CaseIterable, Identifiable {
    case myCourse
    case allCourse
    case download
    case ebook
    
    var id: Self { self }
    
    func localizedString() -> String {
      switch self {
      case .myCourse:
        return Strings.CourseView.myCourse
      case .allCourse:
        return Strings.CourseView.all
      case .download:
        return Strings.CourseView.downloaded
      case .ebook:
        return Strings.CourseView.book
      }
    }
  }
  
  @State private var isAnimating: Bool = false
  
  init() {
    // Sets the background color of the Picker
    UISegmentedControl.appearance().backgroundColor = .colorBlue.withAlphaComponent(0.45)
    // Disappears the divider
    UISegmentedControl.appearance().setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    // Changes the color for the selected item
    UISegmentedControl.appearance().selectedSegmentTintColor = .colorBlue
    
    
    // Changes the text color for the selected item
    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white, .font: UIFont(name: "Arial Rounded MT Bold", size: 13) ?? .systemFont(ofSize: 13)], for: .selected)
    
    UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray, .font: UIFont(name: "Arial Rounded MT Bold", size: 10) ?? .systemFont(ofSize: 10)], for: .normal)
    
  }
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      // MARK: - HEADER
      VStack(spacing: 20) {
        HeaderView(title: Strings.CourseView.course, isTrailingButtonActive: true)
          .shadow(color: .colorBlack.opacity(0.4), radius: 7)
        
        Picker(selection: $selectedSegment) {
          ForEach(CoursePicker.allCases, id: \.self) { selected in
            Text(selected.localizedString())
              .foregroundStyle(.colorWhite)
          }
        } label: {
          Text("Categories")
        }
        .padding(.horizontal, 20)
        .pickerStyle(SegmentedPickerStyle())
      }
      .opacity(isAnimating ? 1 : 0)
      .offset(y: isAnimating ? 0 : -40)
      .animation(.easeOut(duration: 1), value: isAnimating)
      
      // MARK: - CENTER
      if selectedSegment == .myCourse {
        MyCourseView()
      }
      
      Spacer(minLength: 60)
      
      // MARK: - FOOTER
    }
    .padding()
    .onAppear {
      self.isAnimating = true
    }
  }
}

// MARK: PREVIEW
#Preview {
  CourseView()
}
