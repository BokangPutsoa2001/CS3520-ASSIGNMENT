#===============================================================
#@author: bokang grace putsoa
#@purpose: to print out the first ten reversib;e prime squares
#@contacts: bokangputsoa0611@gmail.com
#@date: 08/10/2022
#===============================================================
#HIGH LEVEL MODEL:
#
#main() {
#	int not_palindrome1;
#	int not_palindrome2;
#	int prime;
#	int k; //prime square number
#	int r; //reverse of prime square number
#	int root1;
#	int root2;
#	
#	
#	
#	for (int i=13;i<10000;i++){
#						
#		if(prime){
#			k=pow(i,2);
#			not_palindrome1 = isNotpalindrome(k);
#				not_palindrome2 = isNotpalindrome(r);
#			
#						root1 = sqrt(k);
#						root2= sqrt(r);
#						
#						if(root2 == sqReverse(root1)){
#							rprime = isPrime(root2);
#							
#								if(i==101){
#									continue;
#									
#								}
#								else
#									printf("%d \n",k);
#									k++;
#						}
#					
#						}
#						}
#		
#					
#							
#							
#							
#}
#						
#				
#							
#	
#	return 0;
#}
#=======================================================================================\
#$s0=num
#$s1=temp
#$s2=rev
#$s3= prime
#$s4= n
#$s5=2
#
#
#
#
#
#
#
#==========================================================================================


.data
 	n:       .word 2

.text

	
	

setup:
	li $s0,13		#num = 13 is the root of the first reversible prime square
	la $s4, n		#$s4=2
	li $s5,2
	li $t2, 10
	
IF1:
	div $s0,$s5 		#divide the value in $s0=13 by the value in $s5=2
	mfhi $s1		#$s1 = remainder
	mflo $s7		#$s7 = quotient
	addi $s7,$s7, 1		
	beq  $s1, $zero,NotPrime		#if the number in $s0 can be divided by two and leave remainder zero, then it is not prime
	addi $s5,$s5 ,1  #if the number in $s0 is not divisible by two then we increment the number in $s5 by1 , to check whether any number can divide it until we reach the number in $s0
	beq $s5 , $s7, Prime #if the quotient is equal to the divider,then it is pime
	j IF1
	
NotPrime: 
	addi $s0, $s0,1
	j IF1
	
Prime:

	mult $s0,$s0		#having found the prime numbers we square them
	mflo $t3			#$t3=pow($s0,2)

Palindrome:
	div $t3,$t2		#divide pow($s0,2) by 10
	mflo $t4		# $t4= quotient
	mfhi $t1		#$t1= remainder
	mult $t0,$t2	   #$t0= reverse
	mflo $t0
	add $t0, $t0, $t1	#add the remainder to the reverse
	div $t3,$t2		
	mflo $t3
	beq $t4,0 , Reversing    # if $t4=0, branch to Reversing
	j Palindrome 
	
	
Reversing: 
	move $t0,$t7
	mult $t6,$t2
	mflo $t6
	div $t7,$t2
	mfhi $t8
	add $t6,$t8,$t6
	div $t7,$t2
	mflo $t7
	blt $t7,$t5, AlmostTheEnd
	j Reversing
	
AlmostTheEnd:
	beq $t3,$t6, main
	
main: 
	move $a0,$t3
	
	li $v0,10
	syscall
	
