//
//  PYRefreshManager.m
//  Pods
//
//  Created by yunhe.lin on 16/7/31.
//
//

#import "PYRefreshManager.h"
#import "PYRefreshFooter.h"
#import "PYRefreshHeader.h"

@implementation PYRefreshManager

+ (id)py_headerRefresh:(id)target action:(SEL)sel refreshType:(PYRefreshHeaderType)type
{
    MJRefreshHeader *header = nil;
    switch (type) {
        case PYRefreshHeaderTypeNormal:
            header = [PYRefreshHeader py_headerWithRefreshingTarget:target refreshingAction:@selector(sel)];
            break;
        default:
            break;
    }
    return header;
}

+ (id)py_footerRefresh:(id)target action:(SEL)sel refreshType:(PYRefreshFooterType)type
{
    MJRefreshBackFooter *footer = nil;
    switch (type) {
        case PYRefreshFooterTypeNormal:
            footer = [PYRefreshFooter footerWithRefreshingTarget:target refreshingAction:sel];
            break;
            
        default:
            break;
    }
    return footer;
}

@end
