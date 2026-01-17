; =====================================================
; kb_domain.clp - Шаблоны (Templates)
; ЗАГРУЖАТЬ ПЕРВЫМ!
; =====================================================

; Факт теперь простой: если он есть в базе, значит это ПРАВДА.
(deftemplate known
  (slot id (type SYMBOL))
)

; Отслеживание срабатывания правил (чтобы не зацикливалось)
(deftemplate rule-fired
  (slot id (type SYMBOL))
)

; Прокси для общения с C# (не меняем)
(deftemplate ioproxy
  (multislot messages)
  (multislot answers)
)

; Ответ пользователя из C#
(deftemplate answer
  (slot value (type SYMBOL)) ; yes / no / dont-know
)

; Флаг очистки сообщений
(deftemplate clearmessage)

; Шаблон вопроса диалога
(deftemplate question
   (slot id (type SYMBOL))
   (slot text (type STRING))
   (slot next-id (type SYMBOL))
)
