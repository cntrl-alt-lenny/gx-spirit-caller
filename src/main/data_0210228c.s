; data_0210228c (12 bytes, 4-aligned): VecFx32 -- write-only runtime
; scratch, the per-axis scale magnitude vector for func_02083aa8's
; (dispatch table data_021022e0 slot 7) matrix decomposition; bytes
; 0x30-0x3b of the contiguous 60-byte GX param region documented in
; data_02102280.s (holds the GX FIFO MTX_SCALE args).
; See docs/research/data/cm-restock-carve-2-2026-08-08.md for the full
; consumer/relocation writeup (relocs.txt from:0x02083db0).
;
; Hand-written .s, not .c: see data_02102280.s's header comment --
; mwcc folds an all-zero-initialized global into .bss regardless of
; delinks.txt's .data intent; mwasmarm's `.byte` has no such fold.

        .section .data

        .global data_0210228c
data_0210228c:
        .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
