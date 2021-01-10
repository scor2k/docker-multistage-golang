package main

import (
	"encoding/json"
	"net/http"
)

type healthCheck struct {
	Application string
	Version     string
	Status      bool
}

func healthCheckHTTP(w http.ResponseWriter, req *http.Request) {
	res := healthCheck{"docker-multistage-golang", "0.1.0", true}

	jres, err := json.Marshal(res)
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(jres)
}

func main() {
	http.HandleFunc("/health/check", healthCheckHTTP)
	http.ListenAndServe(":8080", nil)
}
