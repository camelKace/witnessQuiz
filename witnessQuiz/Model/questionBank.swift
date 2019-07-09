//
//  questionBank.swift
//  witnessQuiz
//
//  Created by Kacey Jimenez on 6/2/19.
//  Copyright © 2019 camelKace. All rights reserved.
//

import Foundation

class EasyQuestionBank {
    var list = [Question]()
    var shuffled = [Question]()

    init() {
        list.append(Question(questionText: "What food did Jehovah provide the Isrealites during the years they lived in the wilderness?", choiceA: "Manna", choiceB: "Rice", choiceC: "Meat", choiceD: "Fruit", answer: 1))
        list.append(Question(questionText: "Where was Jesus Born?", choiceA: "Bethlehem", choiceB: "Israel", choiceC: "Jerusalem", choiceD: "Egypt", answer: 1))
        list.append(Question(questionText: "What did David use to kill Goliath?", choiceA: "Stick", choiceB: "Sling and rock", choiceC: "Sword", choiceD: "Bow and arrow", answer: 2))
        list.append(Question(questionText: "Which of the following are not one of the 12 disciples?", choiceA: "Matthew", choiceB: "Andrew", choiceC: "Judas", choiceD: "Isaiah", answer: 4))
        list.append(Question(questionText: "Which one of these match this Bible text? \n He will wipe out every tear from their eyes, and death will be no more...", choiceA: "Genesis 4:8", choiceB: "Psalms 21:8", choiceC: "1 Peter 5:5", choiceD: "Revelation 21:4", answer: 4))
        list.append(Question(questionText: "What Bible character was swallowed whole by a fish?", choiceA: "Noah", choiceB: "Jonah", choiceC: "Daniel", choiceD: "Job", answer: 2))
        list.append(Question(questionText: "Lots wife turned into what when she looked back at the city of Sodom and Gomorrah?", choiceA: "Sand", choiceB: "Pillar of Salt", choiceC: "Dust", choiceD: "Ice", answer: 2))
        list.append(Question(questionText: "Who did Jehovah call his friend?", choiceA: "Jesus", choiceB: "Jeremiah", choiceC: "Moses", choiceD: "Abraham", answer: 4))
        list.append(Question(questionText: "Who did Jehovah use to part the Red Sea?", choiceA: "Moses", choiceB: "Aaron", choiceC: "Joshua", choiceD: "None of the above", answer: 1))
        list.append(Question(questionText: "Who is the Bible character Jehovah spoke to through a bush on fire?", choiceA: "Timothy", choiceB: "Daniel", choiceC: "Moses", choiceD: "Joseph", answer: 3))
        list.append(Question(questionText: "Who was the strongest man who ever lived on earth?", choiceA: "Jesus", choiceB: "Micah", choiceC: "Samson", choiceD: "David", answer: 3))
        list.append(Question(questionText: "Who was the man that baptized Jesus?", choiceA: "Judas", choiceB: "John", choiceC: "Paul", choiceD: "Joseph", answer: 2))
        list.append(Question(questionText: "Who was so angry and jealous it that caused him to kill his own brother?", choiceA: "Cain", choiceB: "Judah", choiceC: "Simeon", choiceD: "Reuben", answer: 1))
        list.append(Question(questionText: "How many trees had meaning in the Garden of Eden?", choiceA: "1", choiceB: "2", choiceC: "3", choiceD: "4", answer: 2))
        list.append(Question(questionText: "How many Assyrian soldiers did Jehovah’s angel kill in one night?", choiceA: "5,000", choiceB: "200", choiceC: "10,000", choiceD: "185,000", answer: 4))
        list.append(Question(questionText: "Who was Enoch’s father?", choiceA: "Cain", choiceB: "Adam", choiceC: "Job", choiceD: "None of the above", answer: 1))
        list.append(Question(questionText: "Which one of these match this Bible text? And this good news of the Kingdom will be preached in all the inhabited earth... ", choiceA: "Matthew 24:14", choiceB: "Exodus 39:2", choiceC: "1 Chronicles 8:10", choiceD: "Zechariah 8:2", answer: 1))
        list.append(Question(questionText: "What sea did the Isrealites cross when leaving Egypt?", choiceA: "Red Sea", choiceB: "Indian Sea", choiceC: "Dead Sea", choiceD: "Jordan River", answer: 1))
        list.append(Question(questionText: "Where was David born?", choiceA: "Bethlehem", choiceB: "Persia", choiceC: "Eygpt", choiceD: "Isreal", answer: 1))
        list.append(Question(questionText: "What did Peter do to Jesus?", choiceA: "He stood up for him", choiceB: "He washed his feet", choiceC: "He denied him three times", choiceD: "None of the above", answer: 3))
        list.append(Question(questionText: "What is the 8th commandment?", choiceA: "Remember the Sabbath day", choiceB: "You must not testify falsely", choiceC: "Remember the Passover", choiceD: "You must not steal", answer: 4))
        list.append(Question(questionText: "Why did Moses not enter the Promised Land?", choiceA: "He had died already", choiceB: "He sinned at Meribah", choiceC: "He was too old", choiceD: "He ran away", answer: 2))
        
        shuffled = list[randomPick: 10]
    }
}
    
    class MediumQuestionBank {
        var list = [Question]()
        var shuffled = [Question]()
        
        init() {
            list.append(Question(questionText: "Fill in the blank for one piece of the complete Suit of Armor.\n Stand firm, therefore, with the belt of _____. ", choiceA: "Truth", choiceB: "Righteousness", choiceC: "Salvation", choiceD: "Spirit", answer: 1))
            list.append(Question(questionText: "Fill in the blank of the missing Hebrew boys name.\n Hananiah, Azariah, and ______.", choiceA: "Mishael", choiceB: "Belteshaz'zar", choiceC: "Nebuchadnezzar", choiceD: "Sha'drach", answer: 1))
            list.append(Question(questionText: "How many stones did David have available to kill Goliath?", choiceA: "5", choiceB: "10", choiceC: "3", choiceD: "1", answer: 1))
            list.append(Question(questionText: "Which of the following was not one of the 10 Plagues?", choiceA: "Frogs out of the Nile River", choiceB: "Dust turned into gnats", choiceC: "Thunder and hail", choiceD: "Every second born son killed", answer: 4))
            list.append(Question(questionText: "Which one of the following are not one of God's fruitage of the Spirit?", choiceA: "Love", choiceB: "Patience", choiceC: "Meekness", choiceD: "Peace", answer: 3))
            list.append(Question(questionText: "Who was the King that wanted to build a tower so tall that it would reach into the heavens?", choiceA: "Hezekiah", choiceB: "Nim’rod", choiceC: "David", choiceD: "Pharoah", answer: 2))
            list.append(Question(questionText: "Where was Ra’hab living when she hid the two Israelite spies?", choiceA: "Isreal", choiceB: "Haran", choiceC: "Babylon", choiceD: "Jericho", answer: 4))
            list.append(Question(questionText: "Who was jealous of David and tried to kill him after he killed Goliath?", choiceA: "Saul", choiceB: "Abner", choiceC: "Jonathan", choiceD: "Solomon", answer: 1))
            list.append(Question(questionText: "How many sons did Jacob have?", choiceA: "2", choiceB: "6", choiceC: "12", choiceD: "10", answer: 3))
            list.append(Question(questionText: "What did Moses do to cause him to flee Egypt?", choiceA: "Kill an Egyptian", choiceB: "Not worship a false god", choiceC: "Steal money from the King", choiceD: "None of the above", answer: 1))
            list.append(Question(questionText: "The name of Jacob’s twin brother was?", choiceA: "E’sau", choiceB: "Benjamin", choiceC: "Issac", choiceD: "Joseph", answer: 1))
            list.append(Question(questionText: "Which one of these match this Bible text? May people know that you, whose name is Jehovah You alone are the Most High over all the earth...", choiceA: "Job 13:8", choiceB: "Psalm 83:18", choiceC: "Esther 2:6", choiceD: "1 Samuel 9:27", answer: 2))
            list.append(Question(questionText: "What Bible book comes after Acts?", choiceA: "John", choiceB: "Matthew", choiceC: "Luke", choiceD: "Romans", answer: 4))
            list.append(Question(questionText: "How many children did Job have?", choiceA: "7 sons, 3 daughters", choiceB: "7 Sons, 7 Daughters", choiceC: "2 sons, 4 daughters", choiceD: "12 sons, 4 daughters", answer: 1))
            list.append(Question(questionText: "Psalm 83:18 proves that?", choiceA: "Evolution is wrong", choiceB: "God's name is Jehovah", choiceC: "God Created everything", choiceD: "None of the above", answer: 2))
            list.append(Question(questionText: "Match the Bible verse. \n 'And let us consider one another to incite to love and fine works.'", choiceA: "Joel 2:1", choiceB: "Luke 3:20", choiceC: "Hebrews 10:24", choiceD: "Revelations 21:3,4", answer: 3))
            
            //TODO: Fact Check
            list.append(Question(questionText: "How many books of the Bible did Moses write?", choiceA: "10", choiceB: "15", choiceC: "2", choiceD: "5", answer: 4))
            
            shuffled = list[randomPick: 10]
        }
    }
    
    class HardQuestionBank {
        var list = [Question]()
        var shuffled = [Question]()
        
        init() {
            //TODO:In Progress
//            list.append(Question(questionText: "Which King succeeded Herod when Joseph and Mary returned from Egypt?", choiceA: "", choiceB: "Archelaus", choiceC: "", choiceD: "", answer: 2))
//            //TODO: Google hebrew names
//            list.append(Question(questionText: "What was the Hebrew names of Shadrach, Meshach and Abednego?", choiceA: "", choiceB: "", choiceC: "Hananiah, Mishael & Azariah", choiceD: "", answer: 3))
            
            list.append(Question(questionText: "How long did Enoch’s son Me·thuʹse·lah live?", choiceA: "969 years", choiceB: "805 years", choiceC: "450 years", choiceD: "1000 years", answer: 1))
            list.append(Question(questionText: "Which minerals could be found in the mountains of Palestine?", choiceA: "Gold", choiceB: "Steel", choiceC: "Aluminum", choiceD: "Iron and Copper", answer: 4))
            list.append(Question(questionText: "Which of these books is not part of the poetic books of the Bible?", choiceA: "Revelation", choiceB: "Psalms", choiceC: "Ecclesiastes", choiceD: "Job", answer: 1))
            list.append(Question(questionText: "Match the bible verse. \n I say to you: You are Peter, and on this rock I will build my congregation, and the gates of the Grave will not overpower it.", choiceA: "John 16:18", choiceB: "Matthew 16:18", choiceC: "Mark 2:1", choiceD: "Luke 1:1", answer: 2))
            list.append(Question(questionText: "How many days were the 12 spies in the land of Canaan?", choiceA: "30", choiceB: "15", choiceC: "5", choiceD: "40", answer: 4))
            list.append(Question(questionText: "What was special about Melchizedek?", choiceA: "He was a King and Priest at the same time", choiceB: "Was the oldest man to live", choiceC: "Was the richest King", choiceD: "Had 100 children", answer: 1))
            list.append(Question(questionText: "Who was the prophet that anointed the first King of Isreal?", choiceA: "Isaiah", choiceB: "Samuel", choiceC: "Elisha", choiceD: "Elijah", answer: 2))
            list.append(Question(questionText: "How much did Goliah's Coat of Mail weigh?", choiceA: "About 4.5kg (10 lbs)", choiceB: "About 9kg (20 lbs)", choiceC: "About 15kg (33 lbs)", choiceD: "About 57kg (125 lbs)", answer: 4))
            list.append(Question(questionText: "Which one of the following disciples was a tax collector?", choiceA: "Matthew", choiceB: "Andrew", choiceC: "Peter", choiceD: "None of the above", answer: 1))
            list.append(Question(questionText: "What Bible book goes after Job?", choiceA: "Proverbs", choiceB: "Numbers", choiceC: "Psalm", choiceD: "Lamentations", answer: 3))
            list.append(Question(questionText: "At what age was Jesus baptized?", choiceA: "24", choiceB: "12", choiceC: "30", choiceD: "19", answer: 3))
            list.append(Question(questionText: "How many people did Jesus feed with 7 loaves of bread and a few small fish?", choiceA: "1000", choiceB: "200", choiceC: "4000", choiceD: "5000", answer: 3))
            list.append(Question(questionText: "Joseph was thrown into prison because of whose wife?", choiceA: "Pharaoh's", choiceB: "Potiphar’s", choiceC: "Nim'rod's", choiceD: "None of the above", answer: 2))
            list.append(Question(questionText: "How old was Noah when the Deluge occurred?", choiceA: "250 years old", choiceB: "600 years old", choiceC: "500 years old", choiceD: "80 years old", answer: 2))
            list.append(Question(questionText: "How many books are in the Hebrew Scriptures?", choiceA: "5", choiceB: "17", choiceC: "39", choiceD: "20", answer: 3))
            list.append(Question(questionText: "How many books are in the Greek scriptures?", choiceA: "27", choiceB: "40", choiceC: "15", choiceD: "5", answer: 1))
            list.append(Question(questionText: "How many books of the Hebrew scriptures did Moses write?", choiceA: "2", choiceB: "6", choiceC: "1", choiceD: "9", answer: 2))
            list.append(Question(questionText: "How long were Joseph's family dwelling in Eygpt?", choiceA: "50 years", choiceB: "20 years", choiceC: "320 years", choiceD: "215 years", answer: 4))
            list.append(Question(questionText: "Who is Joseph's great grandfather?", choiceA: "Abraham", choiceB: "Adam", choiceC: "Daniel", choiceD: "Job", answer: 1))
            
            shuffled = list[randomPick: 10]
        }
        
    }

