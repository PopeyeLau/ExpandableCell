//
//  ExpandableCell.m
//  ExpandableCell
//
//  Created by Popeye Lau on 2018/10/23.
//  Copyright © 2018 Popeye Lau. All rights reserved.
//

#import "ExpandableCell.h"

@interface ExpandableCell ()
@property (nonatomic, strong) UIView *expandView;
@end

@implementation ExpandableCell

+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) setupView {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    UIStackView *stackView = ({
        UIStackView *view = [[UIStackView alloc] init];
        view.alignment = UIStackViewAlignmentFill;
        view.distribution = UIStackViewDistributionFill;
        view.axis = UILayoutConstraintAxisVertical;
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view;
    });
    
    UIView *fixedView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:38.0/255.0 green:205.0/255.0 blue:211.0/255.0 alpha:255.0/255.0];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view;
    });
    
    UIView *expandView = ({
        UIView *view = [[UIView alloc] init];
        view.hidden = YES;
        view.translatesAutoresizingMaskIntoConstraints = NO;
        view.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:165.0/255.0 blue:232.0/255.0 alpha:255.0/255.0];
        view;
    });
    self.expandView = expandView;
                          
    [self.contentView addSubview:stackView];
    [[stackView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor] setActive:YES];
    [[stackView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor] setActive:YES];
    [[stackView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor] setActive:YES];
    [[stackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor] setActive:YES];
    
    [stackView addArrangedSubview:fixedView];
    [stackView addArrangedSubview:expandView];

    NSLayoutConstraint *fixedViewHeight = [fixedView.heightAnchor constraintEqualToConstant:50];
    fixedViewHeight.priority = UILayoutPriorityDefaultHigh;
    fixedViewHeight.active = YES;
    
    NSLayoutConstraint *expandViewHeight = [expandView.heightAnchor constraintGreaterThanOrEqualToConstant:200];
    expandViewHeight.priority = UILayoutPriorityDefaultHigh;
    expandViewHeight.active = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setExpanded:(BOOL)expanded {
    _expanded = expanded;
    self.expandView.hidden = !expanded;
}

@end
