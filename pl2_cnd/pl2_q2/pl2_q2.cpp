#include <iostream>
#include <cmath>

using namespace std;

bool isPrime(int num){

// Checks if a number is prime.

	if (num == 1){ 
		return false; // special case
	}
	else{
		for (int i=2; i<=ceil(sqrt(num)); i++){ //only check factors up until the square root of the number to avoid repeating
			if (num % i == 0){
				return false;
			}
		}
		
		return true; //if the loop ends without finding a factor, the number is prime
	}
}

int main(){
	const int MAX_NUM = 1000;

	int twin_prime_count = 0;

	for (int i=1; i<=MAX_NUM; i++){ 		
		if ( isPrime(i) && isPrime(i + 2) ){
			twin_prime_count++;
			cout << i << " and " << i+2 << endl;
		}
	}
	
	cout << "The total number of twin primes below " << MAX_NUM << " is " << twin_prime_count << endl ;

	return 0;
}
