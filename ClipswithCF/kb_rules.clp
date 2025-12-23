; =====================================================
; kb_rules.clp - Pravila vyvoda (auto-generated)
; LOAD THIRD after kb_domain.clp and dialog.clp
; =====================================================

; r1: программирование + логика => техническая склонность
(defrule r1
   (not (rule-fired (id r1)))
   (known (id f1) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f16) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f31)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f31) (cf ?cf-result)))
   (assert (rule-fired (id r1)))
)

; r2: программирование + компьютер => техническая склонность
(defrule r2
   (not (rule-fired (id r2)))
   (known (id f1) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f24) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f31)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f31) (cf ?cf-result)))
   (assert (rule-fired (id r2)))
)

; r3: администрирование + логика => техническая склонность
(defrule r3
   (not (rule-fired (id r3)))
   (known (id f3) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f16) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f31)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f31) (cf ?cf-result)))
   (assert (rule-fired (id r3)))
)

; r4: автоматизация + логика => техническая склонность
(defrule r4
   (not (rule-fired (id r4)))
   (known (id f11) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f16) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f31)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f31) (cf ?cf-result)))
   (assert (rule-fired (id r4)))
)

; r5: кибербезопасность + компьютер => техническая склонность
(defrule r5
   (not (rule-fired (id r5)))
   (known (id f9) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f24) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f31)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.84))
   (assert (known (id f31) (cf ?cf-result)))
   (assert (rule-fired (id r5)))
)

; r6: данные + аналитика => аналитическая склонность
(defrule r6
   (not (rule-fired (id r6)))
   (known (id f2) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f27) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f32)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f32) (cf ?cf-result)))
   (assert (rule-fired (id r6)))
)

; r7: наука + логика => аналитическая склонность
(defrule r7
   (not (rule-fired (id r7)))
   (known (id f10) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f16) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f32)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f32) (cf ?cf-result)))
   (assert (rule-fired (id r7)))
)

; r8: данные + математика => аналитическая склонность
(defrule r8
   (not (rule-fired (id r8)))
   (known (id f2) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f26) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f32)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.87))
   (assert (known (id f32) (cf ?cf-result)))
   (assert (rule-fired (id r8)))
)

; r9: ИИ + аналитика => аналитическая склонность
(defrule r9
   (not (rule-fired (id r9)))
   (known (id f15) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f27) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f32)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f32) (cf ?cf-result)))
   (assert (rule-fired (id r9)))
)

; r10: наука + усидчивость => аналитическая склонность
(defrule r10
   (not (rule-fired (id r10)))
   (known (id f10) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f18) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f32)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.84))
   (assert (known (id f32) (cf ?cf-result)))
   (assert (rule-fired (id r10)))
)

; r11: дизайн + креатив => творческая склонность
(defrule r11
   (not (rule-fired (id r11)))
   (known (id f4) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f17) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f33)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f33) (cf ?cf-result)))
   (assert (rule-fired (id r11)))
)

; r12: веб + креатив => творческая склонность
(defrule r12
   (not (rule-fired (id r12)))
   (known (id f13) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f17) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f33)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f33) (cf ?cf-result)))
   (assert (rule-fired (id r12)))
)

; r13: геймдев + креатив => творческая склонность
(defrule r13
   (not (rule-fired (id r13)))
   (known (id f14) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f17) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f33)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.87))
   (assert (known (id f33) (cf ?cf-result)))
   (assert (rule-fired (id r13)))
)

; r14: дизайн + перфекционизм => творческая склонность
(defrule r14
   (not (rule-fired (id r14)))
   (known (id f4) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f30) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f33)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f33) (cf ?cf-result)))
   (assert (rule-fired (id r14)))
)

; r15: маркетинг + креатив => творческая склонность
(defrule r15
   (not (rule-fired (id r15)))
   (known (id f8) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f17) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f33)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.83))
   (assert (known (id f33) (cf ?cf-result)))
   (assert (rule-fired (id r15)))
)

; r16: бизнес + организация => управленческая склонность
(defrule r16
   (not (rule-fired (id r16)))
   (known (id f5) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f20) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f34)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f34) (cf ?cf-result)))
   (assert (rule-fired (id r16)))
)

; r17: бизнес + командная работа => управленческая склонность
(defrule r17
   (not (rule-fired (id r17)))
   (known (id f5) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f21) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f34)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f34) (cf ?cf-result)))
   (assert (rule-fired (id r17)))
)

; r18: организация + коммуникабельность => управленческая склонность
(defrule r18
   (not (rule-fired (id r18)))
   (known (id f20) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f19) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f34)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f34) (cf ?cf-result)))
   (assert (rule-fired (id r18)))
)

; r19: бизнес + стресс => управленческая склонность
(defrule r19
   (not (rule-fired (id r19)))
   (known (id f5) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f23) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f34)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.84))
   (assert (known (id f34) (cf ?cf-result)))
   (assert (rule-fired (id r19)))
)

; r20: организация + самодисциплина => управленческая склонность
(defrule r20
   (not (rule-fired (id r20)))
   (known (id f20) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f22) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f34)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.82))
   (assert (known (id f34) (cf ?cf-result)))
   (assert (rule-fired (id r20)))
)

; r21: помощь + коммуникабельность => коммуникативная склонность
(defrule r21
   (not (rule-fired (id r21)))
   (known (id f6) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f19) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f35)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f35) (cf ?cf-result)))
   (assert (rule-fired (id r21)))
)

; r22: обучение + коммуникабельность => коммуникативная склонность
(defrule r22
   (not (rule-fired (id r22)))
   (known (id f7) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f19) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f35)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f35) (cf ?cf-result)))
   (assert (rule-fired (id r22)))
)

; r23: маркетинг + коммуникабельность => коммуникативная склонность
(defrule r23
   (not (rule-fired (id r23)))
   (known (id f8) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f19) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f35)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f35) (cf ?cf-result)))
   (assert (rule-fired (id r23)))
)

; r24: командная работа + коммуникабельность => коммуникативная склонность
(defrule r24
   (not (rule-fired (id r24)))
   (known (id f21) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f19) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f35)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f35) (cf ?cf-result)))
   (assert (rule-fired (id r24)))
)

