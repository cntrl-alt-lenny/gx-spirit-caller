; func_020b3808: entry-point variant of the shared 64-bit-divide body
; at func_020b3814 — sets r4=0 (vs r4=1 in func_020b3814's own preamble)
; then falls into func_020b3814's loop_top via a 4-byte forward branch.
;
; Disassembly:
;
;     stmdb sp!, {r4, r5, r6, r7, r11, ip, lr}
;     mov   r4, #0x0
;     b     .L_020b381c          ; func_020b3814 + 8 (its loop_top)
;
; 12 bytes total. The branch lands inside func_020b3814's body — the
; same inter-function jump trick used in func_020b3814.s itself
; (where bne / bl into _dsd_gap@main_8.o's internal labels are
; hand-encoded as raw `.word`s). Encoding:
;
;     0x020b3810:  b .L_020b381c
;       offset = (0x020b381c - (0x020b3810 + 8)) / 4 = +1
;       encoding = 0xEA000000 | 0x000001 = 0xEA000001
;
; The pair (func_020b3808, func_020b3814) implement the `r4=0` /
; `r4=1` entry points to the same 64-bit-divide body in main's
; CodeWarrior runtime tail.

        .text
        .global func_020b3808
        .arm
func_020b3808:
        stmdb   sp!, {r4, r5, r6, r7, r11, ip, lr}
        mov     r4, #0x0
        .word   0xea000001                      ; b .L_020b381c (func_020b3814 + 8)
