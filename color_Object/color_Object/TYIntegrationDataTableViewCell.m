//
//  TYIntegrationDataTableViewCell.m
//  color_Object
//
//  Created by 汤义 on 2018/6/21.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYIntegrationDataTableViewCell.h"

@implementation TYIntegrationDataTableViewCell
+ (instancetype)addIntegrationDataTableViewCell:(UITableView *)tableView {
    static NSString *ID = @"TYIntegrationDataTableViewCell";
    TYIntegrationDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TYIntegrationDataTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
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