; r25: помощь + терпеливость => коммуникативная склонность
(defrule r25
   (not (rule-fired (id r25)))
   (known (id f6) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f29) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f35)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.83))
   (assert (known (id f35) (cf ?cf-result)))
   (assert (rule-fired (id r25)))
)

; r26: наука + самообучение => исследовательская склонность
(defrule r26
   (not (rule-fired (id r26)))
   (known (id f10) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f28) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f36)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f36) (cf ?cf-result)))
   (assert (rule-fired (id r26)))
)

; r27: ИИ + наука => исследовательская склонность
(defrule r27
   (not (rule-fired (id r27)))
   (known (id f15) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f10) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f36)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f36) (cf ?cf-result)))
   (assert (rule-fired (id r27)))
)

; r28: данные + наука => исследовательская склонность
(defrule r28
   (not (rule-fired (id r28)))
   (known (id f2) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f10) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f36)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f36) (cf ?cf-result)))
   (assert (rule-fired (id r28)))
)

; r29: наука + математика => исследовательская склонность
(defrule r29
   (not (rule-fired (id r29)))
   (known (id f10) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f26) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f36)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f36) (cf ?cf-result)))
   (assert (rule-fired (id r29)))
)

; r30: ИИ + математика => исследовательская склонность
(defrule r30
   (not (rule-fired (id r30)))
   (known (id f15) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f26) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f36)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.83))
   (assert (known (id f36) (cf ?cf-result)))
   (assert (rule-fired (id r30)))
)

; r31: бизнес + самодисциплина => предпринимательская склонность
(defrule r31
   (not (rule-fired (id r31)))
   (known (id f5) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f22) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f37)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f37) (cf ?cf-result)))
   (assert (rule-fired (id r31)))
)

; r32: маркетинг + бизнес => предпринимательская склонность
(defrule r32
   (not (rule-fired (id r32)))
   (known (id f8) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f5) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f37)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f37) (cf ?cf-result)))
   (assert (rule-fired (id r32)))
)

; r33: бизнес + стресс => предпринимательская склонность
(defrule r33
   (not (rule-fired (id r33)))
   (known (id f5) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f23) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f37)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f37) (cf ?cf-result)))
   (assert (rule-fired (id r33)))
)

; r34: бизнес + английский => предпринимательская склонность
(defrule r34
   (not (rule-fired (id r34)))
   (known (id f5) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f25) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f37)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.83))
   (assert (known (id f37) (cf ?cf-result)))
   (assert (rule-fired (id r34)))
)

; r35: обучение + терпеливость => педагогическая склонность
(defrule r35
   (not (rule-fired (id r35)))
   (known (id f7) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f29) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f38)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f38) (cf ?cf-result)))
   (assert (rule-fired (id r35)))
)

; r36: обучение + коммуникабельность => педагогическая склонность
(defrule r36
   (not (rule-fired (id r36)))
   (known (id f7) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f19) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f38)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f38) (cf ?cf-result)))
   (assert (rule-fired (id r36)))
)

; r37: помощь + обучение => педагогическая склонность
(defrule r37
   (not (rule-fired (id r37)))
   (known (id f6) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f7) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f38)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f38) (cf ?cf-result)))
   (assert (rule-fired (id r37)))
)

; r38: обучение + самообучение => педагогическая склонность
(defrule r38
   (not (rule-fired (id r38)))
   (known (id f7) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f28) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f38)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.84))
   (assert (known (id f38) (cf ?cf-result)))
   (assert (rule-fired (id r38)))
)

; r39: техническая + программирование => навыки программирования
(defrule r39
   (not (rule-fired (id r39)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f1) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f39)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f39) (cf ?cf-result)))
   (assert (rule-fired (id r39)))
)

; r40: техническая + логика + усидчивость => навыки программирования
(defrule r40
   (not (rule-fired (id r40)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f16) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f18) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f39)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.88))
   (assert (known (id f39) (cf ?cf-result)))
   (assert (rule-fired (id r40)))
)

; r41: техническая + самообучение => навыки программирования
(defrule r41
   (not (rule-fired (id r41)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f28) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f39)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f39) (cf ?cf-result)))
   (assert (rule-fired (id r41)))
)

; r42: техническая + английский => навыки программирования
(defrule r42
   (not (rule-fired (id r42)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f25) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f39)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.83))
   (assert (known (id f39) (cf ?cf-result)))
   (assert (rule-fired (id r42)))
)

; r43: аналитическая + данные => навыки работы с данными
(defrule r43
   (not (rule-fired (id r43)))
   (known (id f32) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f2) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f40)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f40) (cf ?cf-result)))
   (assert (rule-fired (id r43)))
)

; r44: аналитическая + математика => навыки работы с данными
(defrule r44
   (not (rule-fired (id r44)))
   (known (id f32) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f26) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f40)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f40) (cf ?cf-result)))
   (assert (rule-fired (id r44)))
)

; r45: исследовательская + данные => навыки работы с данными
(defrule r45
   (not (rule-fired (id r45)))
   (known (id f36) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f2) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f40)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f40) (cf ?cf-result)))
   (assert (rule-fired (id r45)))
)

; r46: аналитическая + усидчивость => навыки работы с данными
(defrule r46
   (not (rule-fired (id r46)))
   (known (id f32) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f18) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f40)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.84))
   (assert (known (id f40) (cf ?cf-result)))
   (assert (rule-fired (id r46)))
)

; r47: техническая + администрирование => навыки администрирования
(defrule r47
   (not (rule-fired (id r47)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f3) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f41)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f41) (cf ?cf-result)))
   (assert (rule-fired (id r47)))
)

; r48: техническая + автоматизация => навыки администрирования
(defrule r48
   (not (rule-fired (id r48)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f11) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f41)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f41) (cf ?cf-result)))
   (assert (rule-fired (id r48)))
)

; r49: техническая + стресс => навыки администрирования
(defrule r49
   (not (rule-fired (id r49)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f23) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f41)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f41) (cf ?cf-result)))
   (assert (rule-fired (id r49)))
)

; r50: техническая + самодисциплина => навыки администрирования
(defrule r50
   (not (rule-fired (id r50)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f22) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f41)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.83))
   (assert (known (id f41) (cf ?cf-result)))
   (assert (rule-fired (id r50)))
)

