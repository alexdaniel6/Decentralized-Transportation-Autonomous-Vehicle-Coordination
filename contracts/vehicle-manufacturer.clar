;; Vehicle Manufacturer Verification Contract
;; This contract validates autonomous vehicle manufacturers

(define-data-var contract-owner principal tx-sender)

;; Map to store verified manufacturers
(define-map verified-manufacturers principal bool)

;; Map to store manufacturer details
(define-map manufacturer-details
  principal
  {
    name: (string-ascii 100),
    verification-date: uint,
    certification-id: (string-ascii 50)
  }
)

;; Map to track vehicles by manufacturer
(define-map manufacturer-vehicles
  { manufacturer: principal, vehicle-id: (string-ascii 50) }
  bool
)

;; Public function to verify a manufacturer
(define-public (verify-manufacturer (manufacturer principal) (name (string-ascii 100)) (certification-id (string-ascii 50)))
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u1)) ;; Only contract owner can verify
    (map-set verified-manufacturers manufacturer true)
    (map-set manufacturer-details
      manufacturer
      {
        name: name,
        verification-date: block-height,
        certification-id: certification-id
      }
    )
    (ok true)
  )
)

;; Public function to revoke manufacturer verification
(define-public (revoke-manufacturer (manufacturer principal))
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u1)) ;; Only contract owner can revoke
    (map-delete verified-manufacturers manufacturer)
    (map-delete manufacturer-details manufacturer)
    (ok true)
  )
)

;; Public function for manufacturers to register their vehicles
(define-public (register-vehicle (vehicle-id (string-ascii 50)))
  (begin
    (asserts! (default-to false (map-get? verified-manufacturers tx-sender)) (err u2)) ;; Only verified manufacturers
    (map-set manufacturer-vehicles { manufacturer: tx-sender, vehicle-id: vehicle-id } true)
    (ok true)
  )
)

;; Read-only function to check if a manufacturer is verified
(define-read-only (is-verified-manufacturer (manufacturer principal))
  (default-to false (map-get? verified-manufacturers manufacturer))
)

;; Read-only function to check if a vehicle is registered by a verified manufacturer
(define-read-only (is-verified-vehicle (manufacturer principal) (vehicle-id (string-ascii 50)))
  (and
    (is-verified-manufacturer manufacturer)
    (default-to false (map-get? manufacturer-vehicles { manufacturer: manufacturer, vehicle-id: vehicle-id }))
  )
)

;; Read-only function to get manufacturer details
(define-read-only (get-manufacturer-details (manufacturer principal))
  (map-get? manufacturer-details manufacturer)
)

;; Initialize contract
(begin
  (var-set contract-owner tx-sender)
)