class ServiceTrivia {
    var list = [Question]()
    var shuffled = [Question]()
    
    init() {
        list.append(Question(questionText: "What happens to the dead?", choiceA: "5", choiceB: "10", choiceC: "3", choiceD: "1", answer: 1))
        list.append(Question(questionText: "Service question 2?", choiceA: "Frogs out of the Nile River", choiceB: "Dust turned into gnats", choiceC: "Thunder and hail", choiceD: "Every second born son killed", answer: 4))
        list.append(Question(questionText: "Service question 3?", choiceA: "Love", choiceB: "Patience", choiceC: "Meekness", choiceD: "Peace", answer: 3))
        list.append(Question(questionText: "Service question 4?", choiceA: "Hezekiah", choiceB: "Nim’rod", choiceC: "David", choiceD: "Pharoah", answer: 2))
        list.append(Question(questionText: "Service question 5?", choiceA: "Isreal", choiceB: "Haran", choiceC: "Babylon", choiceD: "Jericho", answer: 4))
        list.append(Question(questionText: "Service question 6?", choiceA: "Saul", choiceB: "Abner", choiceC: "Jonathan", choiceD: "Solomon", answer: 1))
        list.append(Question(questionText: "Service question 7?", choiceA: "2", choiceB: "6", choiceC: "12", choiceD: "10", answer: 3))
        list.append(Question(questionText: "Service question 8?", choiceA: "Kill an Egyptian", choiceB: "Not worship a false god", choiceC: "Steal money from the King", choiceD: "None of the above", answer: 1))
        list.append(Question(questionText: "Service question 9?", choiceA: "E’sau", choiceB: "Benjamin", choiceC: "Issac", choiceD: "Joseph", answer: 1))
        list.append(Question(questionText: "Service question 10", choiceA: "Job 13:8", choiceB: "Psalm 83:18", choiceC: "Esther 2:6", choiceD: "1 Samuel 9:27", answer: 2))
        list.append(Question(questionText: "Service question 11?", choiceA: "John", choiceB: "Matthew", choiceC: "Luke", choiceD: "Romans", answer: 4))
        list.append(Question(questionText: "Service question 12?", choiceA: "7 sons, 3 daughters", choiceB: "7 Sons, 7 Daughters", choiceC: "2 sons, 4 daughters", choiceD: "12 sons, 4 daughters", answer: 1))
        
        shuffled = list[randomPick: 10]
    }
}

