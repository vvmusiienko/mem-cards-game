//
//  MCSoundSystem.m
//  MemCards
//
//  Created by wasja on 10/12/12.
//  Copyright (c) 2012 Vova Musiienko. All rights reserved.
//

#import "MCSoundSystem.h"



@implementation MCSoundSystem
@synthesize effect;
@synthesize music;
+(MCSoundSystem *) sharedSoundSystem{
    static MCSoundSystem *sharedSoundSystem = nil;
    if (sharedSoundSystem == nil){
        sharedSoundSystem = [[self alloc] init];
    }
    return sharedSoundSystem;
}
-(void) playEffect: (NSString*) effectName{
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: effectName ofType:@"mp3"]];
        effect = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [effect setNumberOfLoops:0];
        [effect prepareToPlay];
        [effect play];
}
-(void) playMusic: (NSString*) effectName{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource: effectName ofType:@"mp3"]];
    music = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [music setNumberOfLoops:-1];
    [music prepareToPlay];
    [music play];
}
-(void) play{
    [music play];
}
-(void) pause{
    [music pause];
}

@end

