//
//  DesignElement.swift
//  kopfrechnen
//
//  Created by Sebastian Fox on 25.05.20.
//  Copyright © 2020 Sebastian Fox. All rights reserved.
//

import Combine
import SwiftUI

struct DesignHandler {
    @EnvironmentObject var userData: UserData
        
    func isBackgroundActive(design: String) -> Bool {
        
        if design != "blackboard" {
            return false
        } else {
            return true
        }
    }
    
    func getFontExercise(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 36)
        } else {
            return .chalk(size: 48)
        }
    }
    
    func getFontPadButtons(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 32)
        } else {
            return .chalk(size: 38)
        }
    }
    
    func getFontHeadline(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 36)
        } else {
            return .chalk(size: 36)
        }
    }
    
    func getFontText(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 39)
        } else {
            return .chalk(size: 39)
        }
    }
    
    func getFontResultList(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 21)
        } else {
            return .chalk(size: 21)
        }
    }
    
    func getFontSettingsMini(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 18)
        } else {
            return .chalk(size: 18)
        }
    }
    
    func getFontLittleOnceList(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 18)
        } else {
            return .chalk(size: 17)
        }
    }
    
    func getFontSettingsMinMax(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 21)
        } else {
            return .chalk(size: 21)
        }
    }
    
    func getFontSettingsLitteOnceMatch(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 23)
        } else {
            return .chalk(size: 22)
        }
    }
    
    func getFontMini(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 10)
        } else {
            return .chalk(size: 15)
        }
    }
    
    func getFontButton(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 27)
        } else {
            return .chalk(size: 33)
        }
    }
    
    func getFontGirls(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 18)
        } else {
            return .chalk(size: 27)
        }
    }
    
    func getFontSettingText(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 14)
        } else {
            return .chalk(size: 20)
        }
    }
    
    func getFontCircleButtonsText(design: String) -> Font {
        
        if design == "plain" {
            return .avenirNext(size: 14)
        } else {
            return .chalk(size: 19)
        }
    }
    
    func getCherryPinkGradient(design: String) -> LinearGradient {
        
        if design == "blackboard" {
            return gradientWhite
        } else {
            return gradientCherryAndPink
        }
    }
    
    func getBlackGradient(design: String) -> LinearGradient {
        
        if design == "blackboard" {
            return gradientWhite
        } else {
            return gradientBlack
        }
    }
    
    func getPeachPinkBackgroundGradient(design: String) -> LinearGradient {
        
        if design == "plain" {
            return gradientPeachAndPink
        } else {
            return gradientClear
        }
    }
    
    func getInvertedPeachPinkGradient(design: String) -> LinearGradient {
        
        if design == "plain" || design ==  "blackboard" {
            return gradientWhite
        } else {
            return gradientPeachAndPink
        }
    }
    
    func getSeaGreenBackgroundGradient(design: String) -> LinearGradient {
        
        if design == "plain" {
            return gradientSeaAndGreen
        } else {
            return gradientClear
        }
    }
    
    func getInvertedSeaGreenGradient(design: String) -> LinearGradient {
        
        if design == "plain" || design ==  "blackboard" {
            return gradientWhite
        } else {
            return gradientSeaAndGreen
        }
    }
    
    func getFontColor(design: String) -> Color {
        
        if design == "blackboard" {
            return .white
        } else {
            return .black
        }
    }
    
    func getNightCherryGradient(design: String) -> LinearGradient {
        
        if design == "blackboard" {
            return gradientWhite
        } else {
            return gradientNightAndCherry
        }
    }
    
    func getCherryPinkBackgroundGradient(design: String) -> LinearGradient {
        
        if design == "plain" {
            return gradientCherryAndPink
        } else {
            return gradientClear
        }
    }
    
    func getInvertedCherryPinkGradient(design: String) -> LinearGradient {
        
        if design == "plain" || design ==  "blackboard" {
            return gradientWhite
        } else {
            return gradientCherryAndPink
        }
    }
    
    func getInvertedNightCherryGradient(design: String) -> LinearGradient {
        
        if design == "plain" || design ==  "blackboard" {
            return gradientWhite
        } else {
            return gradientNightAndCherry
        }
    }
    
    func getSeaBlueBackgroundGradient(design: String) -> LinearGradient {
        
        if design == "plain" {
            return gradientSeaAndBlue
        } else {
            return gradientClear
        }
    }
    
    func getInvertedSeaBlueGradient(design: String) -> LinearGradient {
        
        if design == "plain" || design ==  "blackboard" {
            return gradientWhite
        } else {
            return gradientSeaAndBlue
        }
    }
    
    func getMainButtonWidth(design: String) -> CGFloat {
       if design == "plain" {
           return 200
       } else {
            return 300
       }
    }
    
    func isBlackboardSelected(design: String) -> Bool {
       if design == "blackboard" {
           return true
       } else {
            return false
       }
    }
    
    func isPaperSelected(design: String) -> Bool {
       if design == "paper" {
           return true
       } else {
            return false
       }
    }
    
    func isWhiteSelected(design: String) -> Bool {
       if design == "white" {
           return true
       } else {
            return false
       }
    }
    
//    gradientSeaAndBlue
}

var gradientSeaAndBlue: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                Color ("Sea"),
                .blue,
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}


var gradientNightAndCherry: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                Color ("Night"),
                Color ("Cherry"),
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientCherryAndPink: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                Color ("Cherry"),
                .pink,
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientPinkAndCherry: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                .pink,
                Color ("Cherry"),
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientPeachAndPink: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                Color ("Peach"),
                .pink,
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientPinkAndRed: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                .pink,
                .red
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientPinkAndOrange: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                .pink,
                .orange
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientOrangeAndYellow: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                .orange,
                .yellow
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}


var gradientGray: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                Color ("LightGray"),
                Color ("LightGray")
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientSeaAndGreen: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                Color ("Sea"),
                .green,
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientNightAndSea: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                Color ("Night"),
                Color ("Sea"),
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientNightAndBlue: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                Color ("Night"),
                .blue,
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}


var gradientWhite: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                .white,
                .white
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}


var gradientClear: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                .clear,
                .clear
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}



var gradientBlack: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                .black,
                .black
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientLimeAndCandy: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                Color ("Lime"),
                Color ("Candy")
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientPeachAndRedPeach: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                Color ("Peach"),
                Color ("RedPeach")
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientGreenAndCandy: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                .green,
                Color ("Candy")
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}

var gradientCandyAndGreen: LinearGradient {
    LinearGradient(
        gradient: Gradient(
            colors:
            [
                Color ("Candy"),
                .green
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}
