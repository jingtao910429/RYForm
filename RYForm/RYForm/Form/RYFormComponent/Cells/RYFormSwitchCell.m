//
//  RYFormSwitchCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormSwitchCell.h"
#import "RYFormRowInformation.h"
#import "UIViewExt.h"
#import "RYFormViewController.h"

@interface RYFormSwitchCell ()

@property (nonatomic, strong, readwrite) UISwitch *switchControl;

@end

@implementation RYFormSwitchCell

- (void)configure
{
    [super configure];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.accessoryView = [[UISwitch alloc] init];
    self.editingAccessoryView = self.accessoryView;
    [self.switchControl addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
}


- (void)update
{
    [super update];
    self.ry_textLabel.text = self.rowInformation.title;
    self.switchControl.on = [self.rowInformation.value boolValue];
    self.switchControl.enabled = !self.rowInformation.isDisabled;
}


#pragma mark - event responses
- (void)valueChanged
{
    if ([self.rowInformation.currentController respondsToSelector:@selector(formRowValueHasChanged:oldValue:newValue:)]) {
        [self.rowInformation.currentController formRowValueHasChanged:self.rowInformation oldValue:self.rowInformation.value newValue:@(self.switchControl.on)];
    }
    
    self.rowInformation.value = @(self.switchControl.on);
    if ([self.rowInformation.currentController respondsToSelector:@selector(switchDisPlayValueToCompetentTypeWithFormRow:)]) {
        id value = [self.rowInformation.currentController.child switchDisPlayValueToCompetentTypeWithFormRow:self.rowInformation];
        self.rowInformation.value = (value == nil)?@(self.switchControl.on):value;
    }
}

#pragma mark - getters
- (UISwitch *)switchControl
{
    return (UISwitch *)self.accessoryView;
}

@end
