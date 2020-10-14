#include <iostream>
using namespace std;

int main(){
    int sum = 0;
    int number_even = 0;
    int current_number;

    for (int i=10000; i<100000; i++){
	current_number = i; //duplicate to maintain loop variable
	while (current_number > 0){ //using %10, extract digits from current_number and add to sum
	    sum += current_number % 10;
	    current_number /= 10; //shift digits to the right
	}
	if (sum % 2 == 0){
	    number_even++; //if sum of current number is even, count it towards the total
	}
	sum = 0; //reset the sum before the next iteration
    }

    cout << "There are " << number_even << " 5-digit numbers whose digits sum to an even number." << endl;

    return 0;
}

