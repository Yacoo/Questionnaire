//
//  ViewController.m
//  QuestionnaireDemo
//
//  Created by yake on 15/4/24.
//  Copyright (c) 2015年 yake. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import <AFNetworking.h>
#import "MainInfo.h"
#import <MJExtension.h>
#import "Questionnaire.h"
#import "Catelog.h"
#import "Info.h"
#import "Question.h"
#import "Logic.h"
#import "Option.h"
#import "RecommendAnswers.h"
#import "Scoring.h"

@interface ViewController ()
{
    NSManagedObjectContext * _questionnaireContext;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self sendRequest];
    [self createDatabase];
}

- (void)sendRequest
{
    NSString * url = [NSString stringWithFormat:@"http://csis.fdc.test.fang.com/SurveyInterface/GetSurveysDetail.ashx?iUserID=10138&sSurveyIDs=656,700"];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError * error = nil;
        NSDictionary * jsonResult = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        [self dataHandleWithDic:jsonResult];
      //  NSLog(@"jsonResult = %@",jsonResult);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error = %@",error);
    }];
   
}
- (void)createDatabase
{
    //1.初始化上下文
    _questionnaireContext = [[NSManagedObjectContext alloc] init];
    
    NSBundle * bundle = [NSBundle mainBundle];
    NSString * path = [bundle pathForResource:@"QuestionnaireDemo" ofType:@"momd"];
#warning 有多个模型文件，要独立开的，用下面的方法
    NSManagedObjectModel * model = [[NSManagedObjectModel alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
    
    
    //2.2持久化存储调度器
    NSPersistentStoreCoordinator * store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    //保存一个sqlite文件的话，必须知道表结构和sqlite文件路径
    //2.3告诉coredata数据存储在一个sqlite文件
    NSString * doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    //数据库名
    NSString * sqliteName = @"Questionnaire.sqlite";
    //数据库的完整文件路径
    NSString * sqlitePath = [doc stringByAppendingPathComponent:sqliteName];
    NSLog(@"path = %@",sqlitePath);
    NSError * error = nil;
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:sqlitePath] options:nil error:&error];
    _questionnaireContext.persistentStoreCoordinator = store;
}
- (void)dataHandleWithDic:(NSDictionary *)dictionary
{
    
    //获得问卷的字典
    NSDictionary * firstQuestionnaireDic = [[dictionary objectForKey:@"surveys"] objectAtIndex:0];
    
    //1.创建问卷字典
    Questionnaire * firstQuestionnaire = [NSEntityDescription insertNewObjectForEntityForName:@"Questionnaire" inManagedObjectContext:_questionnaireContext];
    
    
    //在数组中循环创建catalog的entity
     for(NSDictionary * catelogDic in firstQuestionnaireDic[@"catalogs"]){
        Catelog * oneCatelog = [NSEntityDescription insertNewObjectForEntityForName:@"Catelog" inManagedObjectContext:_questionnaireContext];
        [oneCatelog setKeyValues:catelogDic];
       
        oneCatelog.questionnaire = firstQuestionnaire;

    }
    NSError * error = nil;

    
    //创建infoEntity
    NSDictionary * infoDic = [firstQuestionnaireDic objectForKey:@"info"];
    Info * infoEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Info" inManagedObjectContext:_questionnaireContext];
    [infoEntity setKeyValues:infoDic];
    infoEntity.questionnaire = firstQuestionnaire;

    
   
    //创建questionEntity
    for(NSDictionary * questionDic in firstQuestionnaireDic[@"questions"]){
        Question * oneQuestionEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:_questionnaireContext];
        [oneQuestionEntity setKeyValues:questionDic];
        oneQuestionEntity.questionnaire = firstQuestionnaire;
        oneQuestionEntity.qNum = [questionDic objectForKey:@"QNum"];
   
        
        //创建logicEnity
        NSArray * logicArray = [questionDic objectForKey:@"logics"];
        for(NSDictionary * oneLogicDic in logicArray){
            Logic * oneLogicEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Logic" inManagedObjectContext:_questionnaireContext];
            [oneLogicEntity setKeyValues:oneLogicDic];
            oneLogicEntity.question = oneQuestionEntity;
    
        }
        
        //创建optionEntity
        for(NSDictionary * oneOptionDic in questionDic[@"options"]){
            Option * oneOptionEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Option" inManagedObjectContext:_questionnaireContext];
            [oneOptionEntity setKeyValues:oneOptionDic];
             oneOptionEntity.question = oneQuestionEntity;
            

            //创建scoringsEntity
            for(NSDictionary * oneScoringDic in oneOptionDic[@"scorings"]){
                Scoring * scoringEntity = [NSEntityDescription insertNewObjectForEntityForName:@"Scoring" inManagedObjectContext:_questionnaireContext];
                scoringEntity.option = oneOptionEntity;
                [scoringEntity setKeyValues:oneScoringDic];
                
            }

        }
        
      
        //创建recommendAnswersEnity
        for(NSDictionary * onerecommendAnswersDic in questionDic[@"recommendAnswers"]){
            RecommendAnswers * onerecommendAnswersEntity = [NSEntityDescription insertNewObjectForEntityForName:@"RecommendAnswers" inManagedObjectContext:_questionnaireContext];
            [onerecommendAnswersEntity setKeyValues:onerecommendAnswersDic];
         
        }

        NSLog(@"oneQuestionEntity.logic = %@",oneQuestionEntity);
        
    }
    
    
}

@end
