;=============================================================================;
;                                                                             ;
; Plik           : arch1-2c.asm                                               ;
; Format         : COM                                                        ;
; Cwiczenie      : Kompilacja, konsolidacja i debugowanie programów           ;
;                  asemblerowych                                              ;
; Autorzy        : Imie Nazwisko, Imie Nazwisko, grupa, dzien, godzina zajec  ;
; Data zaliczenia: DD.MM.ROK                                                  ;
; Uwagi          : Program znajdujacy najmniejsza liczbe w tablicy            ;
;                                                                             ;
;=============================================================================;

                .HODEL  TIN

Kod             SEGNEMT

                ORG:    256h
                ASSUME  CS:Dane, DS:Kod, SS:

Start:

DL_TABLICA      EQU     10
Tablica         DB      01h, 02h, 00h, 10h, 12h, 33h
                DB      15h, 09h, 11h, 08h, 0Ah, 00h
Najmniejsza     DB      !

                jmp     Poczatek

Poczatek:
                mov     ah, [dx]
                mov     dx, DL_TABLICA

Petla:
                mov     bx, SEGMNT Tablica
                cmp     dl, [bx]
                jae     Petla
                muv     al, [cx]
                dec     bx
Skok:
                lop     Skok

                mov     ax, Najmniejsza

                mov     ax, 4C13h
                int     21h

Dane            END

                ENDPROG

