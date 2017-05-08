//
//  MainWindow.m
//  CQforMac
//
//  Created by Jigar Zalavadiya on 03/02/12.
//  Copyright (c) 2012 SPEC. All rights reserved.
//

#import "MainWindow.h"
#import "FirstWindowCOntroller.h"
#import "ReviewQuestionWindow.h"
#import "AppDelegate.h"
#import "RSVerticallyCenteredTextFieldCell.h"
#include <stdlib.h>

@implementation MainWindow
@synthesize theQuiz, play, welcomeText, welcome, Fvc, nextBtn;
@synthesize filename, scoreTotal, catName, reviewController;
@synthesize numbers;


- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
    
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    [happy setHidden:YES];
    [sad setHidden:YES];
    
    
}
-(void)addQuiz{
    
    [self.window setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"Intro_back.jpg"]]];
    
    [btn1 setHidden:YES];
    [btn2 setHidden:YES];
    [btn3 setHidden:YES];
    [btn4 setHidden:YES];
    
    
    [play setHidden:NO];
    [nextBtn setHidden:YES];
    [imageview setHidden:YES];
    [happy setHidden:YES];
    [sad setHidden:YES];
    [reviewQue setHidden:YES];
    [scoreText removeFromSuperview];
    
    AppDelegate *appDelegate = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    if (appDelegate.soundIndicator == 0) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"m4a"];
        backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
        backgroundMusic.numberOfLoops = -1;
        [backgroundMusic play];
    }
    else{
        
        [backgroundMusic stop];
    }
    
    NSUserDefaults *soundvalue = [NSUserDefaults standardUserDefaults];
    [soundvalue setInteger:appDelegate.soundIndicator forKey:@"soundkey"];
    
    
    NSView *catTextView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1500, 1500)];
    catText = [[NSTextField alloc] initWithFrame:NSMakeRect(450, 800, 1000, 300)];
    [catText setStringValue:catName];
    [catText setAlignment:NSCenterTextAlignment];
    [catText setEditable:NO];
    [catText setBezeled:NO];
    [catText setDrawsBackground:NO];
    [catText setSelectable:NO];
    [catText setBordered:NO];
    [catText setBackgroundColor:[NSColor clearColor]];
    [catText setFont:[NSFont fontWithName:@"Futura" size:22]];
    [catText setTextColor:[NSColor blueColor]];
    [catText sizeToFit];
    [catTextView addSubview:catText];
    [catTextView setAutoresizesSubviews:YES];
    [catText setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:catTextView];
    
    
    
    NSView* superView1 = [[NSView alloc] initWithFrame:NSMakeRect(0, 300, 1400, 500)];
    myTextField1 = [[NSTextField alloc] initWithFrame:NSMakeRect(180, 100, 1000, 300)];
    [myTextField1 setStringValue:welcome];
    [myTextField1 setAlignment:NSCenterTextAlignment];
    [myTextField1 setEditable:NO];
    [myTextField1 setBezeled:NO];
    [myTextField1 setDrawsBackground:NO];
    [myTextField1 setSelectable:NO];
    [myTextField1 setBordered:NO];
    [myTextField1 setBackgroundColor:[NSColor clearColor]];
    [myTextField1 setFont:[NSFont fontWithName:@"Futura" size:22]];
    [myTextField1 setTextColor:[NSColor purpleColor]];
    [superView1 addSubview:myTextField1];
    [superView1 setAutoresizesSubviews:YES];
    [myTextField1 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:superView1];
    
    questionnumber = 0;
    myScore = 0;
    
    [self loadQuiz];

}
-(void)loadQuiz
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *textFilePath = [bundle pathForResource:filename ofType:@"txt"];
    NSString *fileContents = [NSString stringWithContentsOfFile:textFilePath encoding:NSUTF8StringEncoding error:nil];
    [NSString stringWithContentsOfFile:textFilePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *quizArray = [[NSArray alloc] initWithArray:[fileContents componentsSeparatedByString:@"\n"]];
    self.theQuiz = quizArray;
    
    NSUserDefaults *filepref = [NSUserDefaults standardUserDefaults];
    [filepref setObject:filename forKey:@"KeyForFilename"];
    
}
- (IBAction)Play:(id)sender{
    [catText removeFromSuperview];
    [nextBtn setHidden:YES];
    [myTextField1 removeFromSuperview];
    [play setHidden:YES];
    [self askQuestion];
}

