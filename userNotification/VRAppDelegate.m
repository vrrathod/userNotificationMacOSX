//
//  VRAppDelegate.m
//  userNotification
//
//  Created by Viral Rathod on 4/8/14.
//
//

#import "VRAppDelegate.h"

@implementation VRAppDelegate

@synthesize nc;
@synthesize labelActionTitle, textActionTitle, btnHasAction;
@synthesize textOtherTitle;
@synthesize title, textSubTitle, textInformation;
@synthesize labelUserActionInfo;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    nc = [NSUserNotificationCenter defaultUserNotificationCenter];
    [nc setDelegate:self];
}

- (IBAction)showNotification:(id)sender{
    [self.labelUserActionInfo setStringValue:@"Label"];
    NSUserNotification* notification = [[NSUserNotification alloc] init];
    notification.title = self.title.stringValue;
    notification.subtitle = self.textSubTitle.stringValue;
    notification.informativeText = self.textInformation.stringValue;
    notification.hasActionButton = (NSOnState == [self.btnHasAction state]);
    notification.actionButtonTitle = self.textActionTitle.stringValue;
    notification.otherButtonTitle = self.textOtherTitle.stringValue;
    notification.deliveryDate = [NSDate dateWithTimeInterval:1 sinceDate:[NSDate date]];
    [nc scheduleNotification:notification];
}

- (IBAction)hasActionButtonClicked:(id)sender {
    BOOL showAction = (NSOnState == [sender state]);
    [self.textActionTitle setEnabled:showAction];
    [self.labelActionTitle setEnabled:showAction];
}

- (IBAction)openPrefs:(id)sender {
    [[NSWorkspace sharedWorkspace] openFile:@"/System/Library/PreferencePanes/Notifications.prefPane"];
}

////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center
     shouldPresentNotification:(NSUserNotification *)notification {
    return YES;
}
- (void)userNotificationCenter:(NSUserNotificationCenter *)center
       didActivateNotification:(NSUserNotification *)notification {
    NSString* message = @"";
    switch (notification.activationType) {
        case NSUserNotificationActivationTypeActionButtonClicked:
            message = [NSString stringWithFormat:@"Action Button Clicked %@", notification.actionButtonTitle];
            break;
        case NSUserNotificationActivationTypeContentsClicked:
            message = [NSString stringWithFormat:@"Contents Clicked %@ [%@]", notification.title, notification.subtitle];
            break;
        case NSUserNotificationActivationTypeReplied:
            message = @"Replied ??";
            break;
        case NSUserNotificationActivationTypeNone:
        default:
            message = @"None";
            break;
    }
    [self.labelUserActionInfo setStringValue:message];
    [nc removeDeliveredNotification:notification];
}
@end
