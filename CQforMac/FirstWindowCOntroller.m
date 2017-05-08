//
//  FirstWindowCOntroller.m
//  CQforMac
//
//  Created by Jigar Zalavadiya on 28/02/12.
//  Copyright (c) 2012 SPEC. All rights reserved.
//

#import "FirstWindowCOntroller.h"
#import "MainWindow.h"
#import "ReviewController.h"
#import "AppDelegate.h"


@implementation FirstWindowCOntroller

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        hintCount = 0;
        NSNotificationCenter  *nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(windowWillClose:)
                   name:NSWindowWillCloseNotification
                 object:nil];  
        
    }
    
    return self;
}

@synthesize fisrtCat, secondCat, thirdCat, fourCat, reviewBtn;
@synthesize mainWindow, reviewController, soundBtn, buttontTitle;



- (void)windowDidLoad
{
    [super windowDidLoad];
    [self ScoreUpdate];
    
}

-(void)ScoreUpdate{
    
    [self.soundBtn bind:@"title" toObject:self withKeyPath:@"buttontTitle" options:nil];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"m4a"];
    backgroundSound = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    backgroundSound.numberOfLoops = -1;
    [backgroundSound play];
    
    NSUserDefaults *soundvalue= [NSUserDefaults standardUserDefaults];
    NSInteger soundintvalue = [soundvalue integerForKey:@"soundkey"];
    
    if (soundintvalue == 0) {
        
        [soundBtn setImage:[NSImage imageNamed:@"sound_accept.png"]];
        [soundBtn setTitle:@" "];
        AppDelegate *appDelegate = (AppDelegate *) [[NSApplication sharedApplication] delegate];
        appDelegate.soundIndicator = 0;
        [backgroundSound play];
        
        [self updateButtonTitle];
        
    }else
    {
        [soundBtn setImage:[NSImage imageNamed:@"sound.png"]];
        [soundBtn setTitle:@""];
        AppDelegate *appDelegate = (AppDelegate *) [[NSApplication sharedApplication] delegate];
        appDelegate.soundIndicator = 0;
        [backgroundSound stop];
        [self updateButtonTitle];
    }
    
    NSLog(@"SoundintValue :%ld", soundintvalue);
    
    NSUserDefaults *finals= [NSUserDefaults standardUserDefaults];
    NSInteger scoreintValue = [finals integerForKey:@"keyForScore"];
    
    NSUserDefaults *filepref = [NSUserDefaults standardUserDefaults];
    NSString *myFile = [filepref stringForKey:@"KeyForFilename"];
    
    if ([myFile isEqualToString:@"file1"]) {
        
        [score1 removeFromSuperview];
        NSView *ScoreView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
       score1 = [[NSTextField alloc] initWithFrame:NSMakeRect(500, 360, 150, 50)];
        [score1 setStringValue:[NSString stringWithFormat:@"Score : %d%%" ,scoreintValue]];
        [score1 setTextColor:[NSColor blackColor]];
        [score1 setEditable:NO];
        [score1 setBezeled:NO];
        [score1 setDrawsBackground:NO];
        [score1 setSelectable:NO];
        [score1 setBordered:NO];
        [score1 setBackgroundColor:[NSColor clearColor]];
        [score1 setFont:[NSFont fontWithName:@"Futura" size:20]];
        [ScoreView addSubview:score1];
        [ScoreView setAutoresizesSubviews:YES];
        [score1 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [self.window.contentView addSubview:ScoreView];
        
    }
    else if([myFile isEqualToString:@"file2"]){
        
        [score removeFromSuperview];
        NSView *ScoreView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
        score = [[NSTextField alloc] initWithFrame:NSMakeRect(750, 360, 150, 50)];
        [score setStringValue:[NSString stringWithFormat:@"Score : %d%%" ,scoreintValue]];
        [score setTextColor:[NSColor blackColor]];
        [score setEditable:NO];
        [score setBezeled:NO];
        [score setDrawsBackground:NO];
        [score setSelectable:NO];
        [score setBordered:NO];
        [score setBackgroundColor:[NSColor clearColor]];
        [score setFont:[NSFont fontWithName:@"Futura" size:20]];
        [ScoreView addSubview:score];
        [ScoreView setAutoresizesSubviews:YES];
        [score setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [self.window.contentView addSubview:ScoreView];
    }
    else if([myFile isEqualToString:@"file3"]){
        
        [score2 removeFromSuperview];
        NSView *ScoreView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
        score2 = [[NSTextField alloc] initWithFrame:NSMakeRect(500, 130, 150, 50)];
        [score2 setStringValue:[NSString stringWithFormat:@"Score : %d%%" ,scoreintValue]];
        [score2 setTextColor:[NSColor blackColor]];
        [score2 setEditable:NO];
        [score2 setBezeled:NO];
        [score2 setDrawsBackground:NO];
        [score2 setSelectable:NO];
        [score2 setBordered:NO];
        [score2 setBackgroundColor:[NSColor clearColor]];
        [score2 setFont:[NSFont fontWithName:@"Futura" size:20]];
        [ScoreView addSubview:score2];
        [ScoreView setAutoresizesSubviews:YES];
        [score2 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [self.window.contentView addSubview:ScoreView];
        
    }
    else if([myFile isEqualToString:@"file4"]){
        
        [score3 removeFromSuperview];
        NSView *ScoreView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1400, 1400)];
        score3 = [[NSTextField alloc] initWithFrame:NSMakeRect(750, 130, 150, 50)];
        [score3 setStringValue:[NSString stringWithFormat:@"Score : %d%%" ,scoreintValue]];
        [score3 setTextColor:[NSColor blackColor]];
        [score3 setEditable:NO];
        [score3 setBezeled:NO];
        [score3 setDrawsBackground:NO];
        [score3 setSelectable:NO];
        [score3 setBordered:NO];
        [score3 setBackgroundColor:[NSColor clearColor]];
        [score3 setFont:[NSFont fontWithName:@"Futura" size:20]];
        [ScoreView addSubview:score3];
        [ScoreView setAutoresizesSubviews:YES];
        [score3 setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        [self.window.contentView addSubview:ScoreView];
    }

}

-(IBAction)SoundOnOff:(id)sender{
    
    hintCount++;
    [self updateButtonTitle];
    

}
-(void)updateButtonTitle{
    
    self.buttontTitle = (hintCount %2 == 0) ? @" " :@"";
    
    
    AppDelegate *appDelegate = (AppDelegate *) [[NSApplication sharedApplication] delegate ];
    
    if ([buttontTitle isEqualToString:@" "]) {
     
        appDelegate.soundIndicator = 0;
        [soundBtn setImage:[NSImage imageNamed:@"sound_accept.png"]];
        
     //   NSString *path = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"m4a"];
     //   backgroundSound = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
      //  backgroundSound.numberOfLoops = -1;
        [backgroundSound play];
        
    }else
    {
        [soundBtn setImage:[NSImage imageNamed:@"sound.png"]];
        appDelegate.soundIndicator = 1;
        [backgroundSound stop];
    }
    
    NSLog(@"Sound Value :%d", appDelegate.soundIndicator);
    
}

-(IBAction)Cat1:(id)sender{
    
    [backgroundSound stop];
    
    if (!mainWindow) {
        mainWindow = [[MainWindow alloc] initWithWindowNibName:@"MainWindow"];
        mainWindow.Fvc = self;
    }
    mainWindow.welcome = @"This app gonna make you expert at answering patient questions, concerns and handling special situations during your patient encounter. It is very fun exercise. We are sure, you will enjoy it. Let’s try some challenges that you might face in the beginning of patient encounter.  Please remember that you should make your patient as comfortable as possible by helping them.\n\nThis category has 11 multiple choice questions to practice. Please select the best possible answer. Good luck.";
    [[self window] close];
    mainWindow.filename = @"file1";
    mainWindow.scoreTotal = 110;
    mainWindow.catName =@"Challenge: Beginning  of Patient Encounter";
    
    [mainWindow showWindow:self];
    [mainWindow addQuiz];
    
}
-(IBAction)Cat2:(id)sender{
    
    [backgroundSound stop];
    if (!mainWindow) {
        mainWindow = [[MainWindow alloc] initWithWindowNibName:@"MainWindow"];
        mainWindow.Fvc = self;
    }
    mainWindow.welcome = @"This app gonna make you expert at answering patient questions, concerns and handling special situations during your patient encounter. It is very fun exercise. We are sure, you will enjoy it. Let’s try some challenges that you might face in the beginning of patient encounter.  Please remember that you should make your patient as comfortable as possible by helping them.\n\nThis category has 11 multiple choice questions to practice. Please select the best possible answer. Good luck.";
    [[self window] close];
    mainWindow.filename = @"file2";
    mainWindow.scoreTotal = 400;
    mainWindow.catName =@"Challenge: Middle of Patient Encounter";
    [mainWindow showWindow:self];
    [mainWindow addQuiz];
}
-(IBAction)Cat3:(id)sender{
    
    [backgroundSound stop];
    if (!mainWindow) {
        mainWindow = [[MainWindow alloc] initWithWindowNibName:@"MainWindow"];
        mainWindow.Fvc = self;
    }
    mainWindow.welcome = @"This app gonna make you expert at answering patient questions, concerns and handling special situations during your patient encounter. It is very fun exercise. We are sure, you will enjoy it. Let’s try some challenges that you might face in the beginning of patient encounter.  Please remember that you should make your patient as comfortable as possible by helping them.\n\nThis category has 11 multiple choice questions to practice. Please select the best possible answer. Good luck.";
    [[self window] close];
    mainWindow.filename = @"file3";
    mainWindow.scoreTotal = 150;
    mainWindow.catName=@"Challenge: During Physical Examination (PE)";
    [mainWindow showWindow:self];
    [mainWindow addQuiz];

    
}
-(IBAction)Cat4:(id)sender{
    
    [backgroundSound stop];
    if (!mainWindow) {
        mainWindow = [[MainWindow alloc] initWithWindowNibName:@"MainWindow"];
        mainWindow.Fvc = self;
    }
    mainWindow.welcome = @"This app gonna make you expert at answering patient questions, concerns and handling special situations during your patient encounter. It is very fun exercise. We are sure, you will enjoy it. Let’s try some challenges that you might face in the beginning of patient encounter.  Please remember that you should make your patient as comfortable as possible by helping them.\n\nThis category has 11 multiple choice questions to practice. Please select the best possible answer. Good luck.";
    [[self window] close];
    mainWindow.filename = @"file4";
    mainWindow.scoreTotal = 350;
    mainWindow.catName =@"Challenge: During Closure";
    [mainWindow showWindow:self];
    [mainWindow addQuiz];

}
-(IBAction)ReviewEvent:(id)sender{
    
    [backgroundSound stop];
    if (!reviewController) {
        reviewController = [[ReviewController alloc] initWithWindowNibName:@"ReviewController"];
        reviewController.FVC = self;
    }
    [[self window] close];
    [reviewController showWindow:self];
    [reviewController Review];
    
}
- (void)windowWillClose:(NSNotification *)notification
{
    //  NSLog (@"Notification %@", [notification name]);
    [backgroundSound stop];
}
@end