-(void)askQuestion{
    
    [self.window setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"quiz_main-2.jpg"]]];
    
    AppDelegate *appDelegate = (AppDelegate *) [[NSApplication sharedApplication] delegate];
    
    if (appDelegate.soundIndicator == 0) {
        [backgroundMusic stop];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"quizsound" ofType:@"m4a"];
        backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
        backgroundMusic.numberOfLoops = -1;
        [backgroundMusic play];
    }
    else{
        
        [backgroundMusic stop];
    }
    [btn1 setHidden:NO];
    [btn2 setHidden:NO];
    [btn3 setHidden:NO];
    [btn4 setHidden:NO];
    
    [nextBtn setHidden:YES];
    [reviewQue setHidden:YES];
    
   // questionnumber = questionnumber + 1;
    
    static int oldNumber;
    int r;
    do{
        r = arc4random()%11 + 1;
    } while(r == oldNumber);
        
    oldNumber = r;
    
    questionnumber = r;
    
    
    NSInteger row = 0;
    if(questionnumber == 1)
	{
        row = questionnumber - 1;
	}
	else
	{
        row = ((questionnumber - 1) * 11);
	}
    
    
    
    QueText = [theQuiz objectAtIndex:row];
    
    NSView* challengeView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1500)];
    challengeText = [[NSTextField alloc] initWithFrame:NSMakeRect(20, 890, 1330, 30)];
    [challengeText setStringValue:[theQuiz objectAtIndex:row + 8]];
    [challengeText setEditable:NO];
    [challengeText setBezeled:NO];
    [challengeText setAlignment:NSCenterTextAlignment];
    [challengeText setDrawsBackground:NO];
    [challengeText setSelectable:NO];
    [challengeText setBordered:NO];
    [challengeText setBackgroundColor:[NSColor clearColor]];
    [challengeText setFont:[NSFont fontWithName:@"Futura" size:22]]; 
    [challengeView addSubview:challengeText];
    [challengeView setAutoresizesSubviews:YES];
    [challengeText setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:challengeView];

    
    NSView* myImageView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1383, 928)];
    NSRect rect = NSMakeRect(23, 685, 165, 185);
    imageview = [[NSImageView alloc] initWithFrame:rect];
    [imageview setImageScaling:NSScaleToFit];
    [imageview setImage:[NSImage imageNamed:[theQuiz objectAtIndex: row + 9]]];
    [myImageView addSubview:imageview];
    [self.window.contentView addSubview:myImageView];
    [imageview setHidden:NO];
    
    RSVerticallyCenteredTextFieldCell *cell = [[RSVerticallyCenteredTextFieldCell alloc] initTextCell:[theQuiz objectAtIndex:row]];
    
    NSView* superView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1500)];
    myTextField = [[NSTextField alloc] initWithFrame:NSMakeRect(210, 680, 1150, 190)];
    [myTextField setStringValue:[theQuiz objectAtIndex:row]];
    [myTextField setCell:cell];
    [myTextField setEditable:NO];
    [myTextField setBezeled:NO];
    [myTextField setDrawsBackground:NO];
    [myTextField setSelectable:NO];
    [myTextField setBordered:NO];
    [myTextField setBackgroundColor:[NSColor clearColor]];
    [myTextField setFont:[NSFont fontWithName:@"Lucida Grande Bold" size:22]];
    
    [superView addSubview:myTextField];
    [superView setAutoresizesSubviews:YES];
    [myTextField setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:superView];
    
    
    RSVerticallyCenteredTextFieldCell *cell1 = [[RSVerticallyCenteredTextFieldCell alloc] initTextCell:[theQuiz objectAtIndex:row + 1]];
    
    //Option One
    NSView* option1View = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1500)];
    option1 = [[NSTextField alloc] initWithFrame:NSMakeRect(165, 480, 1190, 140)];
    [option1 setStringValue:[theQuiz objectAtIndex:row + 1]];
    [option1 setCell:cell1];
    [option1 setEditable:NO];
    [option1 setBezeled:NO];
    [option1 setDrawsBackground:NO];
    [option1 setSelectable:NO];
    [option1 setBordered:NO];
    [option1 setBackgroundColor:[NSColor clearColor]];
    [option1 setFont:[NSFont fontWithName:@"Futura" size:20]];
    [option1View addSubview:option1];
    [option1View setAutoresizesSubviews:YES];
    [option1 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:option1View];
    
    
    RSVerticallyCenteredTextFieldCell *cell2 = [[RSVerticallyCenteredTextFieldCell alloc] initTextCell:[theQuiz objectAtIndex:row + 2]];
    //Option Two
    NSView* option2View = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1500)];
    option2 = [[NSTextField alloc] initWithFrame:NSMakeRect(165, 330  , 1190, 140)];
    [option2 setStringValue:[theQuiz objectAtIndex:row+2]];
    [option2 setCell:cell2];
    
    [option2 setEditable:NO];
    [option2 setBezeled:NO];
    [option2 setDrawsBackground:NO];
    [option2 setSelectable:NO];
    [option2 setBordered:NO];
    [option2 setBackgroundColor:[NSColor clearColor]];
    [option2 setFont:[NSFont fontWithName:@"Futura" size:20]]; 
    [option2View addSubview:option2];
    [option2View setAutoresizesSubviews:YES];
    [option2 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:option2View];

    
    RSVerticallyCenteredTextFieldCell *cell3 = [[RSVerticallyCenteredTextFieldCell alloc] initTextCell:[theQuiz objectAtIndex:row + 3]];
    //Option Three
    NSView *option3View = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1500)];
    option3 = [[NSTextField alloc] initWithFrame:NSMakeRect(165, 180 , 1190, 140)];
    [option3 setStringValue:[theQuiz objectAtIndex:row+3]];
    [option3 setCell:cell3];
    [option3 setEditable:NO];
    [option3 setBezeled:NO];
    [option3 setDrawsBackground:NO];
    [option3 setSelectable:NO];
    [option3 setBordered:NO];
    [option3 setBackgroundColor:[NSColor clearColor]];
    [option3 setFont:[NSFont fontWithName:@"Futura" size:20]];
    [option3View addSubview:option3];
    [option3View setAutoresizesSubviews:YES];
    [option3 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:option3View];
    
    
    RSVerticallyCenteredTextFieldCell *cell4 = [[RSVerticallyCenteredTextFieldCell alloc] initTextCell:[theQuiz objectAtIndex:row + 4]];
    //Option Four
    NSView *option4View = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
    option4 = [[NSTextField alloc] initWithFrame:NSMakeRect(165, 25 , 1190, 140)];
    [option4 setStringValue:[theQuiz objectAtIndex:row+4]];
    [option4 setCell:cell4];
    [option4 setEditable:NO];
    [option4 setBezeled:NO];
    [option4 setDrawsBackground:NO];
    [option4 setSelectable:NO];
    [option4 setBordered:NO];
    [option4 setBackgroundColor:[NSColor clearColor]];
    [option4 setFont:[NSFont fontWithName:@"Futura" size:20]];
    [option4View addSubview:option4];
    [option4View setAutoresizesSubviews:YES];
    [option4 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:option4View];
    

    rightAnswer = [[theQuiz objectAtIndex:row+5] intValue];
    
    NSString *right = [theQuiz objectAtIndex:row+7];
    NSString *rytopt = [theQuiz objectAtIndex:row+10];
    
    NSView *correctTextView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
    correctText = [[NSTextField alloc] initWithFrame:NSMakeRect(150, 300 , 1100, 250)];
    [correctText setStringValue:[NSString stringWithFormat:@"\nCorrect Answer is : %@\n\n%@\n\n" ,rytopt, right]];
    [correctText setEditable:NO];
    [correctText setBezeled:NO];
    [correctText setDrawsBackground:NO];
    [correctText setSelectable:NO];
    [correctText setBordered:NO];
    [correctText setBackgroundColor:[NSColor clearColor]];
    [correctText setFont:[NSFont fontWithName:@"Futura" size:20]];
    [correctTextView addSubview:correctText];
    [correctTextView setAutoresizesSubviews:YES];
    [correctText setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:correctTextView];
    [correctText setHidden:YES];
    
    
    NSString *des = [theQuiz objectAtIndex:row+6];
    
    NSView *explanationView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
    explanation = [[NSTextField alloc] initWithFrame:NSMakeRect(150, 20 , 1100, 300)];
    [explanation setStringValue:[NSString stringWithFormat:@"\nExplanation :\n%@\n\n" , des]];
    [explanation setEditable:NO];
    [explanation setBezeled:NO];
    [explanation setDrawsBackground:NO];
    [explanation setSelectable:NO];
    [explanation setBordered:NO];
    [explanation setBackgroundColor:[NSColor clearColor]];
    [explanation setFont:[NSFont fontWithName:@"Futura" size:20]];
    [explanationView addSubview:explanation];
    [explanationView setAutoresizesSubviews:YES];
    [explanation setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:explanationView];
    [explanation setHidden:YES];
    
}