; r51: творческая + дизайн => навыки дизайна
(defrule r51
   (not (rule-fired (id r51)))
   (known (id f33) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f4) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f42)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f42) (cf ?cf-result)))
   (assert (rule-fired (id r51)))
)

; r52: творческая + перфекционизм => навыки дизайна
(defrule r52
   (not (rule-fired (id r52)))
   (known (id f33) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f30) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f42)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f42) (cf ?cf-result)))
   (assert (rule-fired (id r52)))
)

; r53: творческая + усидчивость => навыки дизайна
(defrule r53
   (not (rule-fired (id r53)))
   (known (id f33) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f18) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f42)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f42) (cf ?cf-result)))
   (assert (rule-fired (id r53)))
)

; r54: коммуникативная + дизайн => навыки дизайна
(defrule r54
   (not (rule-fired (id r54)))
   (known (id f35) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f4) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f42)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.83))
   (assert (known (id f42) (cf ?cf-result)))
   (assert (rule-fired (id r54)))
)

; r55: управленческая + организация => навыки управления
(defrule r55
   (not (rule-fired (id r55)))
   (known (id f34) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f20) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f43)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f43) (cf ?cf-result)))
   (assert (rule-fired (id r55)))
)

; r56: управленческая + командная работа => навыки управления
(defrule r56
   (not (rule-fired (id r56)))
   (known (id f34) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f21) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f43)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f43) (cf ?cf-result)))
   (assert (rule-fired (id r56)))
)

; r57: предпринимательская + организация => навыки управления
(defrule r57
   (not (rule-fired (id r57)))
   (known (id f37) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f20) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f43)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f43) (cf ?cf-result)))
   (assert (rule-fired (id r57)))
)

; r58: управленческая + стресс => навыки управления
(defrule r58
   (not (rule-fired (id r58)))
   (known (id f34) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f23) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f43)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.84))
   (assert (known (id f43) (cf ?cf-result)))
   (assert (rule-fired (id r58)))
)

; r59: коммуникативная + помощь => навыки коммуникации
(defrule r59
   (not (rule-fired (id r59)))
   (known (id f35) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f6) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f44)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f44) (cf ?cf-result)))
   (assert (rule-fired (id r59)))
)

; r60: коммуникативная + командная работа => навыки коммуникации
(defrule r60
   (not (rule-fired (id r60)))
   (known (id f35) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f21) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f44)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f44) (cf ?cf-result)))
   (assert (rule-fired (id r60)))
)

; r61: педагогическая + коммуникабельность => навыки коммуникации
(defrule r61
   (not (rule-fired (id r61)))
   (known (id f38) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f19) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f44)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f44) (cf ?cf-result)))
   (assert (rule-fired (id r61)))
)

; r62: управленческая + коммуникабельность => навыки коммуникации
(defrule r62
   (not (rule-fired (id r62)))
   (known (id f34) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f19) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f44)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.84))
   (assert (known (id f44) (cf ?cf-result)))
   (assert (rule-fired (id r62)))
)

; r63: аналитическая + логика => навыки анализа
(defrule r63
   (not (rule-fired (id r63)))
   (known (id f32) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f16) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f45)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f45) (cf ?cf-result)))
   (assert (rule-fired (id r63)))
)

; r64: исследовательская + логика => навыки анализа
(defrule r64
   (not (rule-fired (id r64)))
   (known (id f36) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f16) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f45)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f45) (cf ?cf-result)))
   (assert (rule-fired (id r64)))
)

; r65: аналитическая + аналитика => навыки анализа
(defrule r65
   (not (rule-fired (id r65)))
   (known (id f32) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f27) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f45)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f45) (cf ?cf-result)))
   (assert (rule-fired (id r65)))
)

; r66: техническая + аналитика => навыки анализа
(defrule r66
   (not (rule-fired (id r66)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f27) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f45)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.84))
   (assert (known (id f45) (cf ?cf-result)))
   (assert (rule-fired (id r66)))
)

; r67: техническая + кибербезопасность => навыки безопасности
(defrule r67
   (not (rule-fired (id r67)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f9) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f46)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f46) (cf ?cf-result)))
   (assert (rule-fired (id r67)))
)

; r68: аналитическая + кибербезопасность => навыки безопасности
(defrule r68
   (not (rule-fired (id r68)))
   (known (id f32) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f9) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f46)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f46) (cf ?cf-result)))
   (assert (rule-fired (id r68)))
)

; r69: техническая + перфекционизм => навыки безопасности
(defrule r69
   (not (rule-fired (id r69)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f30) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f46)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f46) (cf ?cf-result)))
   (assert (rule-fired (id r69)))
)

; r70: техническая + стресс => навыки безопасности
(defrule r70
   (not (rule-fired (id r70)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f23) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f46)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.83))
   (assert (known (id f46) (cf ?cf-result)))
   (assert (rule-fired (id r70)))
)

; r71: навыки программирования + веб => навыки веб-разработки
(defrule r71
   (not (rule-fired (id r71)))
   (known (id f39) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f13) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f47)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f47) (cf ?cf-result)))
   (assert (rule-fired (id r71)))
)

; r72: творческая + навыки программирования => навыки веб-разработки
(defrule r72
   (not (rule-fired (id r72)))
   (known (id f33) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f39) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f47)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f47) (cf ?cf-result)))
   (assert (rule-fired (id r72)))
)

; r73: навыки программирования + дизайн => навыки веб-разработки
(defrule r73
   (not (rule-fired (id r73)))
   (known (id f39) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f4) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f47)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f47) (cf ?cf-result)))
   (assert (rule-fired (id r73)))
)

; r74: техническая + веб => навыки веб-разработки
(defrule r74
   (not (rule-fired (id r74)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f13) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f47)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.83))
   (assert (known (id f47) (cf ?cf-result)))
   (assert (rule-fired (id r74)))
)

; r75: навыки программирования + мобильные => навыки мобильной разработки
(defrule r75
   (not (rule-fired (id r75)))
   (known (id f39) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f12) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f48)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f48) (cf ?cf-result)))
   (assert (rule-fired (id r75)))
)

