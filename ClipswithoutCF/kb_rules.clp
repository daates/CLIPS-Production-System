; =====================================================
; kb_rules.clp - Логические правила вывода
; Версия без коэффициентов уверенности
; =====================================================

(defrule r1
   ; программирование + логика => техническая склонность
   (not (rule-fired (id r1)))
   (known (id f1))
   (known (id f16))
 =>
   (assert (known (id f31)))
   (assert (rule-fired (id r1)))
)

(defrule r2
   ; программирование + компьютер => техническая склонность
   (not (rule-fired (id r2)))
   (known (id f1))
   (known (id f24))
 =>
   (assert (known (id f31)))
   (assert (rule-fired (id r2)))
)

(defrule r3
   ; администрирование + логика => техническая склонность
   (not (rule-fired (id r3)))
   (known (id f3))
   (known (id f16))
 =>
   (assert (known (id f31)))
   (assert (rule-fired (id r3)))
)

(defrule r4
   ; автоматизация + логика => техническая склонность
   (not (rule-fired (id r4)))
   (known (id f11))
   (known (id f16))
 =>
   (assert (known (id f31)))
   (assert (rule-fired (id r4)))
)

(defrule r5
   ; кибербезопасность + компьютер => техническая склонность
   (not (rule-fired (id r5)))
   (known (id f9))
   (known (id f24))
 =>
   (assert (known (id f31)))
   (assert (rule-fired (id r5)))
)

(defrule r6
   ; данные + аналитика => аналитическая склонность
   (not (rule-fired (id r6)))
   (known (id f2))
   (known (id f27))
 =>
   (assert (known (id f32)))
   (assert (rule-fired (id r6)))
)

(defrule r7
   ; наука + логика => аналитическая склонность
   (not (rule-fired (id r7)))
   (known (id f10))
   (known (id f16))
 =>
   (assert (known (id f32)))
   (assert (rule-fired (id r7)))
)

(defrule r8
   ; данные + математика => аналитическая склонность
   (not (rule-fired (id r8)))
   (known (id f2))
   (known (id f26))
 =>
   (assert (known (id f32)))
   (assert (rule-fired (id r8)))
)

(defrule r9
   ; ИИ + аналитика => аналитическая склонность
   (not (rule-fired (id r9)))
   (known (id f15))
   (known (id f27))
 =>
   (assert (known (id f32)))
   (assert (rule-fired (id r9)))
)

(defrule r10
   ; наука + усидчивость => аналитическая склонность
   (not (rule-fired (id r10)))
   (known (id f10))
   (known (id f18))
 =>
   (assert (known (id f32)))
   (assert (rule-fired (id r10)))
)

(defrule r11
   ; дизайн + креатив => творческая склонность
   (not (rule-fired (id r11)))
   (known (id f4))
   (known (id f17))
 =>
   (assert (known (id f33)))
   (assert (rule-fired (id r11)))
)

(defrule r12
   ; веб + креатив => творческая склонность
   (not (rule-fired (id r12)))
   (known (id f13))
   (known (id f17))
 =>
   (assert (known (id f33)))
   (assert (rule-fired (id r12)))
)

(defrule r13
   ; геймдев + креатив => творческая склонность
   (not (rule-fired (id r13)))
   (known (id f14))
   (known (id f17))
 =>
   (assert (known (id f33)))
   (assert (rule-fired (id r13)))
)

(defrule r14
   ; дизайн + перфекционизм => творческая склонность
   (not (rule-fired (id r14)))
   (known (id f4))
   (known (id f30))
 =>
   (assert (known (id f33)))
   (assert (rule-fired (id r14)))
)

(defrule r15
   ; маркетинг + креатив => творческая склонность
   (not (rule-fired (id r15)))
   (known (id f8))
   (known (id f17))
 =>
   (assert (known (id f33)))
   (assert (rule-fired (id r15)))
)

(defrule r16
   ; бизнес + организация => управленческая склонность
   (not (rule-fired (id r16)))
   (known (id f5))
   (known (id f20))
 =>
   (assert (known (id f34)))
   (assert (rule-fired (id r16)))
)

(defrule r17
   ; бизнес + командная работа => управленческая склонность
   (not (rule-fired (id r17)))
   (known (id f5))
   (known (id f21))
 =>
   (assert (known (id f34)))
   (assert (rule-fired (id r17)))
)

(defrule r18
   ; организация + коммуникабельность => управленческая склонность
   (not (rule-fired (id r18)))
   (known (id f20))
   (known (id f19))
 =>
   (assert (known (id f34)))
   (assert (rule-fired (id r18)))
)

(defrule r19
   ; бизнес + стресс => управленческая склонность
   (not (rule-fired (id r19)))
   (known (id f5))
   (known (id f23))
 =>
   (assert (known (id f34)))
   (assert (rule-fired (id r19)))
)

(defrule r20
   ; организация + самодисциплина => управленческая склонность
   (not (rule-fired (id r20)))
   (known (id f20))
   (known (id f22))
 =>
   (assert (known (id f34)))
   (assert (rule-fired (id r20)))
)

(defrule r21
   ; помощь + коммуникабельность => коммуникативная склонность
   (not (rule-fired (id r21)))
   (known (id f6))
   (known (id f19))
 =>
   (assert (known (id f35)))
   (assert (rule-fired (id r21)))
)

(defrule r22
   ; обучение + коммуникабельность => коммуникативная склонность
   (not (rule-fired (id r22)))
   (known (id f7))
   (known (id f19))
 =>
   (assert (known (id f35)))
   (assert (rule-fired (id r22)))
)

(defrule r23
   ; маркетинг + коммуникабельность => коммуникативная склонность
   (not (rule-fired (id r23)))
   (known (id f8))
   (known (id f19))
 =>
   (assert (known (id f35)))
   (assert (rule-fired (id r23)))
)

