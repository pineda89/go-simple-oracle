package main

import (
	"database/sql"
	"fmt"
	_ "github.com/pineda89/go-oci8"
	"os"
	"strings"
)

var DRIVER = "oci8"
var AL_DATA_SOURCES = os.Getenv("AL_DATA_SOURCES")

func main() {
	fmt.Println("AL_DATA_SOURCES", AL_DATA_SOURCES)

	db, err := sql.Open(DRIVER, strings.Split(AL_DATA_SOURCES, ">>")[1])
	checkErr(err)

	fmt.Println("Ping:", db.Ping())

	var res string
	fmt.Println(db.QueryRow("SELECT 4+4 FROM DUAL").Scan(&res))
	fmt.Println("res:", res)
}

func checkErr(err error) {
	if err != nil {
		panic(err)
	}
}
