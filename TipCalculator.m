//
//  TipCalculator.m
//  TipCalculator
//
//  Created by Ali Dahesh on 2016-11-11.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import "TipCalculator.h"

@implementation TipCalculator


- (float)calculateTip : (float) billAmount : (int) percentage{
    
    return (billAmount * percentage / 100) + billAmount ;
}

-(int) adjustTipPercentage : (float) billAmount : (float) value{
    
    return (billAmount * value/100) + billAmount;
}


@end
