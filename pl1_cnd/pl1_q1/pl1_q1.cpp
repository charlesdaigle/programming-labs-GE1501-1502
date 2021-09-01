#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    cout << setiosflags(ios_base::fixed) // do not use E notation
         << setiosflags(ios_base::showpoint) // always show decimal point
         << setprecision(2); // rounded to 2 decimal places
    double x1, y1, x2, y2;
    double slope = 0;
    double y_intercept = 0;
	while(1){
	// user input for variables
		cout << "Enter the (x,y) coordinates of point 1 as \"x y\":";
		cin >> x1 >> y1;
		cout << "Enter the (x,y) coordinates of point 2 as \"x y\":";
		cin >> x2 >> y2;
	// check if the points overlap
		if (x1 == x2 && y1 == y2){
			cout << "Alert! These points do not form a line (singular)." << endl;
		}
	// check if x-coords equal (vertical line)
		else if (x1 == x2){
			cout << "Alert! These points form a vertical line (undefined slope)." << endl;
			cout << "The slope-intercept form is x = " << x1 << endl;
		}
	// check if y-coords equal (horizontal line)
		else if (y1 == y2){
			cout << "Alert! These points form a horizontal line (zero slope)." << endl;
			cout << "The slope-intercept form is y = " <<  y1 << endl;
		}
	// base case
		else{
		// calculate slope and y-intercepts
			slope = (y2 - y1) / (x2 - x1); //slope formula
			y_intercept = y1 - slope * x1; //algebraically rearrange slope-intercept, plug in (x1,y1) and slope to solve for y_intercept
		// output slope
			cout << "The slope of the line: " << slope << endl;
		// if unit slope, simply write "x" (standard notation)
			if (slope == 1){
				cout << "The slope-intercept form is y = x";
			}
		// if not unit slope, write slope as number
			else{
				cout << "The slope-intercept form is y = " << slope << "x";
			}
		// only display y-intercept if it's not zero
			if (y_intercept != 0){
			cout << " + " << y_intercept << endl;
		}
		else{
			cout << endl; //if there's no y-intercept, simply line break and end the program
		}
		}
	
		cout << endl; //add a line break before asking for a new set of points	
	}
	
    return 0;

}
