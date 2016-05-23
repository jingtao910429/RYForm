//
//  RYFormTextFieldCell.m
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormTextFieldCell.h"
#import "RYForm.h"
#import "RYFormRowInformation.h"
#import "UIViewExt.h"

@interface RYFormTextFieldCell ()<UITextFieldDelegate>

@property (nonatomic, readwrite, strong) UITextField *ry_textField;

@end

@implementation RYFormTextFieldCell


- (void)dealloc
{
    NSLog(@"RYFormTextFieldCell dealloc");
}

-(void)configure
{
    [super configure];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [self.contentView addSubview:self.ry_textField];
//    [self autoLayoutSubViews];
    [self updateAutoLayout];
    [self.ry_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)update
{
    [super update];
    
    self.ry_textField.delegate = self;
    self.ry_textField.clearButtonMode = UITextFieldViewModeWhileEditing;

    if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeText]) {
        self.ry_textField.autocorrectionType = UITextAutocorrectionTypeDefault;
        self.ry_textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeName]) {
        self.ry_textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.ry_textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypePhone]) {
        self.ry_textField.keyboardType = UIKeyboardTypePhonePad;
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeURL]) {
        self.ry_textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.ry_textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.ry_textField.keyboardType = UIKeyboardTypeURL;
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeEmail]) {
        self.ry_textField.keyboardType = UIKeyboardTypeEmailAddress;
        self.ry_textField.autocorrectionType = UITextAutocorrectionTypeNo;
        self.ry_textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeNumber]) {
        self.ry_textField.keyboardType = UIKeyboardTypeNumberPad;
    } else if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeDecimal]) {
        self.ry_textField.keyboardType = UIKeyboardTypeDecimalPad;
    }

    if (self.rowInformation.isRequired) {
        
    } else {
        self.ry_textLabel.text = self.rowInformation.title;
        self.ry_textLabel.textAlignment = self.rowInformation.titleTextAlignment;
    }
    
    self.ry_textField.placeholder = self.rowInformation.placeholderText;
    self.ry_textField.text = self.rowInformation.displayText;
    self.ry_textField.textAlignment = self.rowInformation.valueTextAlignment;
    self.ry_textField.enabled = !self.rowInformation.isDisabled;
    if (self.rowInformation.isDisabled) {
        if (self.rowInformation.disabledValueColor) {
            self.ry_textField.textColor = self.rowInformation.disabledValueColor;
        }
    } else {
        if (self.rowInformation.normalValueColor) {
            self.ry_textField.textColor = self.rowInformation.normalValueColor;
        }
    }
    
    [self updateAutoLayout];
}


#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.rowInformation.isRealTimeChange == NO) {
        [self valueChange];
    }
}


#pragma mark - event responses
- (void)textFieldDidChange:(UITextField *)textField{
    if (self.rowInformation.isRealTimeChange) {
        [self valueChange];
    }
}
#pragma mark - private methods

- (void)autoLayoutSubViews
{
    CGFloat top = (self.rowInformation.rowHeight - 20)/2.0f;
    CGFloat pad = 5;
    self.ry_textLabel.frame = CGRectMake(15,top , 100, 20);
    self.ry_textField.frame = CGRectMake(self.ry_textLabel.right + pad, top, ([UIScreen mainScreen].bounds.size.width - 20 - self.ry_textLabel.width - pad - 25), 30);
}

- (void)updateAutoLayout
{
    CGFloat vTop = (self.rowInformation.rowHeight - 30)/2.0f;
    CGFloat pad = 5;
    self.ry_textField.frame = CGRectMake(self.ry_textLabel.right + pad, vTop, ([UIScreen mainScreen].bounds.size.width - 20 - self.ry_textLabel.width - pad - 25), 30);
}

- (void)valueChange
{
    if([self.ry_textField.text length] > 0) {
        
        if ([self.rowInformation.rowType isEqualToString:RYFormRowInformationTypeNumber]){
            [self.rowInformation.currentController formRowValueHasChanged:self.rowInformation oldValue:self.rowInformation.value newValue:@([self.ry_textField.text doubleValue])];
            self.rowInformation.value =  @([self.ry_textField.text doubleValue]);
        } else {
            [self.rowInformation.currentController formRowValueHasChanged:self.rowInformation oldValue:self.rowInformation.value newValue:self.ry_textField.text];
            self.rowInformation.value = self.ry_textField.text;
        }
        self.rowInformation.displayText = self.ry_textField.text;
    } else {
        [self.rowInformation.currentController formRowValueHasChanged:self.rowInformation oldValue:self.rowInformation.value newValue:nil];
        self.rowInformation.value = nil;
    }
}




#pragma mark - getters


- (UITextField *)ry_textField
{
    if (_ry_textField == nil) {
        _ry_textField = [[UITextField alloc] init];
        _ry_textField.textColor = [UIColor blackColor];
        _ry_textField.font = [UIFont systemFontOfSize:13];
        _ry_textField.delegate = self;
//        _ry_textField.backgroundColor = [UIColor lightGrayColor];
    }
    return _ry_textField;
}

@end
