; =====================================================
; dialog.clp - User dialog (30 questions)
; LOAD SECOND after kb_domain.clp
; =====================================================

(deffacts start-dialog
  (ioproxy (messages) (answers))
  (stage f1)
)

(defrule clear-messages
   (declare (salience 100))
   ?c <- (clearmessage)
   ?io <- (ioproxy)
 =>
   (retract ?c)
   (modify ?io (messages) (answers)))

; ===== INTERESTS (f1-f15) =====

(defrule ask-f1
   ?io <- (ioproxy)
   (stage f1)
 =>
   (modify ?io (messages "Vas interesyet programmirovanie?") (answers "da" "net" "ne znau")))

(defrule answer-f1
   ?a <- (answer (cf ?c))
   ?s <- (stage f1)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f1) (cf ?c))))
   (assert (stage f2) (clearmessage)))

(defrule ask-f2
   ?io <- (ioproxy)
   (stage f2)
 =>
   (modify ?io (messages "Vas interesyet rabota s dannymi i analitika?") (answers "da" "net" "ne znau")))

(defrule answer-f2
   ?a <- (answer (cf ?c))
   ?s <- (stage f2)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f2) (cf ?c))))
   (assert (stage f3) (clearmessage)))

(defrule ask-f3
   ?io <- (ioproxy)
   (stage f3)
 =>
   (modify ?io (messages "Vas interesyet sistemnoe administrirovanie?") (answers "da" "net" "ne znau")))

(defrule answer-f3
   ?a <- (answer (cf ?c))
   ?s <- (stage f3)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f3) (cf ?c))))
   (assert (stage f4) (clearmessage)))

(defrule ask-f4
   ?io <- (ioproxy)
   (stage f4)
 =>
   (modify ?io (messages "Vas interesyet dizain i vizualnoe oformlenie?") (answers "da" "net" "ne znau")))

(defrule answer-f4
   ?a <- (answer (cf ?c))
   ?s <- (stage f4)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f4) (cf ?c))))
   (assert (stage f5) (clearmessage)))

(defrule ask-f5
   ?io <- (ioproxy)
   (stage f5)
 =>
   (modify ?io (messages "Vas interesyet biznes i predprinimatelstvo?") (answers "da" "net" "ne znau")))

(defrule answer-f5
   ?a <- (answer (cf ?c))
   ?s <- (stage f5)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f5) (cf ?c))))
   (assert (stage f6) (clearmessage)))

(defrule ask-f6
   ?io <- (ioproxy)
   (stage f6)
 =>
   (modify ?io (messages "Vam nravitsya pomogat lyudyam?") (answers "da" "net" "ne znau")))

(defrule answer-f6
   ?a <- (answer (cf ?c))
   ?s <- (stage f6)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f6) (cf ?c))))
   (assert (stage f7) (clearmessage)))

(defrule ask-f7
   ?io <- (ioproxy)
   (stage f7)
 =>
   (modify ?io (messages "Vam nravitsya obuchat drugikh?") (answers "da" "net" "ne znau")))

(defrule answer-f7
   ?a <- (answer (cf ?c))
   ?s <- (stage f7)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f7) (cf ?c))))
   (assert (stage f8) (clearmessage)))

(defrule ask-f8
   ?io <- (ioproxy)
   (stage f8)
 =>
   (modify ?io (messages "Vas interesyet marketing i prodvizhenie?") (answers "da" "net" "ne znau")))

(defrule answer-f8
   ?a <- (answer (cf ?c))
   ?s <- (stage f8)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f8) (cf ?c))))
   (assert (stage f9) (clearmessage)))

(defrule ask-f9
   ?io <- (ioproxy)
   (stage f9)
 =>
   (modify ?io (messages "Vas interesyet kiberbezopasnost?") (answers "da" "net" "ne znau")))

(defrule answer-f9
   ?a <- (answer (cf ?c))
   ?s <- (stage f9)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f9) (cf ?c))))
   (assert (stage f10) (clearmessage)))

(defrule ask-f10
   ?io <- (ioproxy)
   (stage f10)
 =>
   (modify ?io (messages "Vas interesyet nauka i issledovaniya?") (answers "da" "net" "ne znau")))

