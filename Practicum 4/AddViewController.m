//
//  FirstViewController.m
//  Practicum 4
//
//  Created by Alex Wolf on 3/21/13.
//  Copyright (c) 2013 Team Awesome. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Add", @"Add");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)choosePersonType:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0){
        self.salaryLabel.hidden = YES;
        self.professorSliderLabel.hidden = YES;
        self.professorSlider.hidden = YES;
        self.departmentLabel.hidden = YES;
        self.departmentField.hidden = YES;
        self.tenureLabel.hidden = YES;
        self.tenureSwitch.hidden = YES;
        self.gpaLabel.hidden = NO;
        self.studentSliderLabel.hidden = NO;
        self.studentSlider.hidden = NO;
        self.gradYear.hidden = NO;
        self.gradYearLabel.hidden = NO;
        self.major.hidden = NO;
        self.majorLabel.hidden = NO;
    }
    else {
        self.gpaLabel.hidden = YES;
        self.studentSliderLabel.hidden = YES;
        self.studentSlider.hidden = YES;
        self.gradYear.hidden = YES;
        self.gradYearLabel.hidden = YES;
        self.major.hidden = YES;
        self.majorLabel.hidden = YES;
        self.salaryLabel.hidden = NO;
        self.professorSliderLabel.hidden = NO;
        self.professorSlider.hidden = NO;
        self.departmentLabel.hidden = NO;
        self.departmentField.hidden = NO;
        self.tenureLabel.hidden = NO;
        self.tenureSwitch.hidden = NO;
    }

}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender
{
    [self.firstName resignFirstResponder];
    [self.lastName resignFirstResponder];
    [self.idField resignFirstResponder];
    [self.departmentField resignFirstResponder];
    [self.major resignFirstResponder];
    [self.gradYear resignFirstResponder];
}

- (IBAction)gpaSliderChanged:(UISlider *)sender
{
    double progress = sender.value;
    self.studentSliderLabel.text = [NSString stringWithFormat:@"%.1f", progress];
}

- (IBAction)salarySliderChanged:(UISlider *)sender
{
    float progress = sender.value;
    self.professorSliderLabel.text = [NSString stringWithFormat:@"%.2f", progress];
}

