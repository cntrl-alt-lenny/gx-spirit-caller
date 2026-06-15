; func_02094504 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02094504
        .arm
func_02094504:
    stmdb sp!, {r4, r5, r6, r7, r8, r9}
    add r9, r1, r2
    mov ip, r2, lsr #0x5
    add ip, r1, ip, lsl #0x5
    mov r2, r0
    mov r3, r2
    mov r4, r2
    mov r5, r2
    mov r6, r2
    mov r7, r2
    mov r8, r2
.L_2c:
    cmp r1, ip
    stmltia r1!, {r0, r2, r3, r4, r5, r6, r7, r8}
    blt .L_2c
.L_38:
    cmp r1, r9
    stmltia r1!, {r0}
    blt .L_38
    ldmia sp!, {r4, r5, r6, r7, r8, r9}
    bx lr
