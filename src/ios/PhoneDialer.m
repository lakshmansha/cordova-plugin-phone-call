//
//  PhoneDialer.m

//
//  Created by Justin McNally on 11/17/11.
//  Copyright (c) 2011 Kohactive. All rights reserved.
//
//  Revised by Trevor Cox of Appazur Solutions Inc. on 01/06/12
//  Revised by Gaetan SENN. on 24/09/13

#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import "PhoneDialer.h"


@implementation PhoneDialer

// - (void)call:(CDVInvokedUrlCommand*)command
// {
//     [self.commandDelegate runInBackground:^{
//         CDVPluginResult* pluginResult = nil;
//         NSString* url;
//         NSString* number = [command.arguments objectAtIndex:0];
//         NSString* appChooser = [command.arguments objectAtIndex:1];

//         if (number != nil && [number length] > 0) {
//             if ([number hasPrefix:@"tel:"] || [number hasPrefix:@"telprompt://"]) {
//                 url = number;
//             } else {
//                 // escape characters such as spaces that may not be accepted by openURL
//                 url = [NSString stringWithFormat:@"tel:%@",
//                 [number stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//             }
//             // pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
//             // openURL is expected to fail on devices that do not have the Phone app, such as simulators, iPad, iPod touch
//             if(![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
//                 pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"feature"];
//             } else if(![[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]]) {
//             // missing phone number
//                 pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"notcall"];
//             } else {
//                 pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
//             }
//         } else {
//             // missing phone number
//             pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"empty"];
//         }

//         // return result
//         [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
//     }];
// }


- (void)call:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{

        CDVPluginResult* pluginResult = nil;
        AVAudioSession *sessionInstance = [AVAudioSession sharedInstance];
        
        if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]]) {
            
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"feature"];
        } else {
            
            NSString* url;
            NSString* number = [command.arguments objectAtIndex:0];
            bool* IsSpeakerOn = [command.arguments objectAtIndex:2];

            if (number != nil && [number length] > 0) {
                if ([number hasPrefix:@"tel:"] || [number hasPrefix:@"telprompt://"]) {
                    url = number;
                } else {
                    // escape characters such as spaces that may not be accepted by openURL
                    url = [NSString stringWithFormat:@"tel:%@",
                    [number stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                }
                
                if (IsSpeakerOn) {
                    [sessionInstance overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];  
                    NSLog(@"Configuring Speaker On");  
                } else {
                    [sessionInstance overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:&error];
                    NSLog(@"Configuring Speaker OFf");
                }
                

                // openURL is expected to fail on devices that do not have the Phone app, such as simulators, iPad, iPod touch
                if(![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"feature"];
                }
                else if(![[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]]) {
                    // missing phone number
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"notcall"];
                } else {
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                }

            } else {
                // missing phone number
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"empty"];
            }
        }
        
        // return result
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}


- (void)dial:(CDVInvokedUrlCommand*)command
{
    [self.commandDelegate runInBackground:^{

        CDVPluginResult* pluginResult = nil;
        AVAudioSession *sessionInstance = [AVAudioSession sharedInstance];
        
        if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]]) {
            
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"feature"];
        } else {
            
            NSString* url;
            NSString* number = [command.arguments objectAtIndex:0];
            bool* IsSpeakerOn = [command.arguments objectAtIndex:2];

            if (number != nil && [number length] > 0) {
                if ([number hasPrefix:@"tel:"] || [number hasPrefix:@"telprompt://"]) {
                    url = number;
                } else {
                    // escape characters such as spaces that may not be accepted by openURL
                    url = [NSString stringWithFormat:@"tel:%@",
                    [number stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                }

                if (IsSpeakerOn) {
                    [sessionInstance overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];  
                    NSLog(@"Configuring Speaker On");  
                } else {
                    [sessionInstance overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:&error];
                    NSLog(@"Configuring Speaker OFf");
                }

                // openURL is expected to fail on devices that do not have the Phone app, such as simulators, iPad, iPod touch
                if(![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"feature"];
                }
                else if(![[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]]) {
                    // missing phone number
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"notcall"];
                } else {
                    
                    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                }

            } else {
                // missing phone number
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"empty"];
            }
        }
        
        // return result
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (BOOL)speakerOn
{        
    BOOL success = nil;
    @try {
        AVAudioSession *sessionInstance = [AVAudioSession sharedInstance];
        success = [sessionInstance overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:nil];    
        NSLog(@"Configuring Speaker On");
    }    
    @catch (NSException *exception) {
       NSLog(@"Unknown error returned from Configuring Speaker On");
    }
    return success;
}


@end