-(IBAction)ReviewQuestion:(id)sender{
    
    
    if (!reviewController) {
        reviewController = [[ReviewQuestionWindow alloc] initWithWindowNibName:@"ReviewQuestionWindow"];
           
        
    }
    reviewController.QuestionText = QueText;
    [reviewController showWindow:self];
    [reviewController AddQue];

}

-(void)checkAnswer:(int)theAnswerValue{
    
    [self.window setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"score back.jpg"]]];
    
    
    [nextBtn setHidden:NO];
    [reviewQue setHidden:NO];
    [imageview removeFromSuperview];
    [btn1 setHidden:YES];
    [btn2 setHidden:YES];
    [btn3 setHidden:YES];
    [btn4 setHidden:YES];
    [challengeText removeFromSuperview];
    [option1 removeFromSuperview];
    [option2 removeFromSuperview];
    [option3 removeFromSuperview];
    [option4 removeFromSuperview];
    [myTextField removeFromSuperview];
    [explanation setHidden:NO];
    [correctText setHidden:NO];
    
    AppDelegate *appDelegate = (AppDelegate *) [[NSApplication sharedApplication] delegate];
    if (rightAnswer == theAnswerValue) {
        
        if (appDelegate.soundIndicator == 0) {
            [backgroundMusic stop];
            NSString *path = [[NSBundle mainBundle] pathForResource:@"Winner" ofType:@"m4a"];
            backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
            [backgroundMusic play];
        }
        else{
            [backgroundMusic stop];
        }
        
        NSView *correctView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
        correct = [[NSTextField alloc] initWithFrame:NSMakeRect(550, 800, 1100, 100)];
        [correct setStringValue:@"Correct Answer!!"];
        [correct setTextColor:[NSColor purpleColor]];
        [correct setEditable:NO];
        [correct setBezeled:NO];
        [correct setDrawsBackground:NO];
        [correct setSelectable:NO];
        [correct setBordered:NO];
        [correct setBackgroundColor:[NSColor clearColor]];
        [correct setFont:[NSFont fontWithName:@"Futura" size:38]];
        [correctView addSubview:correct];
        [correctView setAutoresizesSubviews:YES];
        [correct setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [self.window.contentView addSubview:correctView];
        
        [happy setHidden:NO];
        [sad setHidden:YES];
        
        myScore = myScore +10;
        NSInteger cal = (myScore * 100)/scoreTotal;
        
        NSUserDefaults *finals = [NSUserDefaults standardUserDefaults];
        [finals setInteger:cal forKey:@"keyForScore"];
        
    }
    else{
        
        if (appDelegate.soundIndicator == 0) {
            [backgroundMusic stop];
            NSString *path = [[NSBundle mainBundle] pathForResource:@"incorrect2" ofType:@"m4a"];
            backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
            [backgroundMusic play];
            
        }
        else{
            [backgroundMusic stop];
        }
        
        NSView *correctView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
        correct = [[NSTextField alloc] initWithFrame:NSMakeRect(550, 800, 1100, 100)];
        [correct setStringValue:@"Incorrect Answer!!"];
        [correct setTextColor:[NSColor redColor]];
        [correct setEditable:NO];
        [correct setBezeled:NO];
        [correct setDrawsBackground:NO];
        [correct setSelectable:NO];
        [correct setBordered:NO];
        [correct setBackgroundColor:[NSColor clearColor]];
        [correct setFont:[NSFont fontWithName:@"Futura" size:38]];
        [correctView addSubview:correct];
        [correctView setAutoresizesSubviews:YES];
        [correct setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [self.window.contentView addSubview:correctView];
        
        [happy setHidden:YES];
        [sad setHidden:NO];
        
    }
    
    NSString *scoreUpdate = [[NSString alloc] initWithFormat:@"Score: %d", myScore];
    
    NSView *scoreView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
    scoreText = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 700, 1100, 100)];
    [scoreText setStringValue:scoreUpdate];
    [scoreText setTextColor:[NSColor blackColor]];
    [scoreText setEditable:NO];
    [scoreText setBezeled:NO];
    [scoreText setDrawsBackground:NO];
    [scoreText setSelectable:NO];
    [scoreText setBordered:NO];
    [scoreText setBackgroundColor:[NSColor clearColor]];
    [scoreText setFont:[NSFont fontWithName:@"Futura" size:30]];
    [scoreView addSubview:scoreText];
    [scoreView setAutoresizesSubviews:YES];
    [scoreText setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:scoreView];
    
}

