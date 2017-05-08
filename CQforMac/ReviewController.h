//
//  ReviewController.h
//  CQforMac
//
//  Created by Jigar Zalavadiya on 31/03/12.
//  Copyright (c) 2012 SPEC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>

@class FirstWindowCOntroller;


@interface ReviewController : NSWindowController{
    
    IBOutlet FirstWindowCOntroller *FVC;
    
    IBOutlet NSTextField *category;
    IBOutlet NSTextField *welcmText;
    IBOutlet NSButton *reviewBtn;
    NSArray *review;
    NSInteger questionNumber;
    
    IBOutlet NSButton *nextBtn;
    IBOutlet NSButton *prevBtn;
    IBOutlet NSButton *my4;
    
    IBOutlet NSImageView *imageview;
    IBOutlet NSTextField *challenge;
    IBOutlet NSTextField *question;
    IBOutlet NSTextField *answer;
    IBOutlet NSTextField *explanation;
    
    
    AVAudioPlayer *backgroundmusic;
    
    
}
@property (nonatomic, retain) IBOutlet NSButton *reviewBtn;
@property (nonatomic, retain) NSArray *review;
@property (nonatomic, retain) IBOutlet FirstWindowCOntroller *FVC;

-(IBAction)StartReview :(id)sender;
-(void)LoadQuiz;
-(void)reviewQuestion;
-(IBAction)next:(id)sender;
-(IBAction)prev:(id)sender;
-(void)previousQuestion;
-(void)endQuiz;
-(void)Review;

@end
