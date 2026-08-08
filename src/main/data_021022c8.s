; data_021022c8 (12 bytes, 4-aligned): VecFx32 -- write-only runtime
; scratch, the twin of data_02102280 for mirror handler func_02083718
; (dispatch table data_021022e0 slot 8): translation (row 3) of an
; on-stack 4-row matrix ahead of a GX FIFO MTX_MULT_4x3 command.
; See docs/research/data/cm-restock-carve-2-2026-08-08.md for the full
; consumer/relocation writeup (relocs.txt from:0x02083a7c).
;
; Hand-written .s, not .c: see data_02102280.s's header comment --
; mwcc folds an all-zero-initialized global into .bss regardless of
; delinks.txt's .data intent; mwasmarm's `.byte` has no such fold.

        .section .data

        .global data_021022c8
data_021022c8:
        .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