(defrule r24
   ; командная работа + коммуникабельность => коммуникативная склонность
   (not (rule-fired (id r24)))
   (known (id f21))
   (known (id f19))
 =>
   (assert (known (id f35)))
   (assert (rule-fired (id r24)))
)

(defrule r25
   ; помощь + терпеливость => коммуникативная склонность
   (not (rule-fired (id r25)))
   (known (id f6))
   (known (id f29))
 =>
   (assert (known (id f35)))
   (assert (rule-fired (id r25)))
)

(defrule r26
   ; наука + самообучение => исследовательская склонность
   (not (rule-fired (id r26)))
   (known (id f10))
   (known (id f28))
 =>
   (assert (known (id f36)))
   (assert (rule-fired (id r26)))
)

(defrule r27
   ; ИИ + наука => исследовательская склонность
   (not (rule-fired (id r27)))
   (known (id f15))
   (known (id f10))
 =>
   (assert (known (id f36)))
   (assert (rule-fired (id r27)))
)

(defrule r28
   ; данные + наука => исследовательская склонность
   (not (rule-fired (id r28)))
   (known (id f2))
   (known (id f10))
 =>
   (assert (known (id f36)))
   (assert (rule-fired (id r28)))
)

(defrule r29
   ; наука + математика => исследовательская склонность
   (not (rule-fired (id r29)))
   (known (id f10))
   (known (id f26))
 =>
   (assert (known (id f36)))
   (assert (rule-fired (id r29)))
)

(defrule r30
   ; ИИ + математика => исследовательская склонность
   (not (rule-fired (id r30)))
   (known (id f15))
   (known (id f26))
 =>
   (assert (known (id f36)))
   (assert (rule-fired (id r30)))
)

(defrule r31
   ; бизнес + самодисциплина => предпринимательская склонность
   (not (rule-fired (id r31)))
   (known (id f5))
   (known (id f22))
 =>
   (assert (known (id f37)))
   (assert (rule-fired (id r31)))
)

(defrule r32
   ; маркетинг + бизнес => предпринимательская склонность
   (not (rule-fired (id r32)))
   (known (id f8))
   (known (id f5))
 =>
   (assert (known (id f37)))
   (assert (rule-fired (id r32)))
)

(defrule r33
   ; бизнес + стресс => предпринимательская склонность
   (not (rule-fired (id r33)))
   (known (id f5))
   (known (id f23))
 =>
   (assert (known (id f37)))
   (assert (rule-fired (id r33)))
)

(defrule r34
   ; бизнес + английский => предпринимательская склонность
   (not (rule-fired (id r34)))
   (known (id f5))
   (known (id f25))
 =>
   (assert (known (id f37)))
   (assert (rule-fired (id r34)))
)

(defrule r35
   ; обучение + терпеливость => педагогическая склонность
   (not (rule-fired (id r35)))
   (known (id f7))
   (known (id f29))
 =>
   (assert (known (id f38)))
   (assert (rule-fired (id r35)))
)

(defrule r36
   ; обучение + коммуникабельность => педагогическая склонность
   (not (rule-fired (id r36)))
   (known (id f7))
   (known (id f19))
 =>
   (assert (known (id f38)))
   (assert (rule-fired (id r36)))
)

(defrule r37
   ; помощь + обучение => педагогическая склонность
   (not (rule-fired (id r37)))
   (known (id f6))
   (known (id f7))
 =>
   (assert (known (id f38)))
   (assert (rule-fired (id r37)))
)

(defrule r38
   ; обучение + самообучение => педагогическая склонность
   (not (rule-fired (id r38)))
   (known (id f7))
   (known (id f28))
 =>
   (assert (known (id f38)))
   (assert (rule-fired (id r38)))
)

(defrule r39
   ; техническая + программирование => навыки программирования
   (not (rule-fired (id r39)))
   (known (id f31))
   (known (id f1))
 =>
   (assert (known (id f39)))
   (assert (rule-fired (id r39)))
)

(defrule r40
   ; техническая + логика + усидчивость => навыки программирования
   (not (rule-fired (id r40)))
   (known (id f31))
   (known (id f16))
   (known (id f18))
 =>
   (assert (known (id f39)))
   (assert (rule-fired (id r40)))
)

(defrule r41
   ; техническая + самообучение => навыки программирования
   (not (rule-fired (id r41)))
   (known (id f31))
   (known (id f28))
 =>
   (assert (known (id f39)))
   (assert (rule-fired (id r41)))
)

(defrule r42
   ; техническая + английский => навыки программирования
   (not (rule-fired (id r42)))
   (known (id f31))
   (known (id f25))
 =>
   (assert (known (id f39)))
   (assert (rule-fired (id r42)))
)

(defrule r43
   ; аналитическая + данные => навыки работы с данными
   (not (rule-fired (id r43)))
   (known (id f32))
   (known (id f2))
 =>
   (assert (known (id f40)))
   (assert (rule-fired (id r43)))
)

(defrule r44
   ; аналитическая + математика => навыки работы с данными
   (not (rule-fired (id r44)))
   (known (id f32))
   (known (id f26))
 =>
   (assert (known (id f40)))
   (assert (rule-fired (id r44)))
)

(defrule r45
   ; исследовательская + данные => навыки работы с данными
   (not (rule-fired (id r45)))
   (known (id f36))
   (known (id f2))
 =>
   (assert (known (id f40)))
   (assert (rule-fired (id r45)))
)

(defrule r46
   ; аналитическая + усидчивость => навыки работы с данными
   (not (rule-fired (id r46)))
   (known (id f32))
   (known (id f18))
 =>
   (assert (known (id f40)))
   (assert (rule-fired (id r46)))
)

