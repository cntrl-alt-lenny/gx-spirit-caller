; RLUnCompReadNormalWrite8bit: NDS ARM9 BIOS SWI 0x14 thunk (4-byte Thumb).
;
; Hand-written .s because the mwcc-ARM `.text` alignment wall (see
; docs/research/thumb-align-wall.md and src/main/README.md) blocks
; these thunks from shipping as C. One .s file per thunk because
; dsd's delinks.txt rejects a single TU with multiple non-contiguous
; `.text` ranges (empirically verified during brief 013 execution:
; "Error: Section '.text' already exists").

        .text

        .global RLUnCompReadNormalWrite8bit
        .thumb
RLUnCompReadNormalWrite8bit:
        swi     0x14
        bx      lr