; r76: техническая + мобильные => навыки мобильной разработки
(defrule r76
   (not (rule-fired (id r76)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f12) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f48)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f48) (cf ?cf-result)))
   (assert (rule-fired (id r76)))
)

; r77: навыки программирования + усидчивость => навыки мобильной разработки
(defrule r77
   (not (rule-fired (id r77)))
   (known (id f39) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f18) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f48)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f48) (cf ?cf-result)))
   (assert (rule-fired (id r77)))
)

; r78: навыки программирования + навыки анализа => специализация backend
(defrule r78
   (not (rule-fired (id r78)))
   (known (id f39) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f49)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f49) (cf ?cf-result)))
   (assert (rule-fired (id r78)))
)

; r79: навыки программирования + логика + усидчивость => специализация backend
(defrule r79
   (not (rule-fired (id r79)))
   (known (id f39) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f16) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f18) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f49)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.88))
   (assert (known (id f49) (cf ?cf-result)))
   (assert (rule-fired (id r79)))
)

; r80: навыки программирования + навыки администрирования => специализация backend
(defrule r80
   (not (rule-fired (id r80)))
   (known (id f39) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f41) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f49)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f49) (cf ?cf-result)))
   (assert (rule-fired (id r80)))
)

; r81: навыки веб-разработки + навыки дизайна => специализация frontend
(defrule r81
   (not (rule-fired (id r81)))
   (known (id f47) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f42) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f50)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f50) (cf ?cf-result)))
   (assert (rule-fired (id r81)))
)

; r82: навыки веб-разработки + творческая => специализация frontend
(defrule r82
   (not (rule-fired (id r82)))
   (known (id f47) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f33) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f50)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f50) (cf ?cf-result)))
   (assert (rule-fired (id r82)))
)

; r83: навыки программирования + навыки дизайна => специализация frontend
(defrule r83
   (not (rule-fired (id r83)))
   (known (id f39) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f42) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f50)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f50) (cf ?cf-result)))
   (assert (rule-fired (id r83)))
)

; r84: специализация backend + специализация frontend => специализация fullstack
(defrule r84
   (not (rule-fired (id r84)))
   (known (id f49) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f50) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f51)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f51) (cf ?cf-result)))
   (assert (rule-fired (id r84)))
)

; r85: навыки веб-разработки + навыки анализа + навыки программирования => специализация fullstack
(defrule r85
   (not (rule-fired (id r85)))
   (known (id f47) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f39) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f51)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.85))
   (assert (known (id f51) (cf ?cf-result)))
   (assert (rule-fired (id r85)))
)

; r86: навыки работы с данными + навыки анализа => специализация data science
(defrule r86
   (not (rule-fired (id r86)))
   (known (id f40) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f52)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f52) (cf ?cf-result)))
   (assert (rule-fired (id r86)))
)

; r87: навыки работы с данными + исследовательская => специализация data science
(defrule r87
   (not (rule-fired (id r87)))
   (known (id f40) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f36) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f52)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f52) (cf ?cf-result)))
   (assert (rule-fired (id r87)))
)

; r88: навыки работы с данными + математика => специализация data science
(defrule r88
   (not (rule-fired (id r88)))
   (known (id f40) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f26) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f52)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f52) (cf ?cf-result)))
   (assert (rule-fired (id r88)))
)

; r89: аналитическая + навыки анализа + ИИ => специализация data science
(defrule r89
   (not (rule-fired (id r89)))
   (known (id f32) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f15) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f52)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.84))
   (assert (known (id f52) (cf ?cf-result)))
   (assert (rule-fired (id r89)))
)

; r90: навыки администрирования + навыки программирования => специализация DevOps
(defrule r90
   (not (rule-fired (id r90)))
   (known (id f41) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f39) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f53)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f53) (cf ?cf-result)))
   (assert (rule-fired (id r90)))
)

; r91: навыки администрирования + автоматизация => специализация DevOps
(defrule r91
   (not (rule-fired (id r91)))
   (known (id f41) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f11) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f53)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f53) (cf ?cf-result)))
   (assert (rule-fired (id r91)))
)

; r92: техническая + навыки администрирования + стресс => специализация DevOps
(defrule r92
   (not (rule-fired (id r92)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f41) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f23) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f53)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.85))
   (assert (known (id f53) (cf ?cf-result)))
   (assert (rule-fired (id r92)))
)

; r93: навыки безопасности + навыки администрирования => специализация ИБ
(defrule r93
   (not (rule-fired (id r93)))
   (known (id f46) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f41) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f54)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f54) (cf ?cf-result)))
   (assert (rule-fired (id r93)))
)

; r94: навыки безопасности + навыки анализа => специализация ИБ
(defrule r94
   (not (rule-fired (id r94)))
   (known (id f46) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f54)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f54) (cf ?cf-result)))
   (assert (rule-fired (id r94)))
)

; r95: техническая + навыки безопасности + перфекционизм => специализация ИБ
(defrule r95
   (not (rule-fired (id r95)))
   (known (id f31) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f46) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f30) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f54)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.85))
   (assert (known (id f54) (cf ?cf-result)))
   (assert (rule-fired (id r95)))
)

; r96: навыки дизайна + навыки коммуникации => специализация UX/UI
(defrule r96
   (not (rule-fired (id r96)))
   (known (id f42) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f55)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f55) (cf ?cf-result)))
   (assert (rule-fired (id r96)))
)

; r97: навыки дизайна + навыки анализа => специализация UX/UI
(defrule r97
   (not (rule-fired (id r97)))
   (known (id f42) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f55)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f55) (cf ?cf-result)))
   (assert (rule-fired (id r97)))
)

; r98: творческая + навыки дизайна + коммуникабельность => специализация UX/UI
(defrule r98
   (not (rule-fired (id r98)))
   (known (id f33) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f42) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f19) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f55)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.85))
   (assert (known (id f55) (cf ?cf-result)))
   (assert (rule-fired (id r98)))
)

; r99: навыки управления + навыки коммуникации => специализация управление проектами
(defrule r99
   (not (rule-fired (id r99)))
   (known (id f43) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f56)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f56) (cf ?cf-result)))
   (assert (rule-fired (id r99)))
)

