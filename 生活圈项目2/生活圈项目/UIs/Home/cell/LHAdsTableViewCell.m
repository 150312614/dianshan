//
//  LHAdsTableViewCell.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/13.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHAdsTableViewCell.h"
#import "iCarousel.h"



@interface LHAdsTableViewCell ()<iCarouselDataSource,iCarouselDelegate>

@property (weak, nonatomic) IBOutlet iCarousel *carousel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation LHAdsTableViewCell

- (void)awakeFromNib {
    _carousel.pagingEnabled = YES;
    _carousel.delegate = self;
    _carousel.dataSource = self;
    _carousel.type = iCarouselTypeLinear;
//    _carousel.backgroundColor = [UIColor redColor];
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)setList:(LHFirstListModel *)list
{
    _list = list;
    
    //初始化
    _pageControl.numberOfPages = self.list.list.count;
    _pageControl.currentPage = 0;
    _nameLabel.text = [self.list.list[0] title];
    
    [_carousel reloadData];
    
    [self timerStrat];
}


- (void)autoRun
{
    [UIView animateWithDuration:1.0 animations:^{
        
          self.carousel.currentItemIndex = (self.carousel.currentItemIndex + 1) % self.list.list.count;
    }];
  
}

- (void)timerStrat
{
     _timer =  [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(autoRun) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}


#pragma mark -iCarouselDelegate

- (void)carouselWillBeginDragging:(iCarousel *)carousel
{
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
    }
    
}

- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate
{
    if (_timer == nil) {
        [self timerStrat];
    }
    
}

#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(__unused iCarousel *)carousel
{

    return (NSInteger)[self.list.list count];
    
}

- (UIView *)carousel:(__unused iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    
    LHFocus *focus = self.list.list[index];
   
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:self.bounds];
//        ((UIImageView *)view).image = [UIImage imageNamed:@"1.jpg"];
        [((UIImageView *)view) lh_setImageWithURLString:focus.cover];
        //        view.contentMode = UIViewContentModeCenter;
      
    }
  

    
    return view;
}

- (NSInteger)numberOfPlaceholdersInCarousel:(__unused iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 2;
}

- (UIView *)carousel:(__unused iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(UIView *)view
{
  
    LHFocus *focus = self.list.list[index];
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIImageView alloc] initWithFrame:self.bounds];
//        ((UIImageView *)view).image = [UIImage imageNamed:@"1.jpg"];
        [((UIImageView *)view) lh_setImageWithURLString:focus.cover];
        //        view.contentMode = UIViewContentModeCenter;
        
        
    }
  

    return view;
}

- (CATransform3D)carousel:(__unused iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    //implement 'flip3D' style carousel
    transform = CATransform3DRotate(transform, M_PI / 8.0f, 0.0f, 1.0f, 0.0f);
    return CATransform3DTranslate(transform, 0.0f, 0.0f, offset * self.carousel.itemWidth);
}

- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return YES;
        }
        case iCarouselOptionSpacing:
        {
            //add a bit of spacing between the item views
            return value * 1.05f;
        }
        case iCarouselOptionFadeMax:
        {
            if (self.carousel.type == iCarouselTypeCustom)
            {
                //set opacity based on distance from camera
                return 0.0f;
            }
            return value;
        }
        case iCarouselOptionShowBackfaces:
        case iCarouselOptionRadius:
        case iCarouselOptionAngle:
        case iCarouselOptionArc:
        case iCarouselOptionTilt:
        case iCarouselOptionCount:
        case iCarouselOptionFadeMin:
        case iCarouselOptionFadeMinAlpha:
        case iCarouselOptionFadeRange:
        case iCarouselOptionOffsetMultiplier:
        case iCarouselOptionVisibleItems:
        {
            return value;
        }
    }
}

#pragma mark -
#pragma mark iCarousel taps

- (void)carousel:(__unused iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSNumber *item = (self.list.list)[(NSUInteger)index];
    
    
//    NSLog(@"Tapped view number: %@", item);
}

- (void)carouselCurrentItemIndexDidChange:(__unused iCarousel *)carousel
{
//    NSLog(@"Index: %@", @(self.carousel.currentItemIndex));
    LHFocus *model = self.list.list[self.carousel.currentItemIndex];
    
    _nameLabel.text = model.title;
    _pageControl.currentPage = self.carousel.currentItemIndex;
    
}

@end
