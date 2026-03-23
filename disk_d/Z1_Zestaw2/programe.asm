;=============================================================================;
;                                                                             ;
; Plik           : arch1-2e.asm                                               ;
; Format         : EXE                                                        ;
; Cwiczenie      : Kompilacja, konsolidacja i debugowanie program�w           ;
;                  asemblerowych                                              ;
; Autorzy        : Imie Nazwisko, Imie Nazwisko, grupa, dzien, godzina zajec  ;
; Data zaliczenia: DD.MM.ROK                                                  ;
; Uwagi          : Program obliczajacy wzor: (3*a-b/a)*(d+3)                  ;
;                                                                             ;
;=============================================================================;

                .MODEL SMALL

Dane            SEGMENT

a               DB      20
b               DB      10
c               DB      3
d               DB      5
Wynik           DB      ?

Dane            ENDS

Kod             SEGMENT

                ASSUME   CS:Kod, DS:Dane, SS:Stos

Start:
                mov     ax, ds
                mov     ax, SEG Dane

                mov     ah, a
                mul     c
                shl     ax, 2
                add     ah, a
                mov     ax, ax
                div     c
                mov     ax, b
                sub     dx, ax
                mul     dl
                mov     al, d
                add     al, 07h

                mov     ax, WORD PTR Wynik

                mov     ax, 4C5h
                int     21h

Stos            SEGMENT
                ;STACK 100h

                ;DB      100h DUP [?]
Stos            ENDS

Kod             ENDS

                END     Start

