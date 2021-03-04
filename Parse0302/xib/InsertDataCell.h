//
//  InsertDataCell.h
//  Parse0302
//
//  Created by 임정운 on 2021/03/02.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InsertDataCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
@property (weak, nonatomic) IBOutlet UITextField *cellInput;
@property (weak, nonatomic) IBOutlet UIButton *cellEnter;

@end

NS_ASSUME_NONNULL_END
