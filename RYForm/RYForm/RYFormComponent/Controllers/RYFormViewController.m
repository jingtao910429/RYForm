//
//  RYFormViewController.m
//  RYForm
//
//  Created by xiaerfei on 16/5/15.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import "RYFormViewController.h"
#import "RYFormBaseCell.h"
@interface RYFormViewController ()


@end

@implementation RYFormViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        if ([self conformsToProtocol:@protocol(RYFormViewControllerDelegate)]) {
            self.child = (id <RYFormViewControllerDelegate>)self;
        } else {
            @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"子类必须实现RYFormViewControllerDelegate代理方法" userInfo:nil];
        }
        
        [self initializeForm];
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self){
        [self initializeForm];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self configData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeForm
{
    id <RYFormDataConfigure> class = [self.child configureFormDataClass];
    self.formInformation = [class configureFormInformation];
}

- (void)configUI
{
    [self.view addSubview:self.formTableView];
    self.formTableView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
}

- (void)configData
{
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.formInformation.formSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section >= self.formInformation.formSections.count){
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"section 大于数据池里的sections" userInfo:nil];
    }
    return [[[self.formInformation.formSections objectAtIndex:section] formRows] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYFormRowInformation * rowDescriptor = [self.formInformation formRowAtIndex:indexPath];
    return [rowDescriptor cellForForm];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYFormRowInformation * rowDescriptor = [self.formInformation formRowAtIndex:indexPath];
    [self updateFormRow:rowDescriptor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

#pragma mark - 
-(RYFormBaseCell *)updateFormRow:(RYFormRowInformation *)formRow
{
    RYFormBaseCell * cell = [formRow cellForForm];
    [self configureCell:cell];

    return cell;
}

-(void)configureCell:(RYFormBaseCell *) cell
{
    [cell update];
}

#pragma mark - getters

- (UITableView *)formTableView
{
    if (_formTableView == nil) {
        _formTableView = [[UITableView alloc] init];
        _formTableView.delegate   = self;
        _formTableView.dataSource = self;
    }
    return _formTableView;
}


@end
