; IntrWait: NDS ARM9 BIOS SWI 0x4 thunk (4-byte Thumb).
;
; Ported to .s for USA/JPN because the mwcc-ARM `.text` alignment wall
; (docs/research/thumb-align-wall.md) blocks these from shipping as C
; at a start address that isn't 4-aligned — true for this thunk's
; USA/JPN link position even though the EUR original is safely
; 4-aligned and ships as .c. Same recipe as EUR's own already-shipped
; non-4-aligned thunks (e.g. src/main/SoftReset.s, src/main/Div.s).
; Brief 601 (re-land): the original attempt (b597) shipped this as
; plain .c and crashed dsd's ROM verifier ("expected 4-alignment for
; build info but got 2-alignment") — same root cause as the EUR wall,
; just never hit in EUR because EUR's link order happens to keep this
; specific thunk 4-aligned.

        .text

        .global IntrWait
        .thumb
IntrWait:
        swi     0x4
        bx      lr
