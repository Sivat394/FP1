#lang racket

(require spin-master)
(require web-server/http/request-structs)
(require web-server/http/bindings)
(require json)
(require net/url)

(define blueline (string->url "https://www.uml.edu/api/Transportation/RoadsterRoutes/BusesOnLine/?apiKey=87C6ACB0-C2A4-460A-AAF2-9493BAA3917B&lineId=1"))
(define redline  (string->url "https://www.uml.edu/api/Transportation/RoadsterRoutes/BusesOnLine/?apiKey=87C6ACB0-C2A4-460A-AAF2-9493BAA3917B&lineId=2"))
(define redport (get-pure-port redline))
(define blueport (get-pure-port blueline))

(newline)
(define redJSON (bytes->string/utf-8 (port->bytes redport)))

(define (requestJSON req) (bytes->string/utf-8 (request-post-data/raw req)))

(define (check_content req) (extract-binding/single 'content-type (request-headers req)))

(define (post_response req) (if (equal? (check_content req) "application/json")
                                (jsexpr->string (requestJSON req))
                                (jsexpr->string redJSON)
                                )
  )

(post "/"
  (lambda (req) (post_response req)))


(run)