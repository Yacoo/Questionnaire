//
//  MainInfo.m
//  QuestionnaireDemo
//
//  Created by yake on 15/4/24.
//  Copyright (c) 2015年 yake. All rights reserved.
//

#import "MainInfo.h"
#import "Questionnaire.h"

@implementation MainInfo
+ (NSDictionary *)objectClassInArray
{
    return @{@"surveys" : [Questionnaire class]};
}

@end
