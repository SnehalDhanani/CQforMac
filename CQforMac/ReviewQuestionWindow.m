//
//  ReviewQuestionWindow.m
//  CQforMac
//
//  Created by Jigar Zalavadiya on 10/04/12.
//  Copyright (c) 2012 SPEC. All rights reserved.
//

#import "ReviewQuestionWindow.h"

@implementation ReviewQuestionWindow
@synthesize QuestionText , myTextQue;


- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
}
-(void)AddQue{
    
     //[self.window makeKeyAndOrderFront:self];
    [[self window] setLevel:NSScreenSaverWindowLevel + 1];
    [[self window] orderFront:nil];
    
    [self.window setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"pop_up.jpg"]]];
    
    [myTextQue removeFromSuperview];
    NSView *catTextView = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 1000, 500)];
    myTextQue = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 40, 900, 200)];
    [myTextQue setStringValue:QuestionText];
    [myTextQue setAlignment:NSLeftTextAlignment];
    [myTextQue setEditable:NO];
    [myTextQue setBezeled:NO];
    [myTextQue setDrawsBackground:NO];
    [myTextQue setSelectable:NO];
    [myTextQue setBordered:NO];
    [myTextQue setBackgroundColor:[NSColor clearColor]];
    [myTextQue setFont:[NSFont fontWithName:@"Futura" size:18]];
    [myTextQue setTextColor:[NSColor blackColor]];
    [catTextView addSubview:myTextQue];
    [catTextView setAutoresizesSubviews:YES];
    [myTextQue setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.window.contentView addSubview:catTextView];
}
-(IBAction)CloseEvent:(id)sender{
    
    [self.window close];
    
    
}
@end
