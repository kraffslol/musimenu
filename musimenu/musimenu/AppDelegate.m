//
//  AppDelegate.m
//  musimenu
//
//  Created by Rickard Ekman on 26/03/14.
//  Copyright (c) 2014 Kraffs. All rights reserved.
//

#import "AppDelegate.h"
#import <ScriptingBridge/ScriptingBridge.h>
#import "SpotifyClient.h"

@implementation AppDelegate

SpotifyClientApplication *spotify;
NSString *song;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    spotify = [SBApplication applicationWithBundleIdentifier:@"com.spotify.client"];
    
    if (spotify.isRunning) {
        NSDistributedNotificationCenter *dnc = [NSDistributedNotificationCenter defaultCenter];
        
        [dnc addObserver:self selector:@selector(updateTrackInfoFromSpotify:) name:@"com.spotify.client.PlaybackStateChanged" object:nil];
    }
    
    [self setupStatusItem];
}

- (void)updateTrackInfoFromSpotify:(NSNotification *)notification {
    SpotifyClientTrack *spotifyTrack = [spotify currentTrack];
    
    NSLog(@"New song: %@", notification.userInfo);
    
    // Do nothing if its a pause change.
    if ([[notification.userInfo valueForKey:@"Player State"] isEqualToString:@"Stopped"]) {
        return;
    }
    
    self.statusItem.title = spotifyTrack.artist;
}

- (void)setupStatusItem
{
    _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    _statusItem.title = @"";
    _statusItem.image = [NSImage imageNamed:@"StatusItem-Image"];
    _statusItem.highlightMode = YES;
}

@end
