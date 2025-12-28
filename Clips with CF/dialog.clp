; =====================================================
; dialog.clp - Generic Dialog Engine
; LOAD SECOND after kb_domain.clp
; =====================================================

(deffunction cf-normalize (?cf)
  (if (> ?cf 1.0) then (return 1.0))
  (if (< ?cf -1.0) then (return -1.0))
  (return ?cf)
)

(deffunction cf-combine (?cf1 ?cf2)
  ; One is zero
  (if (= ?cf1 0.0) then (return ?cf2))
  (if (= ?cf2 0.0) then (return ?cf1))

  ; Both pos
  (if (and (> ?cf1 0.0) (> ?cf2 0.0)) then
     (return
       (cf-normalize
         (+ ?cf1 (* ?cf2 (- 1 ?cf1)))))
  )

  ; Both neg
  (if (and (< ?cf1 0.0) (< ?cf2 0.0)) then
     (return
       (cf-normalize
         (+ ?cf1 (* ?cf2 (+ 1 ?cf1)))))
  )

  ; Diff signs
  (bind ?num (+ ?cf1 ?cf2))
  (bind ?den (- 1 (min (abs ?cf1) (abs ?cf2))))
  (if (= ?den 0.0) then
     (if (> ?num 0.0)
        then (return 1.0)
        else (return -1.0))
  )
  (return (cf-normalize (/ ?num ?den)))
)

(deffunction update-known (?id ?cf-new)
  (bind ?cf-new (cf-normalize ?cf-new))
  (if (= ?cf-new 0.0) then (return FALSE))

  (bind ?facts
        (find-all-facts
          ((?f known))
          (eq ?id (fact-slot-value ?f id))))

  (if (= (length$ ?facts) 0)
   then
     (assert (known (id ?id) (cf ?cf-new)))
   else
     (bind ?f (nth$ 1 ?facts))
     (bind ?cf-old (fact-slot-value ?f cf))
     (bind ?cf-comb (cf-combine ?cf-old ?cf-new))
     (modify ?f (cf ?cf-comb))
  )
  (return TRUE)
)

(deffunction answer->cf (?v)
  (if (eq ?v yes) then 1.0
  else (if (eq ?v no) then -1.0
  else 0.0)))

; --- DATA ---
; All questions are now defined as facts
(deffacts questions-list
   (question (id f1) (text "Вас интересует программирование?") (next-id f2))
   (question (id f2) (text "Вас интересует работа с данными и аналитика?") (next-id f3))
   (question (id f3) (text "Вас интересует системное администрирование?") (next-id f4))
   (question (id f4) (text "Вас интересует дизайн и визуальное оформление?") (next-id f5))
   (question (id f5) (text "Вас интересует бизнес и предпринимательство?") (next-id f6))
   (question (id f6) (text "Вам нравится помогать людям?") (next-id f7))
   (question (id f7) (text "Вам нравится обучать других?") (next-id f8))
   (question (id f8) (text "Вас интересует маркетинг и продвижение?") (next-id f9))
   (question (id f9) (text "Вас интересует кибербезопасность?") (next-id f10))
   (question (id f10) (text "Вас интересует наука и исследования?") (next-id f11))
   (question (id f11) (text "Вас интересует автоматизация процессов?") (next-id f12))
   (question (id f12) (text "Вас интересуют мобильные технологии?") (next-id f13))
   (question (id f13) (text "Вас интересуют веб-технологии?") (next-id f14))
   (question (id f14) (text "Вас интересуют игры и GameDev?") (next-id f15))
   (question (id f15) (text "Вас интересует ИИ и машинное обучение?") (next-id f16))
   (question (id f16) (text "У вас развито логическое мышление?") (next-id f17))
   (question (id f17) (text "Вы креативны?") (next-id f18))
   (question (id f18) (text "Вы усидчивы и внимательны к деталям?") (next-id f19))
   (question (id f19) (text "Вы коммуникабельны?") (next-id f20))
   (question (id f20) (text "У вас есть организаторские способности?") (next-id f21))
   (question (id f21) (text "Вам нравится работать в команде?") (next-id f22))
   (question (id f22) (text "У вас высокая самодисциплина?") (next-id f23))
   (question (id f23) (text "Вы стрессоустойчивы?") (next-id f24))
   (question (id f24) (text "Вы уверенно владеете компьютером?") (next-id f25))
   (question (id f25) (text "У вас есть знания английского языка?") (next-id f26))
   (question (id f26) (text "У вас хорошие математические способности?") (next-id f27))
   (question (id f27) (text "У вас аналитический склад ума?") (next-id f28))
   (question (id f28) (text "Вы склонны к самообучению?") (next-id f29))
   (question (id f29) (text "Вы терпеливы?") (next-id f30))
   (question (id f30) (text "Вы перфекционист?") (next-id done)))

; --- ENGINE ---

(deffacts start-dialog
  (ioproxy (messages) (answers))
  (stage f1))

(defrule clear-messages
   (declare (salience 100))
   ?c <- (clearmessage)
   ?io <- (ioproxy)
 =>
   (retract ?c)
   (modify ?io (messages) (answers)))

; Generic rule to ask the next question
(defrule ask-next-question
   (declare (salience 10))
   ?io <- (ioproxy)
   (stage ?current-id&:(neq ?current-id done))
   (question (id ?current-id) (text ?t))
 =>
   (modify ?io
     (messages ?t)
     (answers "yes" "no" "dont-know")))

; Generic rule to process any answer
(defrule process-user-answer
   (declare (salience 50))
   ?a <- (answer (value ?v))
   ?s <- (stage ?current-id)
   (question (id ?current-id) (next-id ?next-id))
 =>
   (retract ?a ?s)
   (bind ?c (answer->cf ?v))
   (if (neq ?c 0.0) then (assert (known (id ?current-id) (cf ?c))))
   (assert (stage ?next-id) (clearmessage))
   )
   
; Rule for when the dialog is finished
(defrule dialog-done
   (declare (salience -10))
   ?s <- (stage done)
   ?io <- (ioproxy)
 =>
    ; This rule doesn't retract (stage done) so C# can detect it
   (modify ?io (messages "Опрос завершён!") (answers)))