(defrule r47
   ; техническая + администрирование => навыки администрирования
   (not (rule-fired (id r47)))
   (known (id f31))
   (known (id f3))
 =>
   (assert (known (id f41)))
   (assert (rule-fired (id r47)))
)

(defrule r48
   ; техническая + автоматизация => навыки администрирования
   (not (rule-fired (id r48)))
   (known (id f31))
   (known (id f11))
 =>
   (assert (known (id f41)))
   (assert (rule-fired (id r48)))
)

(defrule r49
   ; техническая + стресс => навыки администрирования
   (not (rule-fired (id r49)))
   (known (id f31))
   (known (id f23))
 =>
   (assert (known (id f41)))
   (assert (rule-fired (id r49)))
)

(defrule r50
   ; техническая + самодисциплина => навыки администрирования
   (not (rule-fired (id r50)))
   (known (id f31))
   (known (id f22))
 =>
   (assert (known (id f41)))
   (assert (rule-fired (id r50)))
)

(defrule r51
   ; творческая + дизайн => навыки дизайна
   (not (rule-fired (id r51)))
   (known (id f33))
   (known (id f4))
 =>
   (assert (known (id f42)))
   (assert (rule-fired (id r51)))
)

(defrule r52
   ; творческая + перфекционизм => навыки дизайна
   (not (rule-fired (id r52)))
   (known (id f33))
   (known (id f30))
 =>
   (assert (known (id f42)))
   (assert (rule-fired (id r52)))
)

(defrule r53
   ; творческая + усидчивость => навыки дизайна
   (not (rule-fired (id r53)))
   (known (id f33))
   (known (id f18))
 =>
   (assert (known (id f42)))
   (assert (rule-fired (id r53)))
)

(defrule r54
   ; коммуникативная + дизайн => навыки дизайна
   (not (rule-fired (id r54)))
   (known (id f35))
   (known (id f4))
 =>
   (assert (known (id f42)))
   (assert (rule-fired (id r54)))
)

(defrule r55
   ; управленческая + организация => навыки управления
   (not (rule-fired (id r55)))
   (known (id f34))
   (known (id f20))
 =>
   (assert (known (id f43)))
   (assert (rule-fired (id r55)))
)

(defrule r56
   ; управленческая + командная работа => навыки управления
   (not (rule-fired (id r56)))
   (known (id f34))
   (known (id f21))
 =>
   (assert (known (id f43)))
   (assert (rule-fired (id r56)))
)

(defrule r57
   ; предпринимательская + организация => навыки управления
   (not (rule-fired (id r57)))
   (known (id f37))
   (known (id f20))
 =>
   (assert (known (id f43)))
   (assert (rule-fired (id r57)))
)

(defrule r58
   ; управленческая + стресс => навыки управления
   (not (rule-fired (id r58)))
   (known (id f34))
   (known (id f23))
 =>
   (assert (known (id f43)))
   (assert (rule-fired (id r58)))
)

(defrule r59
   ; коммуникативная + помощь => навыки коммуникации
   (not (rule-fired (id r59)))
   (known (id f35))
   (known (id f6))
 =>
   (assert (known (id f44)))
   (assert (rule-fired (id r59)))
)

(defrule r60
   ; коммуникативная + командная работа => навыки коммуникации
   (not (rule-fired (id r60)))
   (known (id f35))
   (known (id f21))
 =>
   (assert (known (id f44)))
   (assert (rule-fired (id r60)))
)

(defrule r61
   ; педагогическая + коммуникабельность => навыки коммуникации
   (not (rule-fired (id r61)))
   (known (id f38))
   (known (id f19))
 =>
   (assert (known (id f44)))
   (assert (rule-fired (id r61)))
)

(defrule r62
   ; управленческая + коммуникабельность => навыки коммуникации
   (not (rule-fired (id r62)))
   (known (id f34))
   (known (id f19))
 =>
   (assert (known (id f44)))
   (assert (rule-fired (id r62)))
)

(defrule r63
   ; аналитическая + логика => навыки анализа
   (not (rule-fired (id r63)))
   (known (id f32))
   (known (id f16))
 =>
   (assert (known (id f45)))
   (assert (rule-fired (id r63)))
)

(defrule r64
   ; исследовательская + логика => навыки анализа
   (not (rule-fired (id r64)))
   (known (id f36))
   (known (id f16))
 =>
   (assert (known (id f45)))
   (assert (rule-fired (id r64)))
)

(defrule r65
   ; аналитическая + аналитика => навыки анализа
   (not (rule-fired (id r65)))
   (known (id f32))
   (known (id f27))
 =>
   (assert (known (id f45)))
   (assert (rule-fired (id r65)))
)

(defrule r66
   ; техническая + аналитика => навыки анализа
   (not (rule-fired (id r66)))
   (known (id f31))
   (known (id f27))
 =>
   (assert (known (id f45)))
   (assert (rule-fired (id r66)))
)

(defrule r67
   ; техническая + кибербезопасность => навыки безопасности
   (not (rule-fired (id r67)))
   (known (id f31))
   (known (id f9))
 =>
   (assert (known (id f46)))
   (assert (rule-fired (id r67)))
)

(defrule r68
   ; аналитическая + кибербезопасность => навыки безопасности
   (not (rule-fired (id r68)))
   (known (id f32))
   (known (id f9))
 =>
   (assert (known (id f46)))
   (assert (rule-fired (id r68)))
)

(defrule r69
   ; техническая + перфекционизм => навыки безопасности
   (not (rule-fired (id r69)))
   (known (id f31))
   (known (id f30))
 =>
   (assert (known (id f46)))
   (assert (rule-fired (id r69)))
)

