//
//  BeerStatusManager.m
//  BeerStatus
//
//  Created by Colin Brash on 9/27/14.
//  Copyright (c) 2014 Intrepid Pursuits. All rights reserved.
//

#import "BeerStatusManager.h"

@implementation BeerStatusManager

- (NSUserDefaults *)userDefaults {
    if (!_userDefaults) {
        _userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.io.intrepid.BeerStatus"];
    }
    return _userDefaults;
}

- (void)setStatus:(NSString *)status forDay:(BeerStatusDay)day {
    NSString *key = (day == BeerStatusDayYesterday) ? @"yesterdayStatus" : @"todayStatus";
    [self.userDefaults setObject:status forKey:key];
    [self.userDefaults synchronize];
}

- (NSString *)statusForDay:(BeerStatusDay)day {
    NSString *key = (day == BeerStatusDayYesterday) ? @"yesterdayStatus" : @"todayStatus";
    return [self.userDefaults objectForKey:key];
}

@end
