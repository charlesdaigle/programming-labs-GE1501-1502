#include <iostream>

using namespace std;

void hline(int size){
// Writes a horizontal line of given size (with a line break after)
	for (int i=0; i<size; i++){
		cout << "*" ;
	}
	cout << endl ;
}

int main(){
	
	int rows; //user input

	cout << "Please enter the number of rows: " ;
	cin >> rows;
	cout << endl << endl; //make space for the pattern

	hline(rows); //top of square (first row)

	for (int i=1; i<rows-1; i++){ //start at 1 because we count the horizontal line as a row (row 0)
		for (int j=0; j<rows; j++){
			if ( j==0 || j==rows-1 || j==i || j==rows-1-i){ 
				//print star if...
				//... position is at either edge (j==0, j==rows-1)
				//... position is on either diagonal (j==i, j==rows-1-i)
				cout << "*" ;
			}
			else{ 
				cout << " " ; //otherwise print empty space
			}
		}
		cout << endl ; //go to next line
	}
	
	hline(rows); //cap it off with the last line

	return 0;
}
