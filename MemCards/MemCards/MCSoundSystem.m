//
//  MCSoundSystem.m
//  MemCards
//
//  Created by wasja on 10/12/12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCSoundSystem.h"



@implementation MCSoundSystem
@synthesize sound;
+(MCSoundSystem *) sharedSoundSystem{
    static MCSoundSystem *sharedSoundSystem = nil;
    if (sharedSoundSystem == nil){
        sharedSoundSystem = [[self alloc] init];
    }
    return sharedSoundSystem;
}
-(void) playEffect: (NSString*) effectName{
    if (effectName == @"click") {
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"click" ofType:@"mp3"]];
        sound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [sound setNumberOfLoops:0];
        [sound prepareToPlay];
        [sound play];
    } else if (effectName == @"card") {
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"card" ofType:@"mp3"]];
        sound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [sound setNumberOfLoops:0];
        [sound prepareToPlay];
        [sound play];
    } else if (effectName == @"music") {
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"]];
        sound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [sound setNumberOfLoops:-1];
        [sound prepareToPlay];
        [sound play];
    } else if (effectName == @"pause") {
        [sound pause];
    } else if (effectName == @"play"){
        [sound play];
    }
}
@end

