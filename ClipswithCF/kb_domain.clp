; =====================================================
; kb_domain.clp - Templates
; LOAD FIRST!
; =====================================================

; Known facts with CF
(deftemplate known
  (slot id (type SYMBOL))
  (slot cf (type FLOAT) (default 0.0))
)

; Track which rules have fired
(deftemplate rule-fired
  (slot id (type SYMBOL))
)

; IO proxy for C# communication
(deftemplate ioproxy
  (multislot messages)
  (multislot answers)
)

; User answer from C#
(deftemplate answer
  (slot cf (type FLOAT) (default 0.0))
)

; Clear messages flag
(deftemplate clearmessage)