; r100: навыки управления + навыки анализа => специализация управление проектами
(defrule r100
   (not (rule-fired (id r100)))
   (known (id f43) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f56)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f56) (cf ?cf-result)))
   (assert (rule-fired (id r100)))
)

; r101: управленческая + навыки коммуникации + стресс => специализация управление проектами
(defrule r101
   (not (rule-fired (id r101)))
   (known (id f34) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f23) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f56)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.85))
   (assert (known (id f56) (cf ?cf-result)))
   (assert (rule-fired (id r101)))
)

; r102: навыки анализа + навыки коммуникации => специализация системный анализ
(defrule r102
   (not (rule-fired (id r102)))
   (known (id f45) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f57)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f57) (cf ?cf-result)))
   (assert (rule-fired (id r102)))
)

; r103: навыки анализа + навыки программирования => специализация системный анализ
(defrule r103
   (not (rule-fired (id r103)))
   (known (id f45) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f39) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f57)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f57) (cf ?cf-result)))
   (assert (rule-fired (id r103)))
)

; r104: аналитическая + навыки анализа + логика => специализация системный анализ
(defrule r104
   (not (rule-fired (id r104)))
   (known (id f32) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f16) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f57)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.85))
   (assert (known (id f57) (cf ?cf-result)))
   (assert (rule-fired (id r104)))
)

; r105: специализация data science + ИИ => специализация ML
(defrule r105
   (not (rule-fired (id r105)))
   (known (id f52) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f15) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f58)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f58) (cf ?cf-result)))
   (assert (rule-fired (id r105)))
)

; r106: навыки работы с данными + исследовательская + ИИ => специализация ML
(defrule r106
   (not (rule-fired (id r106)))
   (known (id f40) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f36) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f15) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f58)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.88))
   (assert (known (id f58) (cf ?cf-result)))
   (assert (rule-fired (id r106)))
)

; r107: специализация data science + математика => специализация ML
(defrule r107
   (not (rule-fired (id r107)))
   (known (id f52) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f26) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f58)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f58) (cf ?cf-result)))
   (assert (rule-fired (id r107)))
)

; r108: навыки мобильной разработки + навыки дизайна => специализация мобильная разработка
(defrule r108
   (not (rule-fired (id r108)))
   (known (id f48) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f42) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f59)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f59) (cf ?cf-result)))
   (assert (rule-fired (id r108)))
)

; r109: навыки мобильной разработки + навыки программирования => специализация мобильная разработка
(defrule r109
   (not (rule-fired (id r109)))
   (known (id f48) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f39) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f59)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f59) (cf ?cf-result)))
   (assert (rule-fired (id r109)))
)

; r110: навыки мобильной разработки + перфекционизм => специализация мобильная разработка
(defrule r110
   (not (rule-fired (id r110)))
   (known (id f48) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f30) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f59)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f59) (cf ?cf-result)))
   (assert (rule-fired (id r110)))
)

; r111: навыки программирования + творческая + геймдев => специализация геймдев
(defrule r111
   (not (rule-fired (id r111)))
   (known (id f39) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f33) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f14) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f60)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.9))
   (assert (known (id f60) (cf ?cf-result)))
   (assert (rule-fired (id r111)))
)

; r112: навыки программирования + навыки дизайна + геймдев => специализация геймдев
(defrule r112
   (not (rule-fired (id r112)))
   (known (id f39) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f42) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f14) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f60)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.88))
   (assert (known (id f60) (cf ?cf-result)))
   (assert (rule-fired (id r112)))
)

; r113: творческая + навыки программирования + математика => специализация геймдев
(defrule r113
   (not (rule-fired (id r113)))
   (known (id f33) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f39) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f26) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f60)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.85))
   (assert (known (id f60) (cf ?cf-result)))
   (assert (rule-fired (id r113)))
)

; r114: специализация backend + навыки анализа => профиль серверный разработчик
(defrule r114
   (not (rule-fired (id r114)))
   (known (id f49) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f61)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f61) (cf ?cf-result)))
   (assert (rule-fired (id r114)))
)

; r115: специализация backend + навыки администрирования => профиль серверный разработчик
(defrule r115
   (not (rule-fired (id r115)))
   (known (id f49) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f41) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f61)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f61) (cf ?cf-result)))
   (assert (rule-fired (id r115)))
)

; r116: специализация backend + английский => профиль серверный разработчик
(defrule r116
   (not (rule-fired (id r116)))
   (known (id f49) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f25) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f61)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f61) (cf ?cf-result)))
   (assert (rule-fired (id r116)))
)

; r117: специализация frontend + навыки коммуникации => профиль веб-разработчик
(defrule r117
   (not (rule-fired (id r117)))
   (known (id f50) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f62)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f62) (cf ?cf-result)))
   (assert (rule-fired (id r117)))
)

; r118: специализация fullstack + навыки коммуникации => профиль веб-разработчик
(defrule r118
   (not (rule-fired (id r118)))
   (known (id f51) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f62)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f62) (cf ?cf-result)))
   (assert (rule-fired (id r118)))
)

; r119: специализация frontend + навыки дизайна => профиль веб-разработчик
(defrule r119
   (not (rule-fired (id r119)))
   (known (id f50) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f42) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f62)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f62) (cf ?cf-result)))
   (assert (rule-fired (id r119)))
)

; r120: специализация data science + навыки коммуникации => профиль аналитик данных
(defrule r120
   (not (rule-fired (id r120)))
   (known (id f52) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f63)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f63) (cf ?cf-result)))
   (assert (rule-fired (id r120)))
)

; r121: специализация data science + навыки управления => профиль аналитик данных
(defrule r121
   (not (rule-fired (id r121)))
   (known (id f52) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f43) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f63)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f63) (cf ?cf-result)))
   (assert (rule-fired (id r121)))
)

; r122: специализация системный анализ + навыки работы с данными => профиль аналитик данных
(defrule r122
   (not (rule-fired (id r122)))
   (known (id f57) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f40) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f63)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f63) (cf ?cf-result)))
   (assert (rule-fired (id r122)))
)

