#include <iostream>
#include <cmath>

using namespace std ;

double fun(double x) {
/*  Defines the function to be used in calculation.
*/
     
    return exp(-1 * pow(x, 2)) ;
}

double trap(double (*f)(double), double x1, double x2) {
/*  Given a function and two x values, estimates the area under the curve between the values using the trapezoidal rule.
    Functions as dA (small change in area)
*/   
    return 0.5 * (x2 - x1) * (f(x1) + f(x2)) ;
}

int main() {
    const double a = 1 ; //integral limit (lower)
    const double b = 2 ; //integral limit (upper)    

    double total_area = 0 ; //aggregator for the area under curve
    double current_x = a ;  //initialize starting x at lower integralmlimit
    double step = 0.01 ;    //step size

    do {
        total_area += trap(fun, current_x, current_x + step) ; //add the small trapezoid area to the total area
        current_x += step ;                                    //increment x by the step size
    } while(current_x < b) ;                                   //go until you get to the upper limit of integration

    cout << "Estimated area with step size h = " << step << ": " << total_area << endl ;

    return 0 ;
}