#include <iostream>

using namespace std;

int main(){
	cout << "5-digit numbers that reverse digit order when multiplied by 4: " << endl;

	for (int n=10000; n%10!=0 || n<25000; n++){ //limit sweep to 5-digit numbers that when *4, exclude all numbers%10==0 (as they are not 5-digit numbers when reversed)
		
		int digits[5]; //will represent 5 digits of number 
		int num_copy = n; //copy number so we can break it up into digits

		for (int i=0; i<5; i++){
			digits[i] = num_copy % 10;
			num_copy /= 10;
		}

		// equation_result is algebraic solution of digits of the equation:
		//   4*[abcde] - edcba = 0
		//	 where abcde = 10^4*a + 10^3*b + 10^2*c + 10^1*d + 10^0*e
		//   and edcba is the same, with the letters in reverse order
		int equation_result = 39999*digits[4] + 3990*digits[3] + 300*digits[2] - 960*digits[1] - 9996*digits[0];

		if (equation_result == 0){
			cout << n << endl;
		}
	}

	return 0;
}