; r123: специализация DevOps + навыки безопасности => профиль инженер DevOps
(defrule r123
   (not (rule-fired (id r123)))
   (known (id f53) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f46) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f64)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f64) (cf ?cf-result)))
   (assert (rule-fired (id r123)))
)

; r124: специализация DevOps + навыки анализа => профиль инженер DevOps
(defrule r124
   (not (rule-fired (id r124)))
   (known (id f53) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f64)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f64) (cf ?cf-result)))
   (assert (rule-fired (id r124)))
)

; r125: специализация DevOps + стресс => профиль инженер DevOps
(defrule r125
   (not (rule-fired (id r125)))
   (known (id f53) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f23) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f64)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f64) (cf ?cf-result)))
   (assert (rule-fired (id r125)))
)

; r126: специализация ИБ + навыки анализа => профиль специалист по ИБ
(defrule r126
   (not (rule-fired (id r126)))
   (known (id f54) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f65)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f65) (cf ?cf-result)))
   (assert (rule-fired (id r126)))
)

; r127: специализация ИБ + специализация DevOps => профиль специалист по ИБ
(defrule r127
   (not (rule-fired (id r127)))
   (known (id f54) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f53) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f65)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f65) (cf ?cf-result)))
   (assert (rule-fired (id r127)))
)

; r128: специализация ИБ + английский => профиль специалист по ИБ
(defrule r128
   (not (rule-fired (id r128)))
   (known (id f54) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f25) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f65)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f65) (cf ?cf-result)))
   (assert (rule-fired (id r128)))
)

; r129: специализация UX/UI + навыки анализа => профиль дизайнер интерфейсов
(defrule r129
   (not (rule-fired (id r129)))
   (known (id f55) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f66)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f66) (cf ?cf-result)))
   (assert (rule-fired (id r129)))
)

; r130: специализация UX/UI + навыки веб-разработки => профиль дизайнер интерфейсов
(defrule r130
   (not (rule-fired (id r130)))
   (known (id f55) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f47) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f66)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f66) (cf ?cf-result)))
   (assert (rule-fired (id r130)))
)

; r131: специализация UX/UI + перфекционизм => профиль дизайнер интерфейсов
(defrule r131
   (not (rule-fired (id r131)))
   (known (id f55) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f30) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f66)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f66) (cf ?cf-result)))
   (assert (rule-fired (id r131)))
)

; r132: специализация управление проектами + навыки анализа => профиль менеджер проектов
(defrule r132
   (not (rule-fired (id r132)))
   (known (id f56) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f67)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f67) (cf ?cf-result)))
   (assert (rule-fired (id r132)))
)

; r133: специализация управление проектами + навыки программирования => профиль менеджер проектов
(defrule r133
   (not (rule-fired (id r133)))
   (known (id f56) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f39) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f67)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f67) (cf ?cf-result)))
   (assert (rule-fired (id r133)))
)

; r134: специализация управление проектами + английский => профиль менеджер проектов
(defrule r134
   (not (rule-fired (id r134)))
   (known (id f56) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f25) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f67)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f67) (cf ?cf-result)))
   (assert (rule-fired (id r134)))
)

; r135: специализация системный анализ + навыки коммуникации => профиль системный аналитик
(defrule r135
   (not (rule-fired (id r135)))
   (known (id f57) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f68)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f68) (cf ?cf-result)))
   (assert (rule-fired (id r135)))
)

; r136: специализация системный анализ + навыки управления => профиль системный аналитик
(defrule r136
   (not (rule-fired (id r136)))
   (known (id f57) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f43) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f68)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f68) (cf ?cf-result)))
   (assert (rule-fired (id r136)))
)

; r137: специализация системный анализ + навыки программирования => профиль системный аналитик
(defrule r137
   (not (rule-fired (id r137)))
   (known (id f57) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f39) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f68)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f68) (cf ?cf-result)))
   (assert (rule-fired (id r137)))
)

; r138: специализация ML + навыки программирования => профиль ML-инженер
(defrule r138
   (not (rule-fired (id r138)))
   (known (id f58) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f39) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f69)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f69) (cf ?cf-result)))
   (assert (rule-fired (id r138)))
)

; r139: специализация ML + исследовательская => профиль ML-инженер
(defrule r139
   (not (rule-fired (id r139)))
   (known (id f58) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f36) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f69)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f69) (cf ?cf-result)))
   (assert (rule-fired (id r139)))
)

; r140: специализация ML + английский => профиль ML-инженер
(defrule r140
   (not (rule-fired (id r140)))
   (known (id f58) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f25) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f69)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f69) (cf ?cf-result)))
   (assert (rule-fired (id r140)))
)

; r141: специализация мобильная разработка + навыки коммуникации => профиль мобильный разработчик
(defrule r141
   (not (rule-fired (id r141)))
   (known (id f59) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f70)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f70) (cf ?cf-result)))
   (assert (rule-fired (id r141)))
)

; r142: специализация мобильная разработка + навыки дизайна => профиль мобильный разработчик
(defrule r142
   (not (rule-fired (id r142)))
   (known (id f59) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f42) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f70)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f70) (cf ?cf-result)))
   (assert (rule-fired (id r142)))
)

; r143: специализация мобильная разработка + навыки анализа => профиль мобильный разработчик
(defrule r143
   (not (rule-fired (id r143)))
   (known (id f59) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f70)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f70) (cf ?cf-result)))
   (assert (rule-fired (id r143)))
)

; r144: специализация геймдев + навыки дизайна => профиль разработчик игр
(defrule r144
   (not (rule-fired (id r144)))
   (known (id f60) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f42) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f71)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f71) (cf ?cf-result)))
   (assert (rule-fired (id r144)))
)

; r145: специализация геймдев + навыки анализа => профиль разработчик игр
(defrule r145
   (not (rule-fired (id r145)))
   (known (id f60) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f71)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f71) (cf ?cf-result)))
   (assert (rule-fired (id r145)))
)

; r146: специализация геймдев + командная работа => профиль разработчик игр
(defrule r146
   (not (rule-fired (id r146)))
   (known (id f60) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f21) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f71)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f71) (cf ?cf-result)))
   (assert (rule-fired (id r146)))
)

