//
//  ReviewQuestionWindow.h
//  CQforMac
//
//  Created by Jigar Zalavadiya on 10/04/12.
//  Copyright (c) 2012 SPEC. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ReviewQuestionWindow : NSWindowController{
    
    
    id QuestionText;
    IBOutlet NSTextField *myTextQue;
    IBOutlet NSButton *closeBtn;
    
    
    
}
@property(nonatomic , retain) id QuestionText;
@property(nonatomic, retain) IBOutlet NSTextField *myTextQue;

-(IBAction)CloseEvent:(id)sender;

-(void)AddQue;

@end
