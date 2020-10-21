	PROGRAM lockerLocator
	IMPLICIT NONE

	INTEGER :: num, FirstDigit, FourthDigit
	
	!Prompt and read user input into num
	print *, 'Hat size?'
	read *, num

	!Print the processed digits
	print *, 'Use', firstDigit (num), fourthDigit (num)			

	END PROGRAM lockerLocator

!Subprogram to retrieve the first digit of the number
	INTEGER FUNCTION FirstDigit (number)
		IMPLICIT NONE
		INTEGER, INTENT(IN) :: number
		
		!Mod 10 isolates the first digit
		FirstDigit = mod(number, 10)
	END FUNCTION FirstDigit

!Subprogram to retrieve the fourth digit of the number
	INTEGER FUNCTION FourthDigit (number)
		IMPLICIT NONE
		INTEGER, INTENT(IN) :: number
		INTEGER :: counter, tempNumber
		
		!Copy the number into temp so it can be manipulated
		tempNumber = number
		
		!Divide by 10 three times to shift the fourth digit to the first position
		DO counter = 1, 3, 1
			tempNumber = tempNumber / 10
		END DO

		!Mod 10 isolates the first digit
		FourthDigit = mod(tempNumber, 10)
	END FUNCTION FourthDigit
