#include <iostream>
#include <iomanip>

using namespace std;

int main(){
	cout << setiosflags(ios_base::fixed) //do not use E notation
		 << setiosflags(ios_base::showpoint) //always show decimal point
		 << setprecision(2); //rounded to 2 decimal places

// set low and high bound as constants with double precision
	const double F_LOW_BOUND = 0;
	const double F_HI_BOUND = 200;
	
	double increment;
	double current_temp = F_LOW_BOUND; //initialize to first temperature
	double K; //use as temp variable during loop

//user prompted to enter increment size
	cout << "Please enter the temperature increment between lines (in degrees Fahrenheit): "; 
	cin >> increment;
	
	cout << setw(10) << "F" << setw(10) << setfill(' ') << "C" << endl;

	do{
		K = (current_temp - 32) * 5/9 + 273.15;
		cout << setw(10) << current_temp << setw(10) << K << endl;
		current_temp += increment;
	} while(current_temp <= F_HI_BOUND); //continue while the current temp is lower than the hi bound
	
	
	return 0;
}
