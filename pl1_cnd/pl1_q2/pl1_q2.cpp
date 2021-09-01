#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    cout << setiosflags(ios_base::fixed) // do not use E notation
         << setiosflags(ios_base::showpoint) // always show decimal point
         << setprecision(3); // rounded to 2 decimal places
// set all atomic weights as constants with double precision
    const double weight_oxygen =   15.9994;
    const double weight_carbon =   12.011;
    const double weight_nitrogen = 14.00674;
    const double weight_sulfur =   32.066;
    const double weight_hydrogen = 1.00794;
    int atoms_oxygen, atoms_carbon, atoms_nitrogen, atoms_sulfur, atoms_hydrogen;
    double amino_acid_weight;
// user prompts and inputs
    cout << "Please enter the number of atoms of the following elements (non-negative numbers only):" << endl;
    do{
        cout << "Oxygen:   ";
	cin >> atoms_oxygen;
    }while (atoms_oxygen <= 0);
    do{
        cout << "Carbon:   ";
	cin >> atoms_carbon;
    }while (atoms_carbon <= 0);
    do{
        cout << "Nitrogen: ";
	cin >> atoms_nitrogen;
    }while (atoms_nitrogen <= 0);
    do{
        cout << "Sulfur:   ";
	cin >> atoms_sulfur;
    }while (atoms_sulfur <= 0);
    do{
        cout << "Hydrogen: ";
	cin >> atoms_hydrogen;
    }while (atoms_hydrogen <= 0);
/*
    cout << "Oxygen:   ";
    cin >> atoms_oxygen;
    cout << "Carbon:   ";
    cin >> atoms_carbon;
    cout << "Nitrogen: ";
    cin >> atoms_nitrogen;
    cout << "Sulfur:   ";
    cin >> atoms_sulfur;
    cout << "Hydrogen: ";
    cin >> atoms_hydrogen;
    */
// calculate weight of amino acid by multiplying the weight of each atom by the number in the acid
    amino_acid_weight = weight_oxygen * atoms_oxygen +
                        weight_carbon * atoms_carbon +
                        weight_nitrogen * atoms_nitrogen +
                        weight_sulfur * atoms_sulfur +
                        weight_hydrogen * atoms_hydrogen;
// output total weight
    cout << "The weight of this amino acid is " << amino_acid_weight << " amu (atomic mass units)." << endl; 

    return 0;
}