(defrule r70
   ; техническая + стресс => навыки безопасности
   (not (rule-fired (id r70)))
   (known (id f31))
   (known (id f23))
 =>
   (assert (known (id f46)))
   (assert (rule-fired (id r70)))
)

(defrule r71
   ; навыки программирования + веб => навыки веб-разработки
   (not (rule-fired (id r71)))
   (known (id f39))
   (known (id f13))
 =>
   (assert (known (id f47)))
   (assert (rule-fired (id r71)))
)

(defrule r72
   ; творческая + навыки программирования => навыки веб-разработки
   (not (rule-fired (id r72)))
   (known (id f33))
   (known (id f39))
 =>
   (assert (known (id f47)))
   (assert (rule-fired (id r72)))
)

(defrule r73
   ; навыки программирования + дизайн => навыки веб-разработки
   (not (rule-fired (id r73)))
   (known (id f39))
   (known (id f4))
 =>
   (assert (known (id f47)))
   (assert (rule-fired (id r73)))
)

(defrule r74
   ; техническая + веб => навыки веб-разработки
   (not (rule-fired (id r74)))
   (known (id f31))
   (known (id f13))
 =>
   (assert (known (id f47)))
   (assert (rule-fired (id r74)))
)

(defrule r75
   ; навыки программирования + мобильные => навыки мобильной разработки
   (not (rule-fired (id r75)))
   (known (id f39))
   (known (id f12))
 =>
   (assert (known (id f48)))
   (assert (rule-fired (id r75)))
)

(defrule r76
   ; техническая + мобильные => навыки мобильной разработки
   (not (rule-fired (id r76)))
   (known (id f31))
   (known (id f12))
 =>
   (assert (known (id f48)))
   (assert (rule-fired (id r76)))
)

(defrule r77
   ; навыки программирования + усидчивость => навыки мобильной разработки
   (not (rule-fired (id r77)))
   (known (id f39))
   (known (id f18))
 =>
   (assert (known (id f48)))
   (assert (rule-fired (id r77)))
)

(defrule r78
   ; навыки программирования + навыки анализа => специализация backend
   (not (rule-fired (id r78)))
   (known (id f39))
   (known (id f45))
 =>
   (assert (known (id f49)))
   (assert (rule-fired (id r78)))
)

(defrule r79
   ; навыки программирования + логика + усидчивость => специализация backend
   (not (rule-fired (id r79)))
   (known (id f39))
   (known (id f16))
   (known (id f18))
 =>
   (assert (known (id f49)))
   (assert (rule-fired (id r79)))
)

(defrule r80
   ; навыки программирования + навыки администрирования => специализация backend
   (not (rule-fired (id r80)))
   (known (id f39))
   (known (id f41))
 =>
   (assert (known (id f49)))
   (assert (rule-fired (id r80)))
)

(defrule r81
   ; навыки веб-разработки + навыки дизайна => специализация frontend
   (not (rule-fired (id r81)))
   (known (id f47))
   (known (id f42))
 =>
   (assert (known (id f50)))
   (assert (rule-fired (id r81)))
)

(defrule r82
   ; навыки веб-разработки + творческая => специализация frontend
   (not (rule-fired (id r82)))
   (known (id f47))
   (known (id f33))
 =>
   (assert (known (id f50)))
   (assert (rule-fired (id r82)))
)

(defrule r83
   ; навыки программирования + навыки дизайна => специализация frontend
   (not (rule-fired (id r83)))
   (known (id f39))
   (known (id f42))
 =>
   (assert (known (id f50)))
   (assert (rule-fired (id r83)))
)

(defrule r84
   ; специализация backend + специализация frontend => специализация fullstack
   (not (rule-fired (id r84)))
   (known (id f49))
   (known (id f50))
 =>
   (assert (known (id f51)))
   (assert (rule-fired (id r84)))
)

(defrule r85
   ; навыки веб-разработки + навыки анализа + навыки программирования => специализация fullstack
   (not (rule-fired (id r85)))
   (known (id f47))
   (known (id f45))
   (known (id f39))
 =>
   (assert (known (id f51)))
   (assert (rule-fired (id r85)))
)

(defrule r86
   ; навыки работы с данными + навыки анализа => специализация data science
   (not (rule-fired (id r86)))
   (known (id f40))
   (known (id f45))
 =>
   (assert (known (id f52)))
   (assert (rule-fired (id r86)))
)

(defrule r87
   ; навыки работы с данными + исследовательская => специализация data science
   (not (rule-fired (id r87)))
   (known (id f40))
   (known (id f36))
 =>
   (assert (known (id f52)))
   (assert (rule-fired (id r87)))
)

(defrule r88
   ; навыки работы с данными + математика => специализация data science
   (not (rule-fired (id r88)))
   (known (id f40))
   (known (id f26))
 =>
   (assert (known (id f52)))
   (assert (rule-fired (id r88)))
)

(defrule r89
   ; аналитическая + навыки анализа + ИИ => специализация data science
   (not (rule-fired (id r89)))
   (known (id f32))
   (known (id f45))
   (known (id f15))
 =>
   (assert (known (id f52)))
   (assert (rule-fired (id r89)))
)

(defrule r90
   ; навыки администрирования + навыки программирования => специализация DevOps
   (not (rule-fired (id r90)))
   (known (id f41))
   (known (id f39))
 =>
   (assert (known (id f53)))
   (assert (rule-fired (id r90)))
)

(defrule r91
   ; навыки администрирования + автоматизация => специализация DevOps
   (not (rule-fired (id r91)))
   (known (id f41))
   (known (id f11))
 =>
   (assert (known (id f53)))
   (assert (rule-fired (id r91)))
)

