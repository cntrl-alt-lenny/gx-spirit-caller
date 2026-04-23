; VBlankIntrWait: NDS ARM9 BIOS SWI 0x05 thunk (6-byte Thumb).
;
; Hand-written .s because the mwcc-ARM `.text` alignment wall (see
; docs/research/thumb-align-wall.md and src/main/README.md) blocks
; these thunks from shipping as C. One .s file per thunk because
; dsd's delinks.txt rejects a single TU with multiple non-contiguous
; `.text` ranges (empirically verified during brief 013 execution:
; "Error: Section '.text' already exists").

        .text

        .global VBlankIntrWait
        .thumb
VBlankIntrWait:
        mov     r2, #0
        swi     0x5
        bx      lr
