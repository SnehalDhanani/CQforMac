//
//  MainWindow.h
//  CQforMac
//
//  Created by Jigar Zalavadiya on 03/02/12.
//  Copyright (c) 2012 SPEC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>


@class FirstWindowCOntroller;
@class ReviewQuestionWindow;

@interface MainWindow : NSWindowController{
    
    IBOutlet FirstWindowCOntroller *Fvc;
    IBOutlet ReviewQuestionWindow *reviewController;
    AVAudioPlayer *backgroundMusic;
    
    IBOutlet NSTextField *catText;
    IBOutlet NSTextField *welcomeText;
    IBOutlet NSTextField *myTextField1;
    IBOutlet NSTextField *option1;
    IBOutlet NSTextField *option2;
    IBOutlet NSTextField *option3;
    IBOutlet NSTextField *option4;
    IBOutlet NSTextField *correct;
    IBOutlet NSTextField *explanation;
    IBOutlet NSTextField *correctText;
    IBOutlet NSTextField *scoreText;
    IBOutlet NSTextField *myTextField;
    IBOutlet NSTextField *challengeText;
    
    
    IBOutlet NSImageView *imageview;
    IBOutlet NSImageView *happy;
    IBOutlet NSImageView *sad;
    
    IBOutlet NSButton *play;
    IBOutlet NSButton *nextBtn;
    IBOutlet NSButton *btn1;
    IBOutlet NSButton *btn2;
    IBOutlet NSButton *btn3;
    IBOutlet NSButton *btn4;
    
 //   IBOutlet NSButton *my;
 //   IBOutlet NSButton *my2;
 //   IBOutlet NSButton *my3;
    IBOutlet NSButton *my4;
    IBOutlet NSButton *reviewQue;
    
    NSInteger questionnumber;
    NSInteger rightAnswer;
    NSInteger myScore;
    NSString *welcome;
    NSString *QueText;
    
    NSArray *theQuiz;
    
    
    NSMutableArray *numbers;
    NSNumber *newNumber;
    NSInteger Nom;
    
    
    id filename;
    int scoreTotal;
    id catName;
    
    
}
@property(nonatomic, retain) NSMutableArray *numbers;
@property(nonatomic, retain) NSArray *theQuiz;
@property(nonatomic, retain) IBOutlet NSButton *play;
@property(nonatomic, retain) IBOutlet NSTextField *welcomeText;
@property(nonatomic, retain) NSString *welcome;
@property(nonatomic, retain) IBOutlet FirstWindowCOntroller *Fvc;
@property(nonatomic, retain) IBOutlet ReviewQuestionWindow *reviewController;
@property(nonatomic, retain) IBOutlet NSButton *nextBtn;
@property (retain , nonatomic ) id filename;
@property (nonatomic) int scoreTotal;
@property (nonatomic,retain)id catName;


- (void)generateNumber;
- (void)addQuiz;
- (void)askQuestion;
- (void)loadQuiz;
- (IBAction)Play:(id)sender;
- (IBAction)Next:(id)sender;
- (IBAction)buttonOne:(id)sender;
- (IBAction)buttonTwo:(id)sender;
- (IBAction)buttonThree:(id)sender;
- (IBAction)buttonFour:(id)sender;
- (void)checkAnswer:(int)theAnswerValue;
- (void)endQuiz;
- (IBAction)ReviewQuestion:(id)sender;

@end
