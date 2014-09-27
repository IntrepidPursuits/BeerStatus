//
//  TodayViewController.m
//  TodayExtension
//
//  Created by Colin Brash on 9/27/14.
//  Copyright (c) 2014 Intrepid Pursuits. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "BeerStatusManager.h"

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) BeerStatusManager *beerStatusManager;
@end

@implementation TodayViewController

- (BeerStatusManager *)beerStatusManager {
    if (_beerStatusManager == nil) {
        _beerStatusManager = [[BeerStatusManager alloc] init];
    }
    return _beerStatusManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)]];
}

#pragma mark -

- (void)viewTapped:(UITapGestureRecognizer *)sender {
    [self.extensionContext openURL:[NSURL URLWithString:@"ywdtio://"] completionHandler:nil];
}

#pragma mark -

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    NSString *yesterdayStatus = [self.beerStatusManager statusForDay:BeerStatusDayYesterday];
    NSString *todayStatus = [self.beerStatusManager statusForDay:BeerStatusDayToday];
    NSString *newStatus = [NSString stringWithFormat:@"Yesterday was %@, today is %@", yesterdayStatus ?: @"unknown", todayStatus ?: @"unknown"];
    if ([self.statusLabel.text isEqualToString:newStatus]) {
        completionHandler(NCUpdateResultNoData);
    }
    else {
        self.statusLabel.text = newStatus;
        completionHandler(NCUpdateResultNewData);
    }
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}

@end
