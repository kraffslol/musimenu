//
//  AppDelegate.h
//  musimenu
//
//  Created by Rickard Ekman on 26/03/14.
//  Copyright (c) 2014 Kraffs. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) NSStatusItem *statusItem;
@property (assign) IBOutlet NSWindow *window;

@end
