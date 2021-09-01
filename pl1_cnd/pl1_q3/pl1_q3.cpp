#include <iostream>
#include <iomanip>
#include <cmath>

using namespace std;

int main(){
    int num_to_reverse;
    double sqrt_num_to_reverse;
    int reversed_num = 0;
    double sqrt_reversed_num;

    cout << "Please enter any positive integer of up to 5 digits: ";
    do{
    
        cin >> num_to_reverse;
        if (num_to_reverse <= 0){
            cout << "Invalid entry. Please ensure you entered a positive number and try again: ";
        }
        else if (num_to_reverse > 99999){
            cout << "Invalid entry. Please ensure your number is 5 digits or fewer: ";
        }
    }while (num_to_reverse <=0 || num_to_reverse > 99999);

    sqrt_num_to_reverse = sqrt(num_to_reverse);
    int n = num_to_reverse; //duplicate num_to_reverse as "n" changes to calculate the reversed number
// iterate over the number from right to left, extracting rightmost digit and multiplying by 10 repeatedly to leave room for the next digit
// effectively treats number as serial data where:
//      - *10  moves the number to the left
//      - %10  extracts the current rightmost digit
//      - "+"  stores the extracted digit in memory
//      - /=10 moves the number to the right (deleting the rightmost digit) 
    while (n != 0){
        reversed_num = reversed_num*10 + n%10;
        n /= 10; //repeatedly dividing loop var. by 10 ensures the loop terminates  
    }
    sqrt_reversed_num = sqrt(reversed_num);

// output all three calculated numbers (square root, reversed, and square root of the reverse)
    cout << "The square root of " << num_to_reverse << " is: " << sqrt_num_to_reverse << endl;
    cout << "The number in reverse is: " << reversed_num << endl;
    cout << "The square root of " << reversed_num << " is " << sqrt_reversed_num << endl;
    
    return 0;
}
