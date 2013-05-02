//
//  LSDropZoneView.m
//  LockScreen
//
//  Created by Brian Turner on 4/17/13.
//  Copyright (c) 2013 Turningdevelopment. All rights reserved.
//

#import "LSDropZoneView.h"
#import "LSPasswordCharacter.h"

@interface LSDropZoneView () {
    NSMutableArray *_characters;
    NSMutableArray *_characterViews;
}


@end

@implementation LSDropZoneView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _characters = [[NSMutableArray alloc] init];
        _characterViews = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _characters = [[NSMutableArray alloc] init];
        _characterViews = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)layoutSubviews {
    if ([_characterViews count]) {
        int x = 0;
        int charWidth = MIN(320 / [_characterViews count], 100);
        for (UIImageView *characterImageView in _characterViews) {
            [characterImageView setFrame:CGRectMake(charWidth * x, 0, charWidth, charWidth)];
            x++;
        }
    }
}

- (void)addCharacter:(LSPasswordCharacter *)character {
    [_characters addObject:character];
    UIImageView *characterImageView = [[UIImageView alloc] initWithImage:[character imageForPasswordCharacter]];
    [_characterViews addObject:characterImageView];
    [self addSubview:characterImageView];
}

- (void)removeLastCharacter {
    UIImageView *imageView = [_characterViews lastObject];
    if (imageView) {
        [imageView removeFromSuperview];
        [_characterViews removeLastObject];
        [_characters removeLastObject];
    }
}

- (void)removeAllCharacters {
    [_characters removeAllObjects];
    for (UIImageView *imageView in _characterViews) {
        [imageView removeFromSuperview];
    }
    [_characterViews removeAllObjects];
    
}

@end
