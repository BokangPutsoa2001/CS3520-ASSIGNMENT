#include <stdio.h>
#include <math.h>
#include <stdbool.h>



int isPrime(int);  //funtion to check for prime numbers
int isNotpalindrome(int); //function to check for non palindrome numbers
int sqReverse(int);//function to check for the reverses of the prime squares

int main(){
	int not_palindrome1;
	int not_palindrome2;
	int rprime;
	int prime;
	int k; //prime square number
	int r; //reverse of prime square number
	int root1;
	int root2;
	
	
	
	
	for (int i=13;i<10000;i++){							//13 is a factor of the first reversible prime square number, initiated  with it to reduce program running time
		prime = isPrime(i);								//to check whether i is prime by calling thr isPrime function
						
		if(prime){
			k=pow(i,2);								//all prime numbers between 13 and 100000 are squared
		    if(r = sqReverse(k)){				//used to find the reverse of the square numbers of the prime numbers
				
				not_palindrome1 = isNotpalindrome(k);   //to check whether k and r are not palindromes
				not_palindrome2 = isNotpalindrome(r);
			
					if(not_palindrome1 && not_palindrome2){
						root1 = sqrt(k);					//finding the square roots of k and r
						root2= sqrt(r);
						
						if(root2 == sqReverse(root1)){  		//the roots of r and k are also reverse numbers of each other
							rprime = isPrime(root2);			//checking  whether the reverse of the prime squares have roots which are prime numbers
							
							if(rprime){
								if(i==101){						//excluding 101 as its sqaure is not a palindrome
									continue;
									
								}
								else
									printf("%d \n",k);
									k++;					//printing out all the reversible prime sqaures
							}
						}
						
					
						}
						}
		
					
							
					
						}	
							
							
				}
						
				
							

	
	return 0;
}
int isPrime(int num){
	int prime = true;
	
	if(num==0 || num==1){
			
		prime=false;		// 0 and 1 are not prime numbers
	}
	for (int n=2;n<=num/2; ++n){
		if(num%n==0){			//prime numbers are only divisible by one and itself.
			prime=false;
		}
      	}
	return prime;
}

int isNotpalindrome(int i){
	int rev = 0;
	
	
	for (int n=i; n>0;n/=10){
		rev=rev*10+n%10;
		return(i!=rev);
	}
}

int sqReverse(int n){
	
	int reverse=0;
	int remainder=0;
	
	
	
	while(n != 0){
		remainder=n%10;
		reverse= (reverse*10) + remainder;
		n= n/10;
		
	}
	return reverse;
}


