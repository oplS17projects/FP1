#lang racket
(require web-server/servlet
         web-server/servlet-env)

(define (start req)
  (response/xexpr
   `(html (head (title "OPL"))
          (body (p "This is a test page for our Racket servlet")))))
 
(serve/servlet start
               #:port 49172
               #:listen-ip #f  ;; accept connections from external machines
               #:servlet-path ""
               #:ssl? #f  ;; turn SSL off for the time being
               ;#:server-root-path  ;; misleading, requires configuration files for our server
               #:extra-files-paths
               (list
                (build-path "/Users/josh")))


               
               