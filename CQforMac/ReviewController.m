//
//  ReviewController.m
//  CQforMac
//
//  Created by Jigar Zalavadiya on 31/03/12.
//  Copyright (c) 2012 SPEC. All rights reserved.
//

#import "ReviewController.h"
#import "FirstWindowCOntroller.h"
#import "AppDelegate.h"
#import "RSVerticallyCenteredTextFieldCell.h"

@implementation ReviewController
@synthesize reviewBtn, review;
@synthesize FVC;


- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        NSNotificationCenter  *nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(windowWillClose:)
                   name:NSWindowWillCloseNotification
                 object:nil];  
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}
-(void)Review{
    
    [nextBtn setHidden:YES];
    [prevBtn setHidden:YES];
    [reviewBtn setHidden:NO];
    
    [self.window setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"plain_back"]]];
    
    AppDelegate *appDelegate = (AppDelegate *) [[NSApplication sharedApplication ] delegate];
    if(appDelegate.soundIndicator == 0) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"m4a"];
        backgroundmusic = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
        backgroundmusic.numberOfLoops = -1;
        [backgroundmusic play];
    }
    else{
        
        [backgroundmusic stop];
    }

    NSUserDefaults *soundvalue = [NSUserDefaults standardUserDefaults];
    [soundvalue setInteger:appDelegate.soundIndicator forKey:@"soundkey"];
    
    NSView* welcmView = [[NSView alloc] initWithFrame:NSMakeRect(0, 400, 1400, 500)];
    welcmText = [[NSTextField alloc] initWithFrame:NSMakeRect(180, 100, 1000, 200)];
    [welcmText setStringValue:@"Lets discuss all challenging situations toghether. Here you will review challenging questions, answer and its exlapnation for 101 questions."];
    [welcmText setAlignment:NSCenterTextAlignment];
    [welcmText setEditable:NO];
    [welcmText setBezeled:NO];
    [welcmText setDrawsBackground:NO];
    [welcmText setSelectable:NO];
    [welcmText setBordered:NO];
    [welcmText setBackgroundColor:[NSColor clearColor]];
    [welcmText setFont:[NSFont fontWithName:@"Futura" size:22]];
    [welcmText setTextColor:[NSColor purpleColor]];
    // [welcmText sizeToFit];
    [welcmView addSubview:welcmText];
    [welcmView setAutoresizesSubviews:YES];
    [welcmText setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:welcmView]; 
    
    questionNumber = 0;
    
}
-(IBAction)StartReview :(id)sender{
    
    [welcmText removeFromSuperview];
    [reviewBtn setHidden:YES];
    [nextBtn setHidden:NO];
    [self LoadQuiz];
}
-(void)LoadQuiz{
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *textFilePath = [bundle pathForResource:@"file5" ofType:@"txt"];
    NSString *fileContents = [NSString stringWithContentsOfFile:textFilePath encoding:NSUTF8StringEncoding error:nil];
    [NSString stringWithContentsOfFile:textFilePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *quizArray = [[NSArray alloc] initWithArray:[fileContents componentsSeparatedByString:@"\n"]];
    self.review = quizArray;
    [self reviewQuestion];
    
}
-(void)reviewQuestion{
    
    [self.window setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"review-1.jpg"]]];
    
    [nextBtn setHidden:NO];
    [category setHidden:NO];
    
    questionNumber = questionNumber + 1;
    NSInteger row = 0;
	if(questionNumber == 1)
	{
        row = questionNumber - 1;
	}
	else
	{
        row = ((questionNumber - 1) * 6);
	}
    
    [category setStringValue:[review objectAtIndex:row +4]];
    
    NSView* myImageView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1000, 1000)];
    NSRect rect = NSMakeRect(595,660, 165, 180);
    imageview = [[NSImageView alloc] initWithFrame:rect];
    [imageview setImageScaling:NSScaleToFit];
    [imageview setImage:[NSImage imageNamed:[review objectAtIndex: row + 5]]];
    [myImageView addSubview:imageview];
    [self.window.contentView addSubview:myImageView];
    [imageview setHidden:NO];
    
    NSView* superView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1000)];
    challenge = [[NSTextField alloc] initWithFrame:NSMakeRect(30, 600, 1300, 30)];
    [challenge setStringValue:[review objectAtIndex:row+3]];
    [challenge setEditable:NO];
    [challenge setBezeled:NO];
    [challenge setDrawsBackground:NO];
    [challenge setSelectable:NO];
    [challenge setBordered:NO];
    [challenge setBackgroundColor:[NSColor clearColor]];
    [challenge setFont:[NSFont fontWithName:@"Futura" size:21]]; 
    [superView addSubview:challenge];
    [challenge sizeToFit];
    [superView setAutoresizesSubviews:YES];
    [challenge setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:superView];
    
    RSVerticallyCenteredTextFieldCell *cell = [[RSVerticallyCenteredTextFieldCell alloc] initTextCell:[review objectAtIndex:row]];
    
    NSView* superView1 = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1000)];
    question = [[NSTextField alloc] initWithFrame:NSMakeRect(30, 410, 1315, 160)];
    [question setStringValue:[review objectAtIndex:row]];
    [question setCell:cell];
    [question setEditable:NO];
    [question setBezeled:NO];
    [question setDrawsBackground:NO];
    [question setSelectable:NO];
    [question setBordered:NO];
    [question setBackgroundColor:[NSColor clearColor]];
    [question setFont:[NSFont fontWithName:@"Futura" size:21]]; 
    [superView1 addSubview:question];
    [[question cell] setLineBreakMode:NSLineBreakByWordWrapping];
    [superView1 setAutoresizesSubviews:YES];
    [question setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:superView1];
    
    RSVerticallyCenteredTextFieldCell *cell1 = [[RSVerticallyCenteredTextFieldCell alloc] initTextCell:[NSString stringWithFormat:@"Answer :\n%@ ",[review objectAtIndex:row+1]]];
    
    NSView* superView2 = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1000)];
    answer = [[NSTextField alloc] initWithFrame:NSMakeRect(30, 220, 1315, 160)];
    [answer setStringValue:[NSString stringWithFormat:@"Answer :\n%@ ",[review objectAtIndex:row+1]]];
    [answer setCell:cell1];
    [answer setEditable:NO];
    [answer setBezeled:NO];
    [answer setDrawsBackground:NO];
    [answer setSelectable:NO];
    [answer setBordered:NO];
    [answer setBackgroundColor:[NSColor clearColor]];
    [answer setFont:[NSFont fontWithName:@"Futura" size:21]]; 
    [superView2 addSubview:answer];
    [[answer cell] setLineBreakMode:NSLineBreakByWordWrapping];
    [superView2 setAutoresizesSubviews:YES];
    [answer setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:superView2];
    
    RSVerticallyCenteredTextFieldCell *cell2 = [[RSVerticallyCenteredTextFieldCell alloc] initTextCell:[NSString stringWithFormat:@"Explanation :\n%@ ",[review objectAtIndex:row+2]]];
    
    NSView* superView3 = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1000)];
    explanation = [[NSTextField alloc] initWithFrame:NSMakeRect(30, 20, 1315, 170)];
    [explanation setStringValue:[NSString stringWithFormat:@"Explanation :\n%@ ",[review objectAtIndex:row+2]]];
    [explanation setCell:cell2];
    [explanation setEditable:NO];
    [explanation setBezeled:NO];
    [explanation setDrawsBackground:NO];
    [explanation setSelectable:NO];
    [explanation setBordered:NO];
    [explanation setBackgroundColor:[NSColor clearColor]];
    [explanation setFont:[NSFont fontWithName:@"Futura" size:21]]; 
    [[explanation cell] setLineBreakMode:NSLineBreakByWordWrapping];
    [superView3 addSubview:explanation];
    [superView3 setAutoresizesSubviews:YES];
    [answer setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:superView3];
    
}
-(IBAction)next:(id)sender{
    
    [imageview removeFromSuperview];
    [challenge removeFromSuperview];
    [question removeFromSuperview];
    [answer removeFromSuperview];
    [explanation removeFromSuperview];
    [prevBtn setHidden:NO];
    
    NSInteger endOfQuiz = [review count];
	if((((questionNumber - 1) * 6) + 6) == endOfQuiz)
	{
        [self.window setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"plain_back.jpg"]]];
        
        [category setHidden:YES];
        [imageview removeFromSuperview];
        [challenge removeFromSuperview];
        [question removeFromSuperview];
        [answer removeFromSuperview];
        [explanation removeFromSuperview];
        [nextBtn setHidden:YES];
        [prevBtn setHidden:YES];
        
        
        NSView* btn4 = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
        my4 = [[NSButton alloc] initWithFrame:NSMakeRect(550,400,20,20)];
        [my4 setTitle: @"A"];
        [my4 setTarget:self];
        [my4 setImage:[NSImage imageNamed:@"home.png"]];
        [my4 setAction:@selector(endQuiz)];
        [my4 setButtonType:NSMomentaryChangeButton];
        [my4 setBezelStyle:NSShadowlessSquareBezelStyle];
        [my4 setBordered:NO];
        [my4 sizeToFit];
        [btn4 addSubview:my4];
        [btn4 setAutoresizesSubviews:YES];
        [my4 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [self.window.contentView addSubview:btn4];
        
    }
    else{
        
        [self reviewQuestion];
    }
    
}
-(void)endQuiz{
    
    [backgroundmusic stop];
    [my4 removeFromSuperview];
    [self.window close];
    
    [FVC showWindow:self];
    [FVC ScoreUpdate];
    
}
-(IBAction)prev:(id)sender{
    
    [imageview removeFromSuperview];
    [challenge removeFromSuperview];
    [question removeFromSuperview];
    [answer removeFromSuperview];
    [explanation removeFromSuperview];
    [self previousQuestion];
    
}
- (void)previousQuestion{
    
    if(questionNumber == 2){
        [prevBtn setHidden:YES];
    }
    else{
        [prevBtn setHidden:NO];
    }
    
    questionNumber = questionNumber - 1;
    NSInteger row = 0;
	if(questionNumber == 1)
	{
        row = 0;
	}
	else
	{
        row = ((questionNumber - 1) * 6);
	}
    [category setStringValue:[review objectAtIndex:row +4]];
    
    NSView* myImageView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1000, 1000)];
    NSRect rect = NSMakeRect(595,660, 165, 180);
    imageview = [[NSImageView alloc] initWithFrame:rect];
    [imageview setImageScaling:NSScaleToFit];
    [imageview setImage:[NSImage imageNamed:[review objectAtIndex: row + 5]]];
    [myImageView addSubview:imageview];
    [self.window.contentView addSubview:myImageView];
    [imageview setHidden:NO];
    
    NSView* superView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1000)];
    challenge = [[NSTextField alloc] initWithFrame:NSMakeRect(30, 600, 1300, 30)];
    [challenge setStringValue:[review objectAtIndex:row+3]];
    [challenge setEditable:NO];
    [challenge setBezeled:NO];
    [challenge setDrawsBackground:NO];
    [challenge setSelectable:NO];
    [challenge setBordered:NO];
    [challenge setBackgroundColor:[NSColor clearColor]];
    [challenge setFont:[NSFont fontWithName:@"Futura" size:21]]; 
    [superView addSubview:challenge];
    [challenge sizeToFit];
    [superView setAutoresizesSubviews:YES];
    [challenge setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:superView];
    
    RSVerticallyCenteredTextFieldCell *cell = [[RSVerticallyCenteredTextFieldCell alloc] initTextCell:[review objectAtIndex:row]];
    
    NSView* superView1 = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1000)];
    question = [[NSTextField alloc] initWithFrame:NSMakeRect(30, 410, 1315, 160)];
    [question setStringValue:[review objectAtIndex:row]];
    [question setCell:cell];
    [question setEditable:NO];
    [question setBezeled:NO];
    [question setDrawsBackground:NO];
    [question setSelectable:NO];
    [question setBordered:NO];
    [question setBackgroundColor:[NSColor clearColor]];
    [question setFont:[NSFont fontWithName:@"Futura" size:21]]; 
    [superView1 addSubview:question];
    [[question cell] setLineBreakMode:NSLineBreakByWordWrapping];
    [superView1 setAutoresizesSubviews:YES];
    [question setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:superView1];
    
    RSVerticallyCenteredTextFieldCell *cell1 = [[RSVerticallyCenteredTextFieldCell alloc] initTextCell:[NSString stringWithFormat:@"Answer :\n%@ ",[review objectAtIndex:row+1]]];
    
    NSView* superView2 = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1000)];
    answer = [[NSTextField alloc] initWithFrame:NSMakeRect(30, 220, 1315, 160)];
    [answer setStringValue:[NSString stringWithFormat:@"Answer :\n%@ ",[review objectAtIndex:row+1]]];
    [answer setCell:cell1];
    [answer setEditable:NO];
    [answer setBezeled:NO];
    [answer setDrawsBackground:NO];
    [answer setSelectable:NO];
    [answer setBordered:NO];
    [answer setBackgroundColor:[NSColor clearColor]];
    [answer setFont:[NSFont fontWithName:@"Futura" size:21]]; 
    [superView2 addSubview:answer];
    [[answer cell] setLineBreakMode:NSLineBreakByWordWrapping];
    [superView2 setAutoresizesSubviews:YES];
    [answer setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:superView2];
    
    RSVerticallyCenteredTextFieldCell *cell2 = [[RSVerticallyCenteredTextFieldCell alloc] initTextCell:[NSString stringWithFormat:@"Explanation :\n%@ ",[review objectAtIndex:row+2]]];
    
    NSView* superView3 = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1000)];
    explanation = [[NSTextField alloc] initWithFrame:NSMakeRect(30, 20, 1315, 170)];
    [explanation setStringValue:[NSString stringWithFormat:@"Explanation :\n%@ ",[review objectAtIndex:row+2]]];
    [explanation setCell:cell2];
    [explanation setEditable:NO];
    [explanation setBezeled:NO];
    [explanation setDrawsBackground:NO];
    [explanation setSelectable:NO];
    [explanation setBordered:NO];
    [explanation setBackgroundColor:[NSColor clearColor]];
    [explanation setFont:[NSFont fontWithName:@"Futura" size:21]]; 
    [[explanation cell] setLineBreakMode:NSLineBreakByWordWrapping];
    [superView3 addSubview:explanation];
    [superView3 setAutoresizesSubviews:YES];
    [answer setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:superView3];
    
}
- (void)windowWillClose:(NSNotification *)notification
{
    //  NSLog (@"Notification %@", [notification name]);
    [backgroundmusic stop];
}

@end
