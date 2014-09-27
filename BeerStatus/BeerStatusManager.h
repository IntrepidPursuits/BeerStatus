//
//  BeerStatusManager.h
//  BeerStatus
//
//  Created by Colin Brash on 9/27/14.
//  Copyright (c) 2014 Intrepid Pursuits. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BeerStatusDay) {
    BeerStatusDayYesterday,
    BeerStatusDayToday,
};

@interface BeerStatusManager : NSObject

@property (strong, nonatomic) NSUserDefaults *userDefaults;
- (void)setStatus:(NSString *)status forDay:(BeerStatusDay)day;
- (NSString *)statusForDay:(BeerStatusDay)day;

@end
