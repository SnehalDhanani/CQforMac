//
//  AppDelegate.m
//  CQforMac
//
//  Created by Jigar Zalavadiya on 03/02/12.
//  Copyright (c) 2012 SPEC. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindow.h"
#import "FirstWindowCOntroller.h"
//#import "validatereceipt.h"

const NSString * global_bundleVersion = @"1.0";
const NSString * global_bundleIdentifier = @"OEPL.COMLEX-Level-2-PE-Challenging-Questions";

@implementation AppDelegate

@synthesize window = _window;
@synthesize mainWindow;
@synthesize Fvc;
@synthesize soundIndicator;



- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [NSApp activateIgnoringOtherApps:YES];
    if(Fvc == nil)
    {
        Fvc = [[FirstWindowCOntroller alloc] initWithWindowNibName:@"FirstWindowCOntroller"];
       // [Fvc showWindow:self];
    }
    [Fvc showWindow:self];
}
/*
-(void)applicationWillFinishLaunching:(NSNotification *)notification {
    
    // Locate the receipt
    //   NSString *receiptPath = [[[NSBundle mainBundle] appStoreReceiptURL] path];
    
    // Test whether the receipt is present at the above path
    NSString * pathToReceipt = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Contents/_MASReceipt/receipt"];
    if (!validateReceiptAtPath(pathToReceipt))
        
		exit(173);
    //if (![[NSFileManager defaultManager] fileExistsAtPath:receiptPath]) {
    
    // Validation fails
    // exit(173);
    // }
    
    // Proceed with further receipt validation steps 
}
 */
@end
