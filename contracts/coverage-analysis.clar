;; Coverage Analysis Contract
;; Analyzes territory coverage and identifies gaps

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u300))
(define-constant ERR_COVERAGE_NOT_FOUND (err u301))
(define-constant ERR_INVALID_COVERAGE (err u302))

;; Coverage data structure
(define-map territory-coverage
  { territory-id: uint }
  {
    total-accounts: uint,
    active-accounts: uint,
    coverage-percentage: uint,
    gap-areas: uint,
    last-analyzed: uint
  }
)

(define-map coverage-gaps
  { gap-id: uint }
  {
    territory-id: uint,
    area-name: (string-ascii 50),
    potential-accounts: uint,
    priority-level: uint,
    identified-date: uint
  }
)

(define-data-var next-gap-id uint u1)

;; Public functions
(define-public (analyze-coverage (territory-id uint) (total-accounts uint) (active-accounts uint))
  (begin
    (asserts! (<= active-accounts total-accounts) ERR_INVALID_COVERAGE)
    (let (
      (coverage-percentage (if (> total-accounts u0) (/ (* active-accounts u100) total-accounts) u0))
      (gap-areas (if (< coverage-percentage u80) u1 u0))
    )
      (map-set territory-coverage
        { territory-id: territory-id }
        {
          total-accounts: total-accounts,
          active-accounts: active-accounts,
          coverage-percentage: coverage-percentage,
          gap-areas: gap-areas,
          last-analyzed: block-height
        }
      )
      (ok coverage-percentage)
    )
  )
)

(define-public (identify-coverage-gap
  (territory-id uint)
  (area-name (string-ascii 50))
  (potential-accounts uint)
  (priority-level uint))
  (let ((gap-id (var-get next-gap-id)))
    (asserts! (<= priority-level u3) ERR_INVALID_COVERAGE)
    (map-set coverage-gaps
      { gap-id: gap-id }
      {
        territory-id: territory-id,
        area-name: area-name,
        potential-accounts: potential-accounts,
        priority-level: priority-level,
        identified-date: block-height
      }
    )
    (var-set next-gap-id (+ gap-id u1))
    (ok gap-id)
  )
)

(define-public (update-coverage-status (territory-id uint) (new-active-accounts uint))
  (match (map-get? territory-coverage { territory-id: territory-id })
    coverage-data
    (let (
      (total-accounts (get total-accounts coverage-data))
      (coverage-percentage (if (> total-accounts u0) (/ (* new-active-accounts u100) total-accounts) u0))
      (gap-areas (if (< coverage-percentage u80) u1 u0))
    )
      (map-set territory-coverage
        { territory-id: territory-id }
        (merge coverage-data {
          active-accounts: new-active-accounts,
          coverage-percentage: coverage-percentage,
          gap-areas: gap-areas,
          last-analyzed: block-height
        })
      )
      (ok coverage-percentage)
    )
    ERR_COVERAGE_NOT_FOUND
  )
)

;; Read-only functions
(define-read-only (get-coverage-analysis (territory-id uint))
  (map-get? territory-coverage { territory-id: territory-id })
)

(define-read-only (get-coverage-gap (gap-id uint))
  (map-get? coverage-gaps { gap-id: gap-id })
)

(define-read-only (calculate-coverage-score (active-accounts uint) (total-accounts uint))
  (if (> total-accounts u0)
    (/ (* active-accounts u100) total-accounts)
    u0
  )
)
