; data_02102280 (12 bytes, 4-aligned): VecFx32 (libs/nitro/include/
; nitro/fx_vec.h) -- write-only runtime scratch, NOT constant transform
; data despite living in .data: the translation (row 3) of a 4-row
; matrix buffer assembled on-stack by func_02083aa8 (dispatch table
; data_021022e0 slot 7) ahead of a GX FIFO MTX_MULT_4x3 command.
; See docs/research/data/cm-restock-carve-2-2026-08-08.md for the full
; consumer/relocation writeup (relocs.txt from:0x02083dac).
;
; Hand-written .s, not .c: mwcc folds an all-zero-initialized global
; into .bss regardless of the source's `.data` intent, which silently
; drops its bytes from the delinks.txt-declared .data image (confirmed
; via ELF section-header inspection: section=.bss for the .c version).
; mwasmarm has no such fold -- `.byte` in a `.data` section always
; emits real PROGBITS bytes. Matches the established project recipe
; for fighting mwcc's own section-placement decisions
; (docs/research/dtcm-section-attribute.md).

        .section .data

        .global data_02102280
data_02102280:
        .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
