package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/test", handler)
	http.ListenAndServe(":8068", nil)
}

func handler(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintf(w, "hello worldsed\n")
}