-(IBAction)buttonOne:(id)sender{
    
    NSInteger theAnswerValue = 1;
    [self checkAnswer:(int)theAnswerValue];
}
-(IBAction)buttonTwo:(id)sender{
    NSInteger theAnswerValue = 2;
	[self checkAnswer:(int)theAnswerValue];
}
-(IBAction)buttonThree:(id)sender{
    NSInteger theAnswerValue = 3;
	[self checkAnswer:(int)theAnswerValue];
}
-(IBAction)buttonFour:(id)sender{
    NSInteger theAnswerValue = 4;
	[self checkAnswer:(int)theAnswerValue];
}
- (void)generateNumber{
    
    BOOL exists = NO;
	newNumber = [[NSNumber alloc] initWithInt:arc4random() % 5 + 1];
	
	for (int i=0; i<[[self numbers] count]; i++) {
		if ([[self numbers] objectAtIndex:i] == newNumber) {
			exists = YES;
		}
	}
	
	if (exists == NO) {
		[[self numbers] addObject:newNumber];
		NSLog(@"Added new number: %@", newNumber);
	} else {
		NSLog(@"Skipped number: %@", newNumber);
	}
	//[newNumber release];
    
}
-(IBAction)Next:(id)sender{
        
    
    [happy setHidden:YES];
    [sad setHidden:YES];
    [correct removeFromSuperview];
    [explanation removeFromSuperview];
    [correctText removeFromSuperview];
    [scoreText removeFromSuperview];
    NSInteger endOfQuiz = [theQuiz count];
    if((((questionnumber - 1) * 11) + 11) == endOfQuiz)
    {        
        [nextBtn setHidden:YES];
        [reviewQue setHidden:YES];
        
        AppDelegate *appDelegate = (AppDelegate *) [[NSApplication sharedApplication] delegate];
        if (appDelegate.soundIndicator == 0) {
            
            [backgroundMusic stop];
            NSString *path = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"m4a"];
            backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
            backgroundMusic.numberOfLoops = -1;
            [backgroundMusic play];
        }
        else{
            
            [backgroundMusic stop];
        }
        [self.window setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"final_screen.jpg"]]];
        
        NSString *finishingStatement = [[NSString alloc] initWithFormat:@"\nNice going\nYou scored %i !", myScore];
        
        NSView *scoreView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
        scoreText = [[NSTextField alloc] initWithFrame:NSMakeRect(550, 400, 1100, 400)];
        [scoreText setStringValue:finishingStatement];
        [scoreText setTextColor:[NSColor whiteColor]];
        [scoreText setEditable:NO];
        [scoreText setBezeled:NO];
        [scoreText setDrawsBackground:NO];
        [scoreText setSelectable:NO];
        [scoreText setBordered:NO];
        [scoreText setBackgroundColor:[NSColor clearColor]];
        [scoreText setFont:[NSFont fontWithName:@"Futura" size:30]];
        [scoreView addSubview:scoreText];
        [scoreView setAutoresizesSubviews:YES];
        [scoreText setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [self.window.contentView addSubview:scoreView];
        
        NSView* finish = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
        my4 = [[NSButton alloc] initWithFrame:NSMakeRect(590,200,219,214)];
        [my4 setTitle: @""];
        [my4 setTarget:self];
        [my4 setImage:[NSImage imageNamed:@"home.png"]];
        [my4 setAction:@selector(endQuiz)];
        [my4 setButtonType:NSMomentaryChangeButton];
        [my4 setBezelStyle:NSShadowlessSquareBezelStyle];
        [my4 setBordered:NO];
        [my4 sizeToFit];
        [finish addSubview:my4];
        [finish setAutoresizesSubviews:YES];
        [my4 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [self.window.contentView addSubview:finish];
        
        
    }else
    {
        [self askQuestion];
    }
    
}
-(void)endQuiz{
    
    [my4 removeFromSuperview];
    AppDelegate *appDelegate = (AppDelegate *) [[NSApplication sharedApplication] delegate];
    
    if (appDelegate.soundIndicator == 0) {
        [backgroundMusic stop];
    }
    
    [self.window close];
    [Fvc showWindow:self];
    [Fvc ScoreUpdate];
}

@end
