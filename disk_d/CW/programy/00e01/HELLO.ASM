                .MODEL  SMALL

                ; Segment danych programu
                .DATA

napis           DB      "Witaj swiecie!", 13, 10, '$'

                ; Segment kodu programu
                .CODE

                ; Zaladowanie rejestru segmentowego danych
start:          mov     ax, @data
                mov     ds, ax

                ; Wyswietlenie napisu w miejscu ustawienia kursora
                mov     ah, 09h
                mov     dx, OFFSET napis
                int     21h

                ; Zakonczenie programu
                mov     ax, 4C00h
                int     21h

                ; Segment stosu programu
                .STACK  100h

                END     start
