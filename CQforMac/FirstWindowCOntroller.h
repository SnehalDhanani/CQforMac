//
//  FirstWindowCOntroller.h
//  CQforMac
//
//  Created by Jigar Zalavadiya on 28/02/12.
//  Copyright (c) 2012 SPEC. All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>


@class MainWindow;
@class ReviewController;


@interface FirstWindowCOntroller : NSWindowController{
    
    IBOutlet NSButton *fisrtCat;
    IBOutlet NSButton *secondCat;
    IBOutlet NSButton *thirdCat;
    IBOutlet NSButton *fourCat;
    IBOutlet NSButton *reviewBtn;
    
    
    IBOutlet NSTextField *score;
    IBOutlet NSTextField *score1;
    IBOutlet NSTextField *score2;
    IBOutlet NSTextField *score3;
    
    IBOutlet MainWindow *mainWindow;
    IBOutlet ReviewController *reviewController;
    
    IBOutlet NSButton *soundBtn;
    NSString *buttontTitle;
    NSUInteger hintCount;
    
    AVAudioPlayer *backgroundSound;
    
}
@property(nonatomic, retain) IBOutlet NSButton *fisrtCat;
@property(nonatomic, retain) IBOutlet NSButton *secondCat;
@property(nonatomic, retain) IBOutlet NSButton *thirdCat;
@property(nonatomic, retain) IBOutlet NSButton *fourCat;
@property(nonatomic, retain) IBOutlet NSButton *reviewBtn;
@property(nonatomic, retain) IBOutlet MainWindow *mainWindow;
@property(nonatomic, retain) IBOutlet ReviewController *reviewController;
@property(nonatomic, retain) IBOutlet NSButton *soundBtn;
@property(nonatomic, retain) NSString *buttontTitle;


-(IBAction)Cat1:(id)sender;
-(IBAction)Cat2:(id)sender;
-(IBAction)Cat3:(id)sender;
-(IBAction)Cat4:(id)sender;
-(IBAction)ReviewEvent:(id)sender;
-(void)ScoreUpdate;

-(IBAction)SoundOnOff:(id)sender;
-(void)updateButtonTitle;



@end