; r147: педагогическая + навыки коммуникации + навыки программирования => профиль технический писатель
(defrule r147
   (not (rule-fired (id r147)))
   (known (id f38) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f39) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f72)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.9))
   (assert (known (id f72) (cf ?cf-result)))
   (assert (rule-fired (id r147)))
)

; r148: навыки анализа + навыки коммуникации + английский => профиль технический писатель
(defrule r148
   (not (rule-fired (id r148)))
   (known (id f45) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f25) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f72)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.88))
   (assert (known (id f72) (cf ?cf-result)))
   (assert (rule-fired (id r148)))
)

; r149: педагогическая + навыки анализа + усидчивость => профиль технический писатель
(defrule r149
   (not (rule-fired (id r149)))
   (known (id f38) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f45) (cf ?c1&:(neq ?c1 0.0)))
   (known (id f18) (cf ?c2&:(neq ?c2 0.0)))
   (not (known (id f72)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1 ?c2) 0.85))
   (assert (known (id f72) (cf ?cf-result)))
   (assert (rule-fired (id r149)))
)

; r150: профиль серверный разработчик + командная работа => направление Разработка ПО
(defrule r150
   (not (rule-fired (id r150)))
   (known (id f61) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f21) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f73)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f73) (cf ?cf-result)))
   (assert (rule-fired (id r150)))
)

; r151: профиль веб-разработчик + командная работа => направление Разработка ПО
(defrule r151
   (not (rule-fired (id r151)))
   (known (id f62) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f21) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f73)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f73) (cf ?cf-result)))
   (assert (rule-fired (id r151)))
)

; r152: профиль мобильный разработчик + командная работа => направление Разработка ПО
(defrule r152
   (not (rule-fired (id r152)))
   (known (id f70) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f21) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f73)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.86))
   (assert (known (id f73) (cf ?cf-result)))
   (assert (rule-fired (id r152)))
)

; r153: специализация fullstack + навыки управления => направление Разработка ПО
(defrule r153
   (not (rule-fired (id r153)))
   (known (id f51) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f43) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f73)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.84))
   (assert (known (id f73) (cf ?cf-result)))
   (assert (rule-fired (id r153)))
)

; r154: профиль аналитик данных + исследовательская => направление Аналитика и Data Science
(defrule r154
   (not (rule-fired (id r154)))
   (known (id f63) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f36) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f74)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f74) (cf ?cf-result)))
   (assert (rule-fired (id r154)))
)

; r155: профиль системный аналитик + навыки работы с данными => направление Аналитика и Data Science
(defrule r155
   (not (rule-fired (id r155)))
   (known (id f68) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f40) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f74)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f74) (cf ?cf-result)))
   (assert (rule-fired (id r155)))
)

; r156: специализация data science + навыки управления => направление Аналитика и Data Science
(defrule r156
   (not (rule-fired (id r156)))
   (known (id f52) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f43) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f74)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f74) (cf ?cf-result)))
   (assert (rule-fired (id r156)))
)

; r157: профиль инженер DevOps + командная работа => направление Инфраструктура и DevOps
(defrule r157
   (not (rule-fired (id r157)))
   (known (id f64) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f21) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f75)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f75) (cf ?cf-result)))
   (assert (rule-fired (id r157)))
)

; r158: профиль инженер DevOps + навыки безопасности => направление Инфраструктура и DevOps
(defrule r158
   (not (rule-fired (id r158)))
   (known (id f64) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f46) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f75)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f75) (cf ?cf-result)))
   (assert (rule-fired (id r158)))
)

; r159: специализация DevOps + навыки управления => направление Инфраструктура и DevOps
(defrule r159
   (not (rule-fired (id r159)))
   (known (id f53) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f43) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f75)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f75) (cf ?cf-result)))
   (assert (rule-fired (id r159)))
)

; r160: профиль специалист по ИБ + навыки управления => направление Информационная безопасность
(defrule r160
   (not (rule-fired (id r160)))
   (known (id f65) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f43) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f76)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f76) (cf ?cf-result)))
   (assert (rule-fired (id r160)))
)

; r161: профиль специалист по ИБ + исследовательская => направление Информационная безопасность
(defrule r161
   (not (rule-fired (id r161)))
   (known (id f65) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f36) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f76)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f76) (cf ?cf-result)))
   (assert (rule-fired (id r161)))
)

; r162: специализация ИБ + профиль инженер DevOps => направление Информационная безопасность
(defrule r162
   (not (rule-fired (id r162)))
   (known (id f54) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f64) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f76)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f76) (cf ?cf-result)))
   (assert (rule-fired (id r162)))
)

; r163: профиль дизайнер интерфейсов + навыки управления => направление Дизайн и UX
(defrule r163
   (not (rule-fired (id r163)))
   (known (id f66) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f43) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f77)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f77) (cf ?cf-result)))
   (assert (rule-fired (id r163)))
)

; r164: профиль дизайнер интерфейсов + исследовательская => направление Дизайн и UX
(defrule r164
   (not (rule-fired (id r164)))
   (known (id f66) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f36) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f77)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f77) (cf ?cf-result)))
   (assert (rule-fired (id r164)))
)

; r165: специализация UX/UI + профиль веб-разработчик => направление Дизайн и UX
(defrule r165
   (not (rule-fired (id r165)))
   (known (id f55) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f62) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f77)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f77) (cf ?cf-result)))
   (assert (rule-fired (id r165)))
)

; r166: профиль менеджер проектов + навыки коммуникации => направление Управление в IT
(defrule r166
   (not (rule-fired (id r166)))
   (known (id f67) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f44) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f78)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f78) (cf ?cf-result)))
   (assert (rule-fired (id r166)))
)

; r167: профиль системный аналитик + навыки управления => направление Управление в IT
(defrule r167
   (not (rule-fired (id r167)))
   (known (id f68) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f43) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f78)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f78) (cf ?cf-result)))
   (assert (rule-fired (id r167)))
)

; r168: профиль технический писатель + навыки управления => направление Управление в IT
(defrule r168
   (not (rule-fired (id r168)))
   (known (id f72) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f43) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f78)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f78) (cf ?cf-result)))
   (assert (rule-fired (id r168)))
)