(defrule r92
   ; техническая + навыки администрирования + стресс => специализация DevOps
   (not (rule-fired (id r92)))
   (known (id f31))
   (known (id f41))
   (known (id f23))
 =>
   (assert (known (id f53)))
   (assert (rule-fired (id r92)))
)

(defrule r93
   ; навыки безопасности + навыки администрирования => специализация ИБ
   (not (rule-fired (id r93)))
   (known (id f46))
   (known (id f41))
 =>
   (assert (known (id f54)))
   (assert (rule-fired (id r93)))
)

(defrule r94
   ; навыки безопасности + навыки анализа => специализация ИБ
   (not (rule-fired (id r94)))
   (known (id f46))
   (known (id f45))
 =>
   (assert (known (id f54)))
   (assert (rule-fired (id r94)))
)

(defrule r95
   ; техническая + навыки безопасности + перфекционизм => специализация ИБ
   (not (rule-fired (id r95)))
   (known (id f31))
   (known (id f46))
   (known (id f30))
 =>
   (assert (known (id f54)))
   (assert (rule-fired (id r95)))
)

(defrule r96
   ; навыки дизайна + навыки коммуникации => специализация UX/UI
   (not (rule-fired (id r96)))
   (known (id f42))
   (known (id f44))
 =>
   (assert (known (id f55)))
   (assert (rule-fired (id r96)))
)

(defrule r97
   ; навыки дизайна + навыки анализа => специализация UX/UI
   (not (rule-fired (id r97)))
   (known (id f42))
   (known (id f45))
 =>
   (assert (known (id f55)))
   (assert (rule-fired (id r97)))
)

(defrule r98
   ; творческая + навыки дизайна + коммуникабельность => специализация UX/UI
   (not (rule-fired (id r98)))
   (known (id f33))
   (known (id f42))
   (known (id f19))
 =>
   (assert (known (id f55)))
   (assert (rule-fired (id r98)))
)

(defrule r99
   ; навыки управления + навыки коммуникации => специализация управление проектами
   (not (rule-fired (id r99)))
   (known (id f43))
   (known (id f44))
 =>
   (assert (known (id f56)))
   (assert (rule-fired (id r99)))
)

(defrule r100
   ; навыки управления + навыки анализа => специализация управление проектами
   (not (rule-fired (id r100)))
   (known (id f43))
   (known (id f45))
 =>
   (assert (known (id f56)))
   (assert (rule-fired (id r100)))
)

(defrule r101
   ; управленческая + навыки коммуникации + стресс => специализация управление проектами
   (not (rule-fired (id r101)))
   (known (id f34))
   (known (id f44))
   (known (id f23))
 =>
   (assert (known (id f56)))
   (assert (rule-fired (id r101)))
)

(defrule r102
   ; навыки анализа + навыки коммуникации => специализация системный анализ
   (not (rule-fired (id r102)))
   (known (id f45))
   (known (id f44))
 =>
   (assert (known (id f57)))
   (assert (rule-fired (id r102)))
)

(defrule r103
   ; навыки анализа + навыки программирования => специализация системный анализ
   (not (rule-fired (id r103)))
   (known (id f45))
   (known (id f39))
 =>
   (assert (known (id f57)))
   (assert (rule-fired (id r103)))
)

(defrule r104
   ; аналитическая + навыки анализа + логика => специализация системный анализ
   (not (rule-fired (id r104)))
   (known (id f32))
   (known (id f45))
   (known (id f16))
 =>
   (assert (known (id f57)))
   (assert (rule-fired (id r104)))
)

(defrule r105
   ; специализация data science + ИИ => специализация ML
   (not (rule-fired (id r105)))
   (known (id f52))
   (known (id f15))
 =>
   (assert (known (id f58)))
   (assert (rule-fired (id r105)))
)

(defrule r106
   ; навыки работы с данными + исследовательская + ИИ => специализация ML
   (not (rule-fired (id r106)))
   (known (id f40))
   (known (id f36))
   (known (id f15))
 =>
   (assert (known (id f58)))
   (assert (rule-fired (id r106)))
)

(defrule r107
   ; специализация data science + математика => специализация ML
   (not (rule-fired (id r107)))
   (known (id f52))
   (known (id f26))
 =>
   (assert (known (id f58)))
   (assert (rule-fired (id r107)))
)

(defrule r108
   ; навыки мобильной разработки + навыки дизайна => специализация мобильная разработка
   (not (rule-fired (id r108)))
   (known (id f48))
   (known (id f42))
 =>
   (assert (known (id f59)))
   (assert (rule-fired (id r108)))
)

(defrule r109
   ; навыки мобильной разработки + навыки программирования => специализация мобильная разработка
   (not (rule-fired (id r109)))
   (known (id f48))
   (known (id f39))
 =>
   (assert (known (id f59)))
   (assert (rule-fired (id r109)))
)

(defrule r110
   ; навыки мобильной разработки + перфекционизм => специализация мобильная разработка
   (not (rule-fired (id r110)))
   (known (id f48))
   (known (id f30))
 =>
   (assert (known (id f59)))
   (assert (rule-fired (id r110)))
)

(defrule r111
   ; навыки программирования + творческая + геймдев => специализация геймдев
   (not (rule-fired (id r111)))
   (known (id f39))
   (known (id f33))
   (known (id f14))
 =>
   (assert (known (id f60)))
   (assert (rule-fired (id r111)))
)

(defrule r112
   ; навыки программирования + навыки дизайна + геймдев => специализация геймдев
   (not (rule-fired (id r112)))
   (known (id f39))
   (known (id f42))
   (known (id f14))
 =>
   (assert (known (id f60)))
   (assert (rule-fired (id r112)))
)

