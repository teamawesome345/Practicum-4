//
//  AddViewController.h
//  Practicum 4
//
//  Created by Alex Wolf on 3/21/13.
//  Copyright (c) 2013 Team Awesome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myList.h"
#import "Student.h"
#import "Professor.h"

@interface AddViewController : UIViewController

//// BUTTON PROPERTIES ////

//common
@property (weak, nonatomic) IBOutlet UIButton *addButton;

//// SEGMENTED CONTROL PROPERTIES ////

//common
@property (weak, nonatomic) IBOutlet UISegmentedControl *studentProfessorButton;

//// LABEL PROPERTIES ////

//common
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;

//student only
@property (weak, nonatomic) IBOutlet UILabel *gpaLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *majorLabel;

//professor only
@property (weak, nonatomic) IBOutlet UILabel *salaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *tenureLabel;

//// TEXT FIELD PROPERTIES ////

//common
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *idField;

//student only
@property (weak, nonatomic) IBOutlet UITextField *gradYear;
@property (weak, nonatomic) IBOutlet UITextField *major;

//professor only
@property (weak, nonatomic) IBOutlet UITextField *departmentField;

//// SLIDER AND LABEL PROPERTIES ////

//student only
@property (weak, nonatomic) IBOutlet UISlider *studentSlider;
@property (weak, nonatomic) IBOutlet UILabel *studentSliderLabel;

//professor only
@property (weak, nonatomic) IBOutlet UISlider *professorSlider;
@property (weak, nonatomic) IBOutlet UILabel *professorSliderLabel;

//// SWITCH PROPERTIES ////

//professor only
@property (weak, nonatomic) IBOutlet UISwitch *tenureSwitch;

//// NON-NIB PROPERTIES ////

@property (nonatomic, retain) Student *theStudent;
@property (nonatomic, retain) Professor *theProfessor;
@property (nonatomic, retain) Person *oldPerson;
@property (nonatomic, retain) Student *oldStudent;
@property (nonatomic, retain) Professor *oldProfessor;
@property (nonatomic, retain) myList *students;

//// METHODS ////

- (IBAction)choosePersonType:(UISegmentedControl *)sender;

- (IBAction)textFieldDoneEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;

- (IBAction)gpaSliderChanged:(UISlider *)sender;
- (IBAction)salarySliderChanged:(UISlider *)sender;

- (IBAction)addButtonPressed:(id)sender;

@end
