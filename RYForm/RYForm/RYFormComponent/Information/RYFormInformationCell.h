//
//  RYFormInformationCell.h
//  RYForm
//
//  Created by xiaerfei on 16/5/16.
//  Copyright © 2016年 二哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RYFormInformationCell <NSObject>

- (void)configure;

- (void)update;

@optional

- (void)highlight;

- (void)unhighlight;

@end