; r169: специализация управление проектами + профиль аналитик данных => направление Управление в IT
(defrule r169
   (not (rule-fired (id r169)))
   (known (id f56) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f63) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f78)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.83))
   (assert (known (id f78) (cf ?cf-result)))
   (assert (rule-fired (id r169)))
)

; r170: профиль разработчик игр + командная работа => направление Игровая индустрия
(defrule r170
   (not (rule-fired (id r170)))
   (known (id f71) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f21) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f79)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f79) (cf ?cf-result)))
   (assert (rule-fired (id r170)))
)

; r171: профиль разработчик игр + навыки дизайна => направление Игровая индустрия
(defrule r171
   (not (rule-fired (id r171)))
   (known (id f71) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f42) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f79)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f79) (cf ?cf-result)))
   (assert (rule-fired (id r171)))
)

; r172: специализация геймдев + профиль дизайнер интерфейсов => направление Игровая индустрия
(defrule r172
   (not (rule-fired (id r172)))
   (known (id f60) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f66) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f79)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f79) (cf ?cf-result)))
   (assert (rule-fired (id r172)))
)

; r173: профиль ML-инженер + исследовательская => направление Искусственный интеллект
(defrule r173
   (not (rule-fired (id r173)))
   (known (id f69) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f36) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f80)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.9))
   (assert (known (id f80) (cf ?cf-result)))
   (assert (rule-fired (id r173)))
)

; r174: профиль ML-инженер + навыки работы с данными => направление Искусственный интеллект
(defrule r174
   (not (rule-fired (id r174)))
   (known (id f69) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f40) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f80)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.88))
   (assert (known (id f80) (cf ?cf-result)))
   (assert (rule-fired (id r174)))
)

; r175: специализация ML + профиль аналитик данных => направление Искусственный интеллект
(defrule r175
   (not (rule-fired (id r175)))
   (known (id f58) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f63) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f80)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f80) (cf ?cf-result)))
   (assert (rule-fired (id r175)))
)

; r176: профиль ML-инженер + профиль серверный разработчик => направление Искусственный интеллект
(defrule r176
   (not (rule-fired (id r176)))
   (known (id f69) (cf ?c0&:(neq ?c0 0.0)))
   (known (id f61) (cf ?c1&:(neq ?c1 0.0)))
   (not (known (id f80)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.83))
   (assert (known (id f80) (cf ?cf-result)))
   (assert (rule-fired (id r176)))
)

; =====================================================
; ДОПОЛНИТЕЛЬНЫЕ ПРАВИЛА: Направления из специализаций
; (для случаев, когда профили не выведены)
; =====================================================

; r177: специализация PM + навыки управления => направление УПРАВЛЕНИЕ ПРОЕКТАМИ
(defrule r177
   (not (rule-fired (id r177)))
   (known (id f56) (cf ?c0&:(> ?c0 0.0)))
   (known (id f43) (cf ?c1&:(> ?c1 0.0)))
   (not (known (id f78)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f78) (cf ?cf-result)))
   (assert (rule-fired (id r177)))
)

; r178: специализация PM + навыки коммуникации => направление УПРАВЛЕНИЕ ПРОЕКТАМИ
(defrule r178
   (not (rule-fired (id r178)))
   (known (id f56) (cf ?c0&:(> ?c0 0.0)))
   (known (id f44) (cf ?c1&:(> ?c1 0.0)))
   (not (known (id f78)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.82))
   (assert (known (id f78) (cf ?cf-result)))
   (assert (rule-fired (id r178)))
)

; r179: специализация UI/UX + навыки дизайна => направление ДИЗАЙН И UX
(defrule r179
   (not (rule-fired (id r179)))
   (known (id f55) (cf ?c0&:(> ?c0 0.0)))
   (known (id f42) (cf ?c1&:(> ?c1 0.0)))
   (not (known (id f77)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.85))
   (assert (known (id f77) (cf ?cf-result)))
   (assert (rule-fired (id r179)))
)

; r180: специализация UI/UX + навыки коммуникации => направление ДИЗАЙН И UX
(defrule r180
   (not (rule-fired (id r180)))
   (known (id f55) (cf ?c0&:(> ?c0 0.0)))
   (known (id f44) (cf ?c1&:(> ?c1 0.0)))
   (not (known (id f77)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.80))
   (assert (known (id f77) (cf ?cf-result)))
   (assert (rule-fired (id r180)))
)

; r181: управленческая склонность + коммуникативная => направление УПРАВЛЕНИЕ ПРОЕКТАМИ (прямой путь)
(defrule r181
   (not (rule-fired (id r181)))
   (known (id f34) (cf ?c0&:(> ?c0 0.0)))
   (known (id f35) (cf ?c1&:(> ?c1 0.0)))
   (not (known (id f78)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.75))
   (assert (known (id f78) (cf ?cf-result)))
   (assert (rule-fired (id r181)))
)

; r182: творческая склонность + коммуникативная => направление ДИЗАЙН И UX (прямой путь)
(defrule r182
   (not (rule-fired (id r182)))
   (known (id f33) (cf ?c0&:(> ?c0 0.0)))
   (known (id f35) (cf ?c1&:(> ?c1 0.0)))
   (not (known (id f77)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.75))
   (assert (known (id f77) (cf ?cf-result)))
   (assert (rule-fired (id r182)))
)

; r183: предпринимательская + управленческая => направление УПРАВЛЕНИЕ ПРОЕКТАМИ
(defrule r183
   (not (rule-fired (id r183)))
   (known (id f37) (cf ?c0&:(> ?c0 0.0)))
   (known (id f34) (cf ?c1&:(> ?c1 0.0)))
   (not (known (id f78)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.78))
   (assert (known (id f78) (cf ?cf-result)))
   (assert (rule-fired (id r183)))
)

; r184: творческая + навыки дизайна => направление ДИЗАЙН И UX
(defrule r184
   (not (rule-fired (id r184)))
   (known (id f33) (cf ?c0&:(> ?c0 0.0)))
   (known (id f42) (cf ?c1&:(> ?c1 0.0)))
   (not (known (id f77)))
 =>
   (bind ?cf-result (* (min ?c0 ?c1) 0.80))
   (assert (known (id f77) (cf ?cf-result)))
   (assert (rule-fired (id r184)))
)

