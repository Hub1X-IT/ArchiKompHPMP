;=============================================================================;
;                                                                             ;
; Plik           : arch1-2e.asm                                               ;
; Format         : EXE                                                        ;
; Cwiczenie      : Kompilacja, konsolidacja i debugowanie programow           ;
;                  asemblerowych                                              ;
; Autorzy        : Hubert Poteraj, Michal Pawlowski, 3, Wtorek, 10:30-12:00   ;
; Data zaliczenia: 26.03.2026                                                  ;
; Uwagi          : Program obliczajacy wzor: (3*a-b/a)*(d+3)                  ;
;                                                                             ;
;=============================================================================;

                .MODEL SMALL

Dane            SEGMENT

a               DB      20
b               DB      10
c               DB      3
d               DB      5
Wynik           DW      ?

Dane            ENDS

Kod             SEGMENT

                ASSUME   CS:Kod, DS:Dane, SS:Stosik

Start:
                mov     ax, SEG Dane
				mov     ds, ax
				
				;bx = 3*a
				mov     al, a
                mul     c
				mov     bx, ax
				
				;ax = b/a
                mov     al, b
				div		a
				mov		ah, 00h
				
				;bx = 3*a-b/a
                sub     bx, ax
				
				;ax = d+3
				mov		al, d
				add		al, 3
				
				;ax = (3*a-b/a)*(d+3)
                mul     bx
				
                mov     Wynik, ax

                mov     ax, 4C00h
                int     21h

Stosik            SEGMENT

				DB      100h DUP (?)
Stosik          ENDS

Kod             ENDS

                END     Start

