; func_020b3648 — brief 219: ARM leaf, sets `r4 = r1 | 1` and falls
; through into the middle of func_020b3658 at offset 0x10 (label
; .L_020b3668). The final `b` is hand-encoded as a raw `.word`
; because mwasm can't resolve a cross-function label.
;
;     stmdb sp!, {r4, r5, r6, r7, r11, ip, lr}
;     mov   r4, r1
;     orr   r4, r4, #0x1
;     b     .L_020b3668                ; +0x10 from PC+8 -> 0xea000004
;
; b imm24 encoding: imm24 = (target - (PC + 8)) >> 2 where PC = 0x020b3654.
; imm24 = (0x020b3668 - (0x020b3654 + 8)) >> 2 = (0xc) >> 2 = 0x3.

        .text
        .global func_020b3648
        .arm

func_020b3648:
        stmdb   sp!, {r4, r5, r6, r7, r11, ip, lr}
        mov     r4, r1
        orr     r4, r4, #0x1
        .word   0xea000003                  ; b .L_020b3668 (= func_020b3658 + 0x10)
