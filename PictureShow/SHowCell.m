//
//  SHowCell.m
//  PictureShow
//
//  Created by caimengnan on 2018/8/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

#import "SHowCell.h"
@interface SHowCell ()
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIImageView *myimageView;
@end

@implementation SHowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    return self;
}


- (void)setUpUI
{
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth, cellHeight)];
    self.scrollView.contentSize = CGSizeMake(kWidth, kHeight);
    self.scrollView.alwaysBounceVertical = YES;
    [self.contentView addSubview:self.scrollView];
    self.scrollView.userInteractionEnabled = NO;
    
    self.myimageView = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, kWidth, cellHeight))];
    self.myimageView.image = [UIImage imageNamed:@"timg.jpg"];
    CGFloat height = self.myimageView.image.size.height;
    self.myimageView.frame = CGRectMake(0, - height + cellHeight, kWidth, height);
    [self.scrollView addSubview:self.myimageView];
    
}

- (void)setContendOffset:(CGFloat)contendOffset
{
    _contendOffset = contendOffset;
    [self.scrollView setContentOffset:CGPointMake(0, -_contendOffset) animated:NO];
    
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
