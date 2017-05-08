//
//  AppDelegate.h
//  CQforMac
//
//  Created by Jigar Zalavadiya on 03/02/12.
//  Copyright (c) 2012 SPEC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@class MainWindow;
@class FirstWindowCOntroller;


@interface AppDelegate : NSObject <NSApplicationDelegate>{
    
    IBOutlet MainWindow *mainWindow;
    IBOutlet FirstWindowCOntroller *Fvc;
    int soundIndicator;
    
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet MainWindow *mainWindow;
@property (nonatomic, retain) IBOutlet FirstWindowCOntroller *Fvc;
@property (nonatomic) int soundIndicator;

@end