(defrule answer-f10
   ?a <- (answer (cf ?c))
   ?s <- (stage f10)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f10) (cf ?c))))
   (assert (stage f11) (clearmessage)))

(defrule ask-f11
   ?io <- (ioproxy)
   (stage f11)
 =>
   (modify ?io (messages "Vas interesyet avtomatizatsiya protsessov?") (answers "da" "net" "ne znau")))

(defrule answer-f11
   ?a <- (answer (cf ?c))
   ?s <- (stage f11)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f11) (cf ?c))))
   (assert (stage f12) (clearmessage)))

(defrule ask-f12
   ?io <- (ioproxy)
   (stage f12)
 =>
   (modify ?io (messages "Vas interesuyut mobilnye tekhnologii?") (answers "da" "net" "ne znau")))

(defrule answer-f12
   ?a <- (answer (cf ?c))
   ?s <- (stage f12)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f12) (cf ?c))))
   (assert (stage f13) (clearmessage)))

(defrule ask-f13
   ?io <- (ioproxy)
   (stage f13)
 =>
   (modify ?io (messages "Vas interesuyut veb-tekhnologii?") (answers "da" "net" "ne znau")))

(defrule answer-f13
   ?a <- (answer (cf ?c))
   ?s <- (stage f13)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f13) (cf ?c))))
   (assert (stage f14) (clearmessage)))

(defrule ask-f14
   ?io <- (ioproxy)
   (stage f14)
 =>
   (modify ?io (messages "Vas interesuyut igry i gamedev?") (answers "da" "net" "ne znau")))

(defrule answer-f14
   ?a <- (answer (cf ?c))
   ?s <- (stage f14)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f14) (cf ?c))))
   (assert (stage f15) (clearmessage)))

(defrule ask-f15
   ?io <- (ioproxy)
   (stage f15)
 =>
   (modify ?io (messages "Vas interesyet AI i mashinnoe obuchenie?") (answers "da" "net" "ne znau")))

(defrule answer-f15
   ?a <- (answer (cf ?c))
   ?s <- (stage f15)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f15) (cf ?c))))
   (assert (stage f16) (clearmessage)))

; ===== QUALITIES (f16-f30) =====

(defrule ask-f16
   ?io <- (ioproxy)
   (stage f16)
 =>
   (modify ?io (messages "U vas razvito logicheskoe myshlenie?") (answers "da" "net" "ne znau")))

(defrule answer-f16
   ?a <- (answer (cf ?c))
   ?s <- (stage f16)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f16) (cf ?c))))
   (assert (stage f17) (clearmessage)))

(defrule ask-f17
   ?io <- (ioproxy)
   (stage f17)
 =>
   (modify ?io (messages "Vy kreativny?") (answers "da" "net" "ne znau")))

(defrule answer-f17
   ?a <- (answer (cf ?c))
   ?s <- (stage f17)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f17) (cf ?c))))
   (assert (stage f18) (clearmessage)))

(defrule ask-f18
   ?io <- (ioproxy)
   (stage f18)
 =>
   (modify ?io (messages "Vy usidchivy i vnimatelny k detalyam?") (answers "da" "net" "ne znau")))

(defrule answer-f18
   ?a <- (answer (cf ?c))
   ?s <- (stage f18)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f18) (cf ?c))))
   (assert (stage f19) (clearmessage)))

(defrule ask-f19
   ?io <- (ioproxy)
   (stage f19)
 =>
   (modify ?io (messages "Vy kommunikabelny?") (answers "da" "net" "ne znau")))

(defrule answer-f19
   ?a <- (answer (cf ?c))
   ?s <- (stage f19)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f19) (cf ?c))))
   (assert (stage f20) (clearmessage)))

(defrule ask-f20
   ?io <- (ioproxy)
   (stage f20)
 =>
   (modify ?io (messages "U vas est organizatorskie sposobnosti?") (answers "da" "net" "ne znau")))

(defrule answer-f20
   ?a <- (answer (cf ?c))
   ?s <- (stage f20)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f20) (cf ?c))))
   (assert (stage f21) (clearmessage)))

