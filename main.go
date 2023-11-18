package main

import (
	"net/http"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

var (
	counter = prometheus.NewCounter(prometheus.CounterOpts{
		Name: "requests_total",
		Help: "Total number of requests",
	})
)

func init() {
	prometheus.MustRegister(counter)
}

func handler(w http.ResponseWriter, r *http.Request) {
	counter.Inc()
	w.Write([]byte("Hello, world!\n"))
}

func main() {
	http.Handle("/metrics", promhttp.Handler())
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
