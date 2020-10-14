#include <iostream>

using namespace std;

int main(){
	
	int reversed_num;
	int num_copy; //will be used to store a copy of each number that can be modified (so we can reverse it)
	
	cout << "5-digit numbers that reverse digit order when multiplied by 4: " << endl;

	for (int num=10000; num<25000; ++num){ //limit to 5-digit numbers that are still 5-digit when multiplied by 41
		
		reversed_num = 0;
		num_copy = num;
		
	// similar reversing algorithm to problem 3
		while (num_copy != 0){
			reversed_num = reversed_num*10 + num_copy%10;
			num_copy /= 10;
		}
	// output the number if the number*4 is equal to the reversed digit form 
		if (num*4 == reversed_num){
			cout << num << endl;
		}
	}
	

	return 0;
}