- (IBAction)addButtonPressed:(id)sender
{
    
    NSString *firstName;
    NSString *lastName;
    int ID;
    bool status;
    
    NSString *msg;
    NSString *title;
    
    if ([self.firstName.text isEqual: @""]){
        title = @"Invalid First Name";
        msg = @"Type something!";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Fine"
                              otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    else {
        firstName = self.firstName.text;
        
        // Reduce first name to lower case
        firstName = [firstName lowercaseString];
    }
    
    if ([self.lastName.text isEqual: @""]){
        title = @"Invalid Last Name";
        msg = @"Type something!";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Fine"
                              otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    else {
        lastName = self.lastName.text;
        
        // Reduce last name to lower case
        lastName = [lastName lowercaseString];
        
    }
    
    if (([self.idField.text isEqual: @""]) || ([self.idField.text intValue] <= 0)){
        
        title = @"Invalid ID";
        msg = @"Enter a nonnegative number.";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Oops!"
                              otherButtonTitles:nil];
        [alert show];
        
        self.idField.text = @"";
        
        return;
    }
    else {
        int index = -1;
        // Ask user for ID number
        ID = [self.idField.text intValue];
        
        // Error checking for ID number
        for (int i = 1; i < (self.students.size + 1); i++) {
            self.oldStudent = [self.students retrieve: i];
            if (ID == self.oldStudent.IDNum) {
                index = i;
                break;
            }
        }
        if (index != -1){
            title = @"Invalid ID";
            msg = @"ID already taken.";
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:title
                                  message:msg
                                  delegate:nil
                                  cancelButtonTitle:@"Darn!"
                                  otherButtonTitles:nil];
            [alert show];
            
            self.idField.text = @"";
            
            return;
        }
    }

    if (self.studentProfessorButton.selectedSegmentIndex == 0) {
        
        // Variables specifically for student data
        float GPA;
        NSString *major;
        int year;
        
        
        // Ask user for GPA
        //printf("Enter the student's GPA: ");
        //scanf("%f", &GPA);
        
        GPA = [self.studentSliderLabel.text floatValue];
        //printf("GPA: %f\n", GPA);
        
        
        if (([self.gradYear.text isEqual: @""]) || ([self.gradYear.text intValue] <= 0)){
            title = @"Invalid Grad Year";
            msg = @"Enter a nonnegative number.";
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:title
                                  message:msg
                                  delegate:nil
                                  cancelButtonTitle:@"Oops!"
                                  otherButtonTitles:nil];
            [alert show];
            
            self.gradYear.text = @"";
            
            return;
        }
        else {
            year = [self.gradYear.text intValue];
        }
        
        
        //ask user for major
        //if input is empty send out alert
        if (self.major.text == @""){
            title = @"Invalid Major";
            msg = @"Enter a major.";
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:title
                                  message:msg
                                  delegate:nil
                                  cancelButtonTitle:@"Oops!"
                                  otherButtonTitles:nil];
            [alert show];
            
            self.major.text = @"";
            
            return;
        }
        else {
            major = self.major.text;
            
            //Reduce the response to lowercase
            major = [major lowercaseString];
            
        }
        
        
        // Set status to true because it is a student
        status = true;
        
        // Sets the first name, last name, ID, GPA, Major, Graduation Year, and Status of the student based on user input
        self.theStudent.firstName = firstName;
        self.theStudent.lastName = lastName;
        self.theStudent.IDNum = ID;
        self.theStudent.gradePA = GPA;
        self.theStudent.major = major;
        self.theStudent.gradYear = year;
        self.theStudent.isStudent = status;
        
        
        // Inserts the new student into the list
        bool success = [self.students insert: (self.students.size + 1) andData: self.theStudent];
        
        
        // Display results of request
        
        
        if (success) {
            title = @"Success!";
            msg = @"Student Added!";
            self.firstName.text = @"";
            self.lastName.text = @"";
            self.idField.text = @"";
            [self.studentSlider setValue:2 animated:YES];
            self.studentSliderLabel.text = @"2.0";
            self.gradYear.text = @"";
            self.major.text = @"";
        } else {
            title = @"Failure!";
            msg = @"Student not added...";
        }
        self.theStudent = [[Student alloc] init]; // Have to clear so that head is no longer pointing at theStudent
        
        
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Okay"
                              otherButtonTitles:nil];
        [alert show];
        
    }
    // If the person is a teacher...
    else if (self.studentProfessorButton.selectedSegmentIndex == 1) {
        
        // Variables specific to teacher data
        bool tenure;
        int salary;
        NSString *department;
        
        // Ask the user for tenure (yes or no)
        
        //Set the value for tenure
        tenure = self.tenureSwitch.isOn;
        
        
        
        // Ask the user for a salary
        
        salary = [self.professorSliderLabel.text intValue];
        
        
        if ([self.departmentField.text isEqual: @""]){
            title = @"Invalid Department";
            msg = @"Enter a department.";
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:title
                                  message:msg
                                  delegate:nil
                                  cancelButtonTitle:@"Oops!"
                                  otherButtonTitles:nil];
            [alert show];
            
            self.departmentField.text = @"";
            
            return;
        }
        else {
            department = self.departmentField.text;
            
            // Reduce the response to lowercase
            department = [department lowercaseString];
        }
        
        
        
        // Set the status to false because it is a teacher
        status = false;
        
        // Sets the first name, last name, ID, Salary, Tenure, Department, and Status of the teacher based on user input
        self.theProfessor.firstName = firstName;
        self.theProfessor.lastName = lastName;
        self.theProfessor.IDNum = ID;
        self.theProfessor.salary = salary;
        self.theProfessor.tenure = tenure;
        self.theProfessor.department = department;
        self.theProfessor.isStudent = status;
        
        // Inserts the new teacher into the list
        bool success = [self.students insert: (self.students.size + 1) andData: self.theProfessor];
        
        
        // Display results of the request
        
        if (success) {
            title = @"Success!";
            msg = @"Professor Added!";
            self.firstName.text = @"";
            self.lastName.text = @"";
            self.idField.text = @"";
            self.departmentField.text = @"";
            [self.tenureSwitch setOn:YES animated:YES];
            [self.professorSlider setValue:55000 animated:YES];
            self.professorSliderLabel.text = @"55000";
            
        } else {
            title = @"Failure!";
            msg = @"Professor not added...";
        }
        self.theProfessor = [[Professor alloc] init]; // Have to clear so that head is no longer pointing at theProfessor
        
        
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Okay"
                              otherButtonTitles:nil];
        [alert show];
    }

        
}

@end