(defrule r113
   ; творческая + навыки программирования + математика => специализация геймдев
   (not (rule-fired (id r113)))
   (known (id f33))
   (known (id f39))
   (known (id f26))
 =>
   (assert (known (id f60)))
   (assert (rule-fired (id r113)))
)

(defrule r114
   ; специализация backend + навыки анализа => профиль серверный разработчик
   (not (rule-fired (id r114)))
   (known (id f49))
   (known (id f45))
 =>
   (assert (known (id f61)))
   (assert (rule-fired (id r114)))
)

(defrule r115
   ; специализация backend + навыки администрирования => профиль серверный разработчик
   (not (rule-fired (id r115)))
   (known (id f49))
   (known (id f41))
 =>
   (assert (known (id f61)))
   (assert (rule-fired (id r115)))
)

(defrule r116
   ; специализация backend + английский => профиль серверный разработчик
   (not (rule-fired (id r116)))
   (known (id f49))
   (known (id f25))
 =>
   (assert (known (id f61)))
   (assert (rule-fired (id r116)))
)

(defrule r117
   ; специализация frontend + навыки коммуникации => профиль веб-разработчик
   (not (rule-fired (id r117)))
   (known (id f50))
   (known (id f44))
 =>
   (assert (known (id f62)))
   (assert (rule-fired (id r117)))
)

(defrule r118
   ; специализация fullstack + навыки коммуникации => профиль веб-разработчик
   (not (rule-fired (id r118)))
   (known (id f51))
   (known (id f44))
 =>
   (assert (known (id f62)))
   (assert (rule-fired (id r118)))
)

(defrule r119
   ; специализация frontend + навыки дизайна => профиль веб-разработчик
   (not (rule-fired (id r119)))
   (known (id f50))
   (known (id f42))
 =>
   (assert (known (id f62)))
   (assert (rule-fired (id r119)))
)

(defrule r120
   ; специализация data science + навыки коммуникации => профиль аналитик данных
   (not (rule-fired (id r120)))
   (known (id f52))
   (known (id f44))
 =>
   (assert (known (id f63)))
   (assert (rule-fired (id r120)))
)

(defrule r121
   ; специализация data science + навыки управления => профиль аналитик данных
   (not (rule-fired (id r121)))
   (known (id f52))
   (known (id f43))
 =>
   (assert (known (id f63)))
   (assert (rule-fired (id r121)))
)

(defrule r122
   ; специализация системный анализ + навыки работы с данными => профиль аналитик данных
   (not (rule-fired (id r122)))
   (known (id f57))
   (known (id f40))
 =>
   (assert (known (id f63)))
   (assert (rule-fired (id r122)))
)

(defrule r123
   ; специализация DevOps + навыки безопасности => профиль инженер DevOps
   (not (rule-fired (id r123)))
   (known (id f53))
   (known (id f46))
 =>
   (assert (known (id f64)))
   (assert (rule-fired (id r123)))
)

(defrule r124
   ; специализация DevOps + навыки анализа => профиль инженер DevOps
   (not (rule-fired (id r124)))
   (known (id f53))
   (known (id f45))
 =>
   (assert (known (id f64)))
   (assert (rule-fired (id r124)))
)

(defrule r125
   ; специализация DevOps + стресс => профиль инженер DevOps
   (not (rule-fired (id r125)))
   (known (id f53))
   (known (id f23))
 =>
   (assert (known (id f64)))
   (assert (rule-fired (id r125)))
)

(defrule r126
   ; специализация ИБ + навыки анализа => профиль специалист по ИБ
   (not (rule-fired (id r126)))
   (known (id f54))
   (known (id f45))
 =>
   (assert (known (id f65)))
   (assert (rule-fired (id r126)))
)

(defrule r127
   ; специализация ИБ + специализация DevOps => профиль специалист по ИБ
   (not (rule-fired (id r127)))
   (known (id f54))
   (known (id f53))
 =>
   (assert (known (id f65)))
   (assert (rule-fired (id r127)))
)

(defrule r128
   ; специализация ИБ + английский => профиль специалист по ИБ
   (not (rule-fired (id r128)))
   (known (id f54))
   (known (id f25))
 =>
   (assert (known (id f65)))
   (assert (rule-fired (id r128)))
)

(defrule r129
   ; специализация UX/UI + навыки анализа => профиль дизайнер интерфейсов
   (not (rule-fired (id r129)))
   (known (id f55))
   (known (id f45))
 =>
   (assert (known (id f66)))
   (assert (rule-fired (id r129)))
)

(defrule r130
   ; специализация UX/UI + навыки веб-разработки => профиль дизайнер интерфейсов
   (not (rule-fired (id r130)))
   (known (id f55))
   (known (id f47))
 =>
   (assert (known (id f66)))
   (assert (rule-fired (id r130)))
)

(defrule r131
   ; специализация UX/UI + перфекционизм => профиль дизайнер интерфейсов
   (not (rule-fired (id r131)))
   (known (id f55))
   (known (id f30))
 =>
   (assert (known (id f66)))
   (assert (rule-fired (id r131)))
)

(defrule r132
   ; специализация управление проектами + навыки анализа => профиль менеджер проектов
   (not (rule-fired (id r132)))
   (known (id f56))
   (known (id f45))
 =>
   (assert (known (id f67)))
   (assert (rule-fired (id r132)))
)

(defrule r133
   ; специализация управление проектами + навыки программирования => профиль менеджер проектов
   (not (rule-fired (id r133)))
   (known (id f56))
   (known (id f39))
 =>
   (assert (known (id f67)))
   (assert (rule-fired (id r133)))
)

(defrule r134
   ; специализация управление проектами + английский => профиль менеджер проектов
   (not (rule-fired (id r134)))
   (known (id f56))
   (known (id f25))
 =>
   (assert (known (id f67)))
   (assert (rule-fired (id r134)))
)

