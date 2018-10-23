//
//  ExpandableCell.h
//  ExpandableCell
//
//  Created by Popeye Lau on 2018/10/23.
//  Copyright © 2018 Popeye Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExpandableCell : UITableViewCell
+ (NSString*) identifier;
@property (nonatomic, assign, getter=isExpanded) BOOL expanded;
@end

NS_ASSUME_NONNULL_END
