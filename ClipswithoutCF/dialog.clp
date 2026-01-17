; =====================================================
; dialog.clp 
; ЗАГРУЖАТЬ ВТОРЫМ после kb_domain.clp
; =====================================================

; --- ДАННЫЕ (Вопросы) ---
; Тексты восстановлены по смыслу id из facts.json

(deffacts questions-list
   (question (id f1)  (text "Интересует ли вас программирование?") (next-id f2))
   (question (id f2)  (text "Интересны ли вам данные и аналитика?") (next-id f3))
   (question (id f3)  (text "Интересно ли вам администрирование и сети?") (next-id f4))
   (question (id f4)  (text "Интересен ли дизайн и визуальное оформление?") (next-id f5))
   (question (id f5)  (text "Интересен ли бизнес и предпринимательство?") (next-id f6))
   (question (id f6)  (text "Хотите ли вы помогать людям?") (next-id f7))
   (question (id f7)  (text "Нравится ли вам обучать других?") (next-id f8))
   (question (id f8)  (text "Интересен ли маркетинг и продвижение?") (next-id f9))
   (question (id f9)  (text "Интересна ли кибербезопасность?") (next-id f10))
   (question (id f10) (text "Интересна ли наука и исследования?") (next-id f11))
   (question (id f11) (text "Интересна ли автоматизация процессов?") (next-id f12))
   (question (id f12) (text "Интересны ли мобильные технологии?") (next-id f13))
   (question (id f13) (text "Интересны ли веб-технологии?") (next-id f14))
   (question (id f14) (text "Интересны ли игры и GameDev?") (next-id f15))
   (question (id f15) (text "Интересен ли искусственный интеллект?") (next-id f16))
   
   (question (id f16) (text "Свойственно ли вам логическое мышление?") (next-id f17))
   (question (id f17) (text "Свойственно ли вам креативное мышление?") (next-id f18))
   (question (id f18) (text "Вы усидчивы и внимательны?") (next-id f19))
   (question (id f19) (text "Вы коммуникабельны?") (next-id f20))
   (question (id f20) (text "Есть ли у вас организаторские способности?") (next-id f21))
   (question (id f21) (text "Склонны ли вы к командной работе?") (next-id f22))
   (question (id f22) (text "Есть ли у вас самодисциплина?") (next-id f23))
   (question (id f23) (text "Вы стрессоустойчивы?") (next-id f24))
   (question (id f24) (text "Уверенно ли вы владеете компьютером?") (next-id f25))
   (question (id f25) (text "Знаете ли вы английский язык?") (next-id f26))
   (question (id f26) (text "Есть ли у вас математические способности?") (next-id f27))
   (question (id f27) (text "У вас аналитический склад ума?") (next-id f28))
   (question (id f28) (text "Склонны ли вы к самообучению?") (next-id f29))
   (question (id f29) (text "Вы терпеливы?") (next-id f30))
   (question (id f30) (text "Вы перфекционист?") (next-id done))
)

; --- ДВИЖОК ---

(deffacts start-dialog
  (ioproxy (messages) (answers))
  (stage f1) ; Начинаем с первого вопроса
)

; Правило очистки сообщений (служебное)
(defrule clear-messages
   (declare (salience 100))
   ?c <- (clearmessage)
   ?io <- (ioproxy)
 =>
   (retract ?c)
   (modify ?io (messages) (answers))
)

; Правило: Задать следующий вопрос
(defrule ask-next-question
   (declare (salience 10))
   ?io <- (ioproxy)
   (stage ?current-id&:(neq ?current-id done))
   (question (id ?current-id) (text ?t))
 =>
   (modify ?io
     (messages ?t)
     (answers "yes" "no" "dont-know"))
)

; Правило: Обработать ответ пользователя
(defrule process-user-answer
   (declare (salience 50))
   ?a <- (answer (value ?v))
   ?s <- (stage ?current-id)
   (question (id ?current-id) (next-id ?next-id))
 =>
   (retract ?a ?s)

   ; ЛОГИКА БЕЗ КОЭФФИЦИЕНТОВ:
   ; Если ответ "yes", то факт считается установленным (Истина).
   ; Если "no" или "dont-know", факт просто не добавляется в базу.
   
   (if (eq ?v yes)
       then 
       (assert (known (id ?current-id)))
   )

   ; Переход к следующему этапу и очистка интерфейса
   (assert (stage ?next-id) (clearmessage))
)

; Правило: Диалог завершен
(defrule dialog-done
   (declare (salience -10))
   ?s <- (stage done)
   ?io <- (ioproxy)
 =>
   (modify ?io (messages "Диалог завершен!") (answers))
)
