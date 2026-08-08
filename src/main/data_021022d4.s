; data_021022d4 (12 bytes, 4-aligned): VecFx32 -- write-only runtime
; scratch, the twin of data_0210228c for mirror handler func_02083718
; (dispatch table data_021022e0 slot 8): the per-axis scale magnitude
; vector (GX FIFO MTX_SCALE args).
; See docs/research/data/cm-restock-carve-2-2026-08-08.md for the full
; consumer/relocation writeup (relocs.txt from:0x02083a80).
;
; Hand-written .s, not .c: see data_02102280.s's header comment --
; mwcc folds an all-zero-initialized global into .bss regardless of
; delinks.txt's .data intent; mwasmarm's `.byte` has no such fold.

        .section .data

        .global data_021022d4
data_021022d4:
        .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
