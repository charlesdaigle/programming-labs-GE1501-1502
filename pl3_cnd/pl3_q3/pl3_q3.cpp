#include <iostream>
#include <cmath>

using namespace std ;

double factorial(double x) {
/*  Computes the factorial of a number.
*/
    if (x == 1 || x == 0) {
        return 1 ;
    }
    else {
        return x * factorial(x - 1) ;
    }
}

double fun(double x, int current_iter) {
/*  Defines the recurring term that approximates cosine (the argument of the summation). 
*/
    return pow(-1, current_iter) * pow(x, 2*current_iter) / factorial(2*current_iter) ;
}

int main() {
    const int iters = 2 ;      //number of iterations (number of terms summed)
    double current_value = 0 ; //aggregator for the sum of terms
    double x ;                 //angle (user input)

    cout << "Please enter a value for angle x (in radians): " ;
    cin >> x ;

    double actual_value = cos(x) ;      //calculate the actual value of cos(x)

    for (int i = 0 ; i < iters ; i++) {
        current_value += fun(x, i) ;    //add each term to the total sum
    }

    cout << "The estimated value of cos(x) is " << current_value  << endl ;
    cout << "The actual value of cos(x) is " << actual_value << endl ;

}