(defrule ask-f21
   ?io <- (ioproxy)
   (stage f21)
 =>
   (modify ?io (messages "Vam nravitsya rabotat v komande?") (answers "da" "net" "ne znau")))

(defrule answer-f21
   ?a <- (answer (cf ?c))
   ?s <- (stage f21)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f21) (cf ?c))))
   (assert (stage f22) (clearmessage)))

(defrule ask-f22
   ?io <- (ioproxy)
   (stage f22)
 =>
   (modify ?io (messages "U vas vysokaya samodistsiplina?") (answers "da" "net" "ne znau")))

(defrule answer-f22
   ?a <- (answer (cf ?c))
   ?s <- (stage f22)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f22) (cf ?c))))
   (assert (stage f23) (clearmessage)))

(defrule ask-f23
   ?io <- (ioproxy)
   (stage f23)
 =>
   (modify ?io (messages "Vy stressoustoichivy?") (answers "da" "net" "ne znau")))

(defrule answer-f23
   ?a <- (answer (cf ?c))
   ?s <- (stage f23)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f23) (cf ?c))))
   (assert (stage f24) (clearmessage)))

(defrule ask-f24
   ?io <- (ioproxy)
   (stage f24)
 =>
   (modify ?io (messages "Vy uverenno vladeete kompyuterom?") (answers "da" "net" "ne znau")))

(defrule answer-f24
   ?a <- (answer (cf ?c))
   ?s <- (stage f24)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f24) (cf ?c))))
   (assert (stage f25) (clearmessage)))

(defrule ask-f25
   ?io <- (ioproxy)
   (stage f25)
 =>
   (modify ?io (messages "U vas est znaniya angliyskogo?") (answers "da" "net" "ne znau")))

(defrule answer-f25
   ?a <- (answer (cf ?c))
   ?s <- (stage f25)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f25) (cf ?c))))
   (assert (stage f26) (clearmessage)))

(defrule ask-f26
   ?io <- (ioproxy)
   (stage f26)
 =>
   (modify ?io (messages "U vas khoroshie matematicheskie sposobnosti?") (answers "da" "net" "ne znau")))

(defrule answer-f26
   ?a <- (answer (cf ?c))
   ?s <- (stage f26)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f26) (cf ?c))))
   (assert (stage f27) (clearmessage)))

(defrule ask-f27
   ?io <- (ioproxy)
   (stage f27)
 =>
   (modify ?io (messages "U vas analiticheskiy sklad uma?") (answers "da" "net" "ne znau")))

(defrule answer-f27
   ?a <- (answer (cf ?c))
   ?s <- (stage f27)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f27) (cf ?c))))
   (assert (stage f28) (clearmessage)))

(defrule ask-f28
   ?io <- (ioproxy)
   (stage f28)
 =>
   (modify ?io (messages "Vy sklonny k samoobucheniyu?") (answers "da" "net" "ne znau")))

(defrule answer-f28
   ?a <- (answer (cf ?c))
   ?s <- (stage f28)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f28) (cf ?c))))
   (assert (stage f29) (clearmessage)))

(defrule ask-f29
   ?io <- (ioproxy)
   (stage f29)
 =>
   (modify ?io (messages "Vy terpelivy?") (answers "da" "net" "ne znau")))

(defrule answer-f29
   ?a <- (answer (cf ?c))
   ?s <- (stage f29)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f29) (cf ?c))))
   (assert (stage f30) (clearmessage)))

(defrule ask-f30
   ?io <- (ioproxy)
   (stage f30)
 =>
   (modify ?io (messages "Vy perfektsionist?") (answers "da" "net" "ne znau")))

(defrule answer-f30
   ?a <- (answer (cf ?c))
   ?s <- (stage f30)
 =>
   (retract ?a ?s)
   (if (neq ?c 0.0) then (assert (known (id f30) (cf ?c))))
   (assert (stage done) (clearmessage)))

; ===== END =====

(defrule show-results
   (declare (salience -10))
   ?io <- (ioproxy)
   (stage done)
 =>
   (modify ?io
     (messages "Opros zavershen! Nazhmite Pokazat fakty.")
     (answers)))
