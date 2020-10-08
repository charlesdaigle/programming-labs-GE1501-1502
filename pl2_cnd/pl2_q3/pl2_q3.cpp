#include <iostream>

using namespace std ;

int main(){
	for (int i=1; i<=10; i++){ //controls each vertical line

// first triangle
		for (int j=10; j>=i; j--){ //spaces
			cout << " " ;
		}
		for (int k=1; k<=i; k++){ //asterisks
			cout << "*" ;
		}
		cout << " " ; //space between triangles

// second triangle
		for (int l=10; l>=i; l--){ //asterisks
			cout << "*" ;
		}
		for (int m=1; m<=i; m++){ //spaces (including between triangles)
			cout << " " ;
		}

// third triangle
		for (int n=1; n<=i; n++){
			cout << " " ;
		}
		for (int o=10; o>=i; o--){
			cout << "*" ;
		}
		cout << " " ; //space between triangles
// fourth triangle
		for (int p=1; p<=i; p++){
			cout << "*" ;
		}
	
		cout << endl ; //after you're done, go to next line
	}
	
	return 0;
}
