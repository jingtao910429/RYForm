//
//  RYForm.h
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *const RYFormRowInformationTypeText;
extern NSString *const RYFormRowInformationTypeName;
extern NSString *const RYFormRowInformationTypeURL;
extern NSString *const RYFormRowInformationTypeEmail;
extern NSString *const RYFormRowInformationTypePassword;
extern NSString *const RYFormRowInformationTypeNumber;
extern NSString *const RYFormRowInformationTypePhone;
extern NSString *const RYFormRowInformationTypeImage;
extern NSString *const RYFormRowInformationTypeDecimal;
extern NSString *const RYFormRowInformationTypeTextView;
extern NSString *const RYFormRowInformationTypeSelectorActionSheet;
extern NSString *const RYFormRowInformationTypeSelectorAlertView;
extern NSString *const RYFormRowInformationTypeSelectorPickerView;
extern NSString *const RYFormRowInformationTypeSelectorPickerViewInline;
extern NSString *const RYFormRowInformationTypeSelectorLeftRight;
extern NSString *const RYFormRowInformationTypeSelectorSegmentedControl;
extern NSString *const RYFormRowInformationTypeDateInline;
extern NSString *const RYFormRowInformationTypeDateTimeInline;
extern NSString *const RYFormRowInformationTypeTimeInline;
extern NSString *const RYFormRowInformationTypeCountDownTimerInline;
extern NSString *const RYFormRowInformationTypeDate;
extern NSString *const RYFormRowInformationTypeDateTime;
extern NSString *const RYFormRowInformationTypeTime;
extern NSString *const RYFormRowInformationTypeCountDownTimer;
extern NSString *const RYFormRowInformationTypeDatePicker;
extern NSString *const RYFormRowInformationTypePicker;
extern NSString *const RYFormRowInformationTypeSlider;
extern NSString *const RYFormRowInformationTypeBooleanCheck;
extern NSString *const RYFormRowInformationTypeBooleanSwitch;
extern NSString *const RYFormRowInformationTypeStepCounter;


@interface RYForm : NSObject

+ (NSMutableDictionary *)cellClassesForRowInformationTypes;

@end
