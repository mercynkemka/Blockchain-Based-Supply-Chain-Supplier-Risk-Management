;; Risk Manager Verification Contract
;; Validates and manages supply chain risk managers

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_VERIFIED (err u101))
(define-constant ERR_NOT_FOUND (err u102))
(define-constant ERR_INVALID_STATUS (err u103))

;; Data structures
(define-map risk-managers
  principal
  {
    verified: bool,
    verification-date: uint,
    credentials: (string-ascii 100),
    status: (string-ascii 20)
  }
)

(define-map verification-requests
  uint
  {
    manager: principal,
    credentials: (string-ascii 100),
    requested-at: uint,
    status: (string-ascii 20)
  }
)

(define-data-var next-request-id uint u1)

;; Public functions
(define-public (request-verification (credentials (string-ascii 100)))
  (let ((request-id (var-get next-request-id)))
    (map-set verification-requests request-id {
      manager: tx-sender,
      credentials: credentials,
      requested-at: block-height,
      status: "pending"
    })
    (var-set next-request-id (+ request-id u1))
    (ok request-id)
  )
)

(define-public (verify-manager (manager principal) (credentials (string-ascii 100)))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-none (map-get? risk-managers manager)) ERR_ALREADY_VERIFIED)
    (map-set risk-managers manager {
      verified: true,
      verification-date: block-height,
      credentials: credentials,
      status: "active"
    })
    (ok true)
  )
)

(define-public (revoke-verification (manager principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (match (map-get? risk-managers manager)
      manager-data (begin
        (map-set risk-managers manager (merge manager-data { verified: false, status: "revoked" }))
        (ok true)
      )
      ERR_NOT_FOUND
    )
  )
)

;; Read-only functions
(define-read-only (is-verified-manager (manager principal))
  (match (map-get? risk-managers manager)
    manager-data (get verified manager-data)
    false
  )
)

(define-read-only (get-manager-info (manager principal))
  (map-get? risk-managers manager)
)

(define-read-only (get-verification-request (request-id uint))
  (map-get? verification-requests request-id)
)
