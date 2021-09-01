#include <iostream>
#include <tuple>
#include <cmath>

using namespace std ;

double apply_f(double (*f)(double,double), tuple<double, double> point) {
/*	Applies a function that takes two arguments. 
*/
    return (*f)(get<0>(point), get<1>(point)) ;
}

double diff_equation(double x, double y) { 
/*	Defines the differential equation to be estimated.
*/
	return x + 3*y/x ;
}

double exact_solution(double x) { 
/*	Defines the exact general solution to the differential equation.
*/
	return 2 * pow(x, 3) - pow(x, 2) ;
}

tuple<double, double> estimate_y(double (*f)(double,double), tuple<double, double> init_point, double step) {
/*	Returns the tuple (x_i+1, y_i+1) estimated by one iteration of Euler's method, starting at init_point.	
*/	
	tuple<double,double> point_estimate (make_tuple(0, 0)) ; //initialize the point estimate

	get<0>(point_estimate) = get<0>(init_point) + step ;						//find x_i+1
	get<1>(point_estimate) = get<1>(init_point) + step*apply_f(f, init_point) ; //find y_i+1 [f(x_i+1)]

	return point_estimate ;
}

int main() {
	
	double step = 0.1 ;   //step size
	double x_final = 2.5; //x value of the function value to be estimated

	tuple<double,double> x0y0 (make_tuple(1, 1)) ; 	  //starting point
	tuple<double,double> xiyi (x0y0); 				  //initialize the first iteration to the starting point

	do {
		xiyi = estimate_y(diff_equation, xiyi, step); //reassign xiyi to the estimate using itself as the input
	} while( get<0>(xiyi) <= x_final ) ; 			  //go until you get to the final x value

	double exact = exact_solution(x_final) ;

	cout << "For x = " << get<0>(xiyi) << " , Euler's method estimates that y = " << get<1>(xiyi) << endl;
	cout << "For x = " << get<0>(xiyi) << " , the exact solution finds that y = " << exact << endl;
	
	return 0;
}
