package main

import ("fmt"
	"os"
	"bufio"
	"regexp"
)

//Error check
func errorCheck(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	//Get file name from CLI
	fileName := os.Args[1]

	//Pass file name to readFile()
	inputText, err := readFile(fileName)
	errorCheck(err)

	//Pass lines to parseText()
	parsedText := parseText(inputText)

	//Get output file name from user
	var outFileName string
	fmt.Println("Output file name:")
	fmt.Scanln(&outFileName)

	//Send file name and text to writeOutput()
	writeOutput(outFileName, parsedText)
}

//Reads lines from the given file
func readFile(name string) ([]string, error) {
	//Open the file
	file, err := os.Open(name)

	//Create scanner
	scanner := bufio.NewScanner(file)
	var lines []string

	//Scan each line
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	//Close scanner and return lines
	err = scanner.Err()
	file.Close()
	return lines, err
}

//Removes numbers from the given strings
func parseText(lines []string) ([]string) {
	//Create regexp pattern
	reg, err := regexp.Compile("[^a-zA-Z\" ]+")
	errorCheck(err)

	//Replace the pattern in each line in lines[]
	for i := 0; i < len(lines); i++ {
		lines[i] = reg.ReplaceAllString(lines[i], "")
	}

	//return parsed lines
	return lines
}

//Creates an output file with the given strings
func writeOutput(fileName string, lines []string) {
	//Create output file
	file, err := os.Create(fileName)
	errorCheck(err)
	defer file.Close()

	//Write each line to the file
	for i := range lines {
		file.WriteString(lines[i] + "\n")
	}

	//Close output file
	file.Sync()
}
