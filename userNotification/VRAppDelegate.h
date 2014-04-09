//
//  VRAppDelegate.h
//  userNotification
//
//  Created by Viral Rathod on 4/8/14.
//
//

#import <Cocoa/Cocoa.h>

////////////////////////////////////////////////////////////////////////////////////////////
@interface VRAppDelegate : NSObject <NSApplicationDelegate, NSUserNotificationCenterDelegate>

////////////////////////////////////////////////////////////////////////////////////////////
@property (assign) IBOutlet NSWindow *window;
@property NSUserNotificationCenter* nc;

////////////////////////////////////////////////////////////////////////////////////////////
@property (weak) IBOutlet NSButton *btnHasAction;
@property (weak) IBOutlet NSTextField *textActionTitle;
@property (weak) IBOutlet NSTextField *labelActionTitle;
@property (weak) IBOutlet NSTextField *textOtherTitle;
@property (weak) IBOutlet NSTextField *title;
@property (weak) IBOutlet NSTextField *textSubTitle;
@property (weak) IBOutlet NSTextField *textInformation;
@property (weak) IBOutlet NSTextField *labelUserActionInfo;

////////////////////////////////////////////////////////////////////////////////////////////
- (IBAction)hasActionButtonClicked:(id)sender;
- (IBAction)openPrefs:(id)sender;

////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification;
- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification;
////////////////////////////////////////////////////////////////////////////////////////////
@end