(defrule r135
   ; специализация системный анализ + навыки коммуникации => профиль системный аналитик
   (not (rule-fired (id r135)))
   (known (id f57))
   (known (id f44))
 =>
   (assert (known (id f68)))
   (assert (rule-fired (id r135)))
)

(defrule r136
   ; специализация системный анализ + навыки управления => профиль системный аналитик
   (not (rule-fired (id r136)))
   (known (id f57))
   (known (id f43))
 =>
   (assert (known (id f68)))
   (assert (rule-fired (id r136)))
)

(defrule r137
   ; специализация системный анализ + навыки программирования => профиль системный аналитик
   (not (rule-fired (id r137)))
   (known (id f57))
   (known (id f39))
 =>
   (assert (known (id f68)))
   (assert (rule-fired (id r137)))
)

(defrule r138
   ; специализация ML + навыки программирования => профиль ML-инженер
   (not (rule-fired (id r138)))
   (known (id f58))
   (known (id f39))
 =>
   (assert (known (id f69)))
   (assert (rule-fired (id r138)))
)

(defrule r139
   ; специализация ML + исследовательская => профиль ML-инженер
   (not (rule-fired (id r139)))
   (known (id f58))
   (known (id f36))
 =>
   (assert (known (id f69)))
   (assert (rule-fired (id r139)))
)

(defrule r140
   ; специализация ML + английский => профиль ML-инженер
   (not (rule-fired (id r140)))
   (known (id f58))
   (known (id f25))
 =>
   (assert (known (id f69)))
   (assert (rule-fired (id r140)))
)

(defrule r141
   ; специализация мобильная разработка + навыки коммуникации => профиль мобильный разработчик
   (not (rule-fired (id r141)))
   (known (id f59))
   (known (id f44))
 =>
   (assert (known (id f70)))
   (assert (rule-fired (id r141)))
)

(defrule r142
   ; специализация мобильная разработка + навыки дизайна => профиль мобильный разработчик
   (not (rule-fired (id r142)))
   (known (id f59))
   (known (id f42))
 =>
   (assert (known (id f70)))
   (assert (rule-fired (id r142)))
)

(defrule r143
   ; специализация мобильная разработка + навыки анализа => профиль мобильный разработчик
   (not (rule-fired (id r143)))
   (known (id f59))
   (known (id f45))
 =>
   (assert (known (id f70)))
   (assert (rule-fired (id r143)))
)

(defrule r144
   ; специализация геймдев + навыки дизайна => профиль разработчик игр
   (not (rule-fired (id r144)))
   (known (id f60))
   (known (id f42))
 =>
   (assert (known (id f71)))
   (assert (rule-fired (id r144)))
)

(defrule r145
   ; специализация геймдев + навыки анализа => профиль разработчик игр
   (not (rule-fired (id r145)))
   (known (id f60))
   (known (id f45))
 =>
   (assert (known (id f71)))
   (assert (rule-fired (id r145)))
)

(defrule r146
   ; специализация геймдев + командная работа => профиль разработчик игр
   (not (rule-fired (id r146)))
   (known (id f60))
   (known (id f21))
 =>
   (assert (known (id f71)))
   (assert (rule-fired (id r146)))
)

(defrule r147
   ; педагогическая + навыки коммуникации + навыки программирования => профиль технический писатель
   (not (rule-fired (id r147)))
   (known (id f38))
   (known (id f44))
   (known (id f39))
 =>
   (assert (known (id f72)))
   (assert (rule-fired (id r147)))
)

(defrule r148
   ; навыки анализа + навыки коммуникации + английский => профиль технический писатель
   (not (rule-fired (id r148)))
   (known (id f45))
   (known (id f44))
   (known (id f25))
 =>
   (assert (known (id f72)))
   (assert (rule-fired (id r148)))
)

(defrule r149
   ; педагогическая + навыки анализа + усидчивость => профиль технический писатель
   (not (rule-fired (id r149)))
   (known (id f38))
   (known (id f45))
   (known (id f18))
 =>
   (assert (known (id f72)))
   (assert (rule-fired (id r149)))
)

(defrule r150
   ; профиль серверный разработчик + командная работа => направление Разработка ПО
   (not (rule-fired (id r150)))
   (known (id f61))
   (known (id f21))
 =>
   (assert (known (id f73)))
   (assert (rule-fired (id r150)))
)

(defrule r151
   ; профиль веб-разработчик + командная работа => направление Разработка ПО
   (not (rule-fired (id r151)))
   (known (id f62))
   (known (id f21))
 =>
   (assert (known (id f73)))
   (assert (rule-fired (id r151)))
)

(defrule r152
   ; профиль мобильный разработчик + командная работа => направление Разработка ПО
   (not (rule-fired (id r152)))
   (known (id f70))
   (known (id f21))
 =>
   (assert (known (id f73)))
   (assert (rule-fired (id r152)))
)

(defrule r153
   ; специализация fullstack + навыки управления => направление Разработка ПО
   (not (rule-fired (id r153)))
   (known (id f51))
   (known (id f43))
 =>
   (assert (known (id f73)))
   (assert (rule-fired (id r153)))
)

(defrule r154
   ; профиль аналитик данных + исследовательская => направление Аналитика и Data Science
   (not (rule-fired (id r154)))
   (known (id f63))
   (known (id f36))
 =>
   (assert (known (id f74)))
   (assert (rule-fired (id r154)))
)

(defrule r155
   ; профиль системный аналитик + навыки работы с данными => направление Аналитика и Data Science
   (not (rule-fired (id r155)))
   (known (id f68))
   (known (id f40))
 =>
   (assert (known (id f74)))
   (assert (rule-fired (id r155)))
)

