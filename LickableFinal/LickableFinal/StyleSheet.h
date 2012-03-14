//
//  StyleSheet.h
//  LickableFinal
//
//  Created by Nick Kuh on 14/03/2012.
//  Copyright (c) 2012 Osmosis Digital Limited. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum {
    LabelTypeName = 0,
    LabelTypeBirthdayDate,
    LabelTypeDaysUntilBirthday,
    LabelTypeDaysUntilBirthdaySubText,
    LabelTypeLarge
}LabelType;

typedef enum {
    ImageViewTypeTableCell = 0,
    ImageViewTypeLarge
}ImageViewType;

@interface StyleSheet : NSObject

+(void) initStyles;

+(void)styleLabel:(UILabel *)label withType:(LabelType)labelType;
+(void)styleImageView:(UIImageView *)imageView withType:(ImageViewType)imageViewType;

@end
