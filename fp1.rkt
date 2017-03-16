#lang racket

(require spin-master)
(require web-server/http/request-structs)
(require web-server/http/bindings)
(require json)


(define (requestJSON req) (bytes->string/utf-8 (request-post-data/raw req)))

(define (check_content req) (extract-binding/single 'content-type (request-headers req)))

(define (post_response req) (if (equal? (check_content req) "application/json")
                                (jsexpr->string (requestJSON req))
                                "lol not json"
                                )
  )

(post "/"
  (lambda (req) (post_response req)))


(run)