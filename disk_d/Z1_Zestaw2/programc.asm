;=============================================================================;
;                                                                             ;
; Plik           : arch1-2c.asm                                               ;
; Format         : COM                                                        ;
; Cwiczenie      : Kompilacja, konsolidacja i debugowanie programow           ;
;                  asemblerowych                                              ;
; Autorzy        : Hubert Poteraj, Michal Pawlowski, 3, Wtorek, 10:30-12:00   ;
; Data zaliczenia: 26.03.2026                                                  ;
; Uwagi          : Program znajdujacy najmniejsza liczbe w tablicy            ;
;                                                                             ;
;=============================================================================;

                .MODEL  TINY                            ; ustawienie formatu COM

Kod             SEGMENT                                 ; segment kodu i danych

                ORG     100h                            ; przesuniecie kodu o 256 bajtow
                ASSUME  CS:Kod, DS:Kod, SS:Kod          ; ustawienie segmentu kodu, danych i stosu

Start:                                                  ; punkt startowy programu

DL_TABLICA      EQU     12                              ; dlugosc tablicy
Tablica         DB      05h, 02h, 07h, 10h, 12h, 33h    ; tablica z liczbami, w ktorej szukamy najmniejszej
                DB      15h, 09h, 11h, 08h, 0Ah, 04h    ; tablica z liczbami, w ktorej szukamy najmniejszej
Najmniejsza     DB      ?                               ; zmienna, w ktorej bedziemy przechowywac najmniejsza liczbe

                jmp     Poczatek                        ; skok do poczatku programu

Poczatek:                                               ; poczatek programu
                mov     bx, offset Tablica              ; ustawienie BX na adres poczatku tablicy
                mov     cx, DL_TABLICA                  ; ustawienie CX na dlugosc tablicy
                mov     al, [bx]                        ; ustawienie AL na pierwsza liczbe z tablicy
                inc     bx                              ; przesuniecie BX na nastepna liczbe w tablicy
                dec     cx                              ; zmniejszenie CX o 1, poniewaz juz sprawdzilismy pierwsza liczbe z tablicy

Petla:                                                  ; petla, w ktorej porownujemy kolejne liczby z tablicy z aktualnie najmniejsza liczba
                cmp     [bx], al                        ; porownanie aktualnej liczby z tablicy z aktualnie najmniejsza liczba
                jae     Skok                            ; jesli aktualna liczba z tablicy jest wieksza lub rowna aktualnie najmniejszej liczbie, to skaczemy do Skok
                mov     al, [bx]                        ; jesli aktualna liczba z tablicy jest mniejsza od aktualnie najmniejszej liczby, to ustawiamy AL na ta liczbe

Skok:
                inc     bx                              ; przesuniecie BX na nastepna liczbe w tablicy
                loop    Petla                           ; obniza cx o 1 i skacze do Petla jesli cx != 0

                mov     Najmniejsza, al                 ; ustawienie zmiennej Najmniejsza na najmniejsza liczbe z tablicy

                mov     ax, 4C00h                       ; funkcja 4Ch - zakoncz program
                int     21h                             ; wywolanie przerwania 21h, funkcja 4Ch - zakoncz program

Kod             ENDS                                    ; koniec segmentu kodu i danych

                END Start                               ; koniec programu, punkt startowy to Start

