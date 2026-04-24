; Fill32 (was func_020944c0): 4-byte-stride memory fill.
;
; Disassembly (build/eur/asm/_dsd_gap@main_*.s):
;
;     add ip, r1, r2            ; end = dest + size_bytes
; .L_020944c4:
;     cmp r1, ip                ; while (p < end)
;     stmltia r1!, {r0}         ;   *p++ = value (conditional)
;     blt .L_020944c4           ; loop back
;     bx lr
;
; 5 ARM instructions, 0x14 bytes.
;
; Arg convention: (value, dest, size_bytes). r0 = fill value, r1 =
; dest pointer, r2 = count in bytes. Loop writes 4 bytes per iteration.
; size_bytes is expected to be a multiple of 4 — callers guarantee
; alignment.
;
; Ships as `.s` rather than `.c` because mwcc doesn't emit the
; `stmltia {r0}` form from any C source I tried. The natural C loop
; `while (p < end) *p++ = value;` compiles to a `str r0, [r1], #4`
; post-indexed single-word store + separate cmp — functionally
; identical but byte-different (7 insns / 0x1c vs baserom's 5 insns
; / 0x14). The store-multiple-with-one-register idiom appears to be
; a hand-crafted tight-loop optimisation that mwcc's -O4 won't
; reach on its own.
;
; Second rename-cascade pilot: 22 hard callers promote to medium on
; this rename (follow-up to #152's GetSystemWork cascade).

        .text

        .global Fill32
        .arm
Fill32:
        add     ip, r1, r2
loop_top:
        cmp     r1, ip
        stmltia r1!, {r0}
        blt     loop_top
        bx      lr