(defrule r156
   ; специализация data science + навыки управления => направление Аналитика и Data Science
   (not (rule-fired (id r156)))
   (known (id f52))
   (known (id f43))
 =>
   (assert (known (id f74)))
   (assert (rule-fired (id r156)))
)

(defrule r157
   ; профиль инженер DevOps + командная работа => направление Инфраструктура и DevOps
   (not (rule-fired (id r157)))
   (known (id f64))
   (known (id f21))
 =>
   (assert (known (id f75)))
   (assert (rule-fired (id r157)))
)

(defrule r158
   ; профиль инженер DevOps + навыки безопасности => направление Инфраструктура и DevOps
   (not (rule-fired (id r158)))
   (known (id f64))
   (known (id f46))
 =>
   (assert (known (id f75)))
   (assert (rule-fired (id r158)))
)

(defrule r159
   ; специализация DevOps + навыки управления => направление Инфраструктура и DevOps
   (not (rule-fired (id r159)))
   (known (id f53))
   (known (id f43))
 =>
   (assert (known (id f75)))
   (assert (rule-fired (id r159)))
)

(defrule r160
   ; профиль специалист по ИБ + навыки управления => направление Информационная безопасность
   (not (rule-fired (id r160)))
   (known (id f65))
   (known (id f43))
 =>
   (assert (known (id f76)))
   (assert (rule-fired (id r160)))
)

(defrule r161
   ; профиль специалист по ИБ + исследовательская => направление Информационная безопасность
   (not (rule-fired (id r161)))
   (known (id f65))
   (known (id f36))
 =>
   (assert (known (id f76)))
   (assert (rule-fired (id r161)))
)

(defrule r162
   ; специализация ИБ + профиль инженер DevOps => направление Информационная безопасность
   (not (rule-fired (id r162)))
   (known (id f54))
   (known (id f64))
 =>
   (assert (known (id f76)))
   (assert (rule-fired (id r162)))
)

(defrule r163
   ; профиль дизайнер интерфейсов + навыки управления => направление Дизайн и UX
   (not (rule-fired (id r163)))
   (known (id f66))
   (known (id f43))
 =>
   (assert (known (id f77)))
   (assert (rule-fired (id r163)))
)

(defrule r164
   ; профиль дизайнер интерфейсов + исследовательская => направление Дизайн и UX
   (not (rule-fired (id r164)))
   (known (id f66))
   (known (id f36))
 =>
   (assert (known (id f77)))
   (assert (rule-fired (id r164)))
)

(defrule r165
   ; специализация UX/UI + профиль веб-разработчик => направление Дизайн и UX
   (not (rule-fired (id r165)))
   (known (id f55))
   (known (id f62))
 =>
   (assert (known (id f77)))
   (assert (rule-fired (id r165)))
)

(defrule r166
   ; профиль менеджер проектов + навыки коммуникации => направление Управление в IT
   (not (rule-fired (id r166)))
   (known (id f67))
   (known (id f44))
 =>
   (assert (known (id f78)))
   (assert (rule-fired (id r166)))
)

(defrule r167
   ; профиль системный аналитик + навыки управления => направление Управление в IT
   (not (rule-fired (id r167)))
   (known (id f68))
   (known (id f43))
 =>
   (assert (known (id f78)))
   (assert (rule-fired (id r167)))
)

(defrule r168
   ; профиль технический писатель + навыки управления => направление Управление в IT
   (not (rule-fired (id r168)))
   (known (id f72))
   (known (id f43))
 =>
   (assert (known (id f78)))
   (assert (rule-fired (id r168)))
)

(defrule r169
   ; специализация управление проектами + профиль аналитик данных => направление Управление в IT
   (not (rule-fired (id r169)))
   (known (id f56))
   (known (id f63))
 =>
   (assert (known (id f78)))
   (assert (rule-fired (id r169)))
)

(defrule r170
   ; профиль разработчик игр + командная работа => направление Игровая индустрия
   (not (rule-fired (id r170)))
   (known (id f71))
   (known (id f21))
 =>
   (assert (known (id f79)))
   (assert (rule-fired (id r170)))
)

(defrule r171
   ; профиль разработчик игр + навыки дизайна => направление Игровая индустрия
   (not (rule-fired (id r171)))
   (known (id f71))
   (known (id f42))
 =>
   (assert (known (id f79)))
   (assert (rule-fired (id r171)))
)

(defrule r172
   ; специализация геймдев + профиль дизайнер интерфейсов => направление Игровая индустрия
   (not (rule-fired (id r172)))
   (known (id f60))
   (known (id f66))
 =>
   (assert (known (id f79)))
   (assert (rule-fired (id r172)))
)

(defrule r173
   ; профиль ML-инженер + исследовательская => направление Искусственный интеллект
   (not (rule-fired (id r173)))
   (known (id f69))
   (known (id f36))
 =>
   (assert (known (id f80)))
   (assert (rule-fired (id r173)))
)

(defrule r174
   ; профиль ML-инженер + навыки работы с данными => направление Искусственный интеллект
   (not (rule-fired (id r174)))
   (known (id f69))
   (known (id f40))
 =>
   (assert (known (id f80)))
   (assert (rule-fired (id r174)))
)

(defrule r175
   ; специализация ML + профиль аналитик данных => направление Искусственный интеллект
   (not (rule-fired (id r175)))
   (known (id f58))
   (known (id f63))
 =>
   (assert (known (id f80)))
   (assert (rule-fired (id r175)))
)

(defrule r176
   ; профиль ML-инженер + профиль серверный разработчик => направление Искусственный интеллект
   (not (rule-fired (id r176)))
   (known (id f69))
   (known (id f61))
 =>
   (assert (known (id f80)))
   (assert (rule-fired (id r176)))
)

