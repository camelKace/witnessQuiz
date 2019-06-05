//
//  questionBank.swift
//  witnessQuiz
//
//  Created by Kacey Jimenez on 6/2/19.
//  Copyright © 2019 camelKace. All rights reserved.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    var shuffled = [Question]()

    init() {
        list.append(Question(questionText: "Where was Jesus Born?", choiceA: "Bethlehem", choiceB: "Israel", choiceC: "Jerusalem", choiceD: "Egypt", answer: 1))
        list.append(Question(questionText: "What did David use to kill Goliath?", choiceA: "Stick", choiceB: "Sling and rock", choiceC: "Sword", choiceD: "Bow and arrow", answer: 2))
        list.append(Question(questionText: "Which of the following are not one of the 12 disciples?", choiceA: "Matthew", choiceB: "Paul", choiceC: "Judas", choiceD: "Isaiah", answer: 4))
        list.append(Question(questionText: "Which one of the following are not one of God's fruitage of the Spirit?", choiceA: "Love", choiceB: "Patience", choiceC: "Meekness", choiceD: "Peace", answer: 3))
        list.append(Question(questionText: "Which one of these match this Bible text? He will wipe out every tear from their eyes, and death will be no more...", choiceA: "Genesis 4:8", choiceB: "Psalms 21:8", choiceC: "1 Peter 5:5", choiceD: "Revelation 21:4", answer: 4))
        list.append(Question(questionText: "What Bible character was eaten by a fish?", choiceA: "Noah", choiceB: "Jonah", choiceC: "Daniel", choiceD: "Job", answer: 2))
        list.append(Question(questionText: "Which one of the following Apostles were a tax collector?", choiceA: "Matthew", choiceB: "Judas", choiceC: "Peter", choiceD: "None of the above", answer: 1))
        list.append(Question(questionText: "At what age was Jesus baptized?", choiceA: "24", choiceB: "12", choiceC: "30", choiceD: "19", answer: 3))
        list.append(Question(questionText: "Lots wife turned into what when she looked back at the city Sodom and Gomorrah?", choiceA: "Sand", choiceB: "Pillar of Salt", choiceC: "Dust", choiceD: "Ice", answer: 2))
        list.append(Question(questionText: "Who did Jehovah call his Friend?", choiceA: "Jesus", choiceB: "Jeremiah", choiceC: "Moses", choiceD: "Abraham", answer: 4))
        list.append(Question(questionText: "How old was Noah when the Deluge occurred?", choiceA: "250 years old", choiceB: "600 years old", choiceC: "500 years old", choiceD: "80 years old", answer: 2))
        list.append(Question(questionText: "Which one of these match this Bible text? And this good news of the Kingdom will be preached in all the inhabited earth... ", choiceA: "Matthew 24:14", choiceB: "Exodus 39:2", choiceC: "1 Chronicles 8:10", choiceD: "Zechariah 8:2", answer: 1))
        list.append(Question(questionText: "What Bible book goes after Job?", choiceA: "Proverbs", choiceB: "Numbers", choiceC: "Psalms", choiceD: "Lamentations", answer: 3))
        list.append(Question(questionText: "Who did Jehovah use to part the Red Sea?", choiceA: "Moses", choiceB: "Aaron", choiceC: "Joshua", choiceD: "None of the above", answer: 1))
        list.append(Question(questionText: "How many people did Jesus feed with 7 loaves of bread and a few small fish?", choiceA: "1000", choiceB: "200", choiceC: "4000", choiceD: "5000", answer: 3))
        
        
        
        
        
        list.append(Question(questionText: "Who was the king that wanted to build a tower so tall that would reach into the heavens", choiceA: "1000", choiceB: "Nim’rod", choiceC: "4000", choiceD: "5000", answer: 2))
        list.append(Question(questionText: "Who is the Bible character Jehovah spoke to through a bush on fire?", choiceA: "Manna", choiceB: "200", choiceC: "Moses", choiceD: "5000", answer: 1))
        list.append(Question(questionText: "What city was Ra’hab living in when she hid the two Israelite spies?", choiceA: "1000", choiceB: "200", choiceC: "4000", choiceD: "Jericho", answer: 4))
        list.append(Question(questionText: "Who was the strongest man who ever lived on earth?", choiceA: "1000", choiceB: "200", choiceC: "Samson", choiceD: "5000", answer: 3))
        list.append(Question(questionText: "Who was jealous of David and tried to kill him after he killed Goliath?", choiceA: "Saul", choiceB: "200", choiceC: "4000", choiceD: "5000", answer: 1))
        
        list.append(Question(questionText: "What was the law that caused Daniel to be thrown into the lions pit?", choiceA: "1000", choiceB: "200", choiceC: "4000", choiceD: "For 30 days no one should pray to any God or man except to the king.", answer: 4))
        list.append(Question(questionText: "Who was the man that baptized Jesus?", choiceA: "1000", choiceB: "John", choiceC: "4000", choiceD: "5000", answer: 2))
        list.append(Question(questionText: "Who was so angry and jealous that caused him to kill his own brother?", choiceA: "Cain", choiceB: "200", choiceC: "4000", choiceD: "5000", answer: 1))
        list.append(Question(questionText: "How many sons did Jacob have?", choiceA: "1000", choiceB: "200", choiceC: "12", choiceD: "5000", answer: 3))
        list.append(Question(questionText: "Which of the following was not one of the 10 Plagues?", choiceA: "1000", choiceB: "200", choiceC: "4000", choiceD: "Every second born son killed", answer: 4))
        
        list.append(Question(questionText: "What did Moses do to cause him to flee Egypt?", choiceA: "Kill an Egyptian", choiceB: "200", choiceC: "4000", choiceD: "5000", answer: 1))
        list.append(Question(questionText: "Joseph was thrown into prison because of who’s wife?", choiceA: "1000", choiceB: "Potiphar’s", choiceC: "4000", choiceD: "5000", answer: 2))
        list.append(Question(questionText: "What bible book comes after Acts?", choiceA: "1000", choiceB: "200", choiceC: "4000", choiceD: "Romans", answer: 4))
        list.append(Question(questionText: "Which one of these match this Bible text? May people know that you, whose name is Jehovah You alone are the Most High over all the earth...", choiceA: "1000", choiceB: "Psalm 83:18", choiceC: "4000", choiceD: "5000", answer: 2))
        list.append(Question(questionText: "The name of Jocob’s twin brother was?", choiceA: "E’sau", choiceB: "200", choiceC: "4000", choiceD: "5000", answer: 1))
        
        shuffled = shuffleArray(arrayToBeShuffled: list)
    }
}
