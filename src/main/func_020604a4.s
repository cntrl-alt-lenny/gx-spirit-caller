; func_020604a4: stack-frame teardown stub — stmdb 4 regs then
; immediately adds sp back by 0x10 (net zero). Canonical
; "nullified frame" shape from inlined tail code.
;
;     stmdb sp!, {r0, r1, r2, r3}
;     add   sp, sp, #0x10
;     bx    lr

        .text
        .global func_020604a4
        .arm
func_020604a4:
        stmdb   sp!, {r0, r1, r2, r3}
        add     sp, sp, #0x10
        bx      lr
