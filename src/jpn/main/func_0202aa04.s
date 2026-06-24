; func_0202aa04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .global func_0202aa04
        .arm
func_0202aa04:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x68
    mov r4, r0
    add ip, sp, #0x0
    mov lr, r4
    mov r5, #0x6
.L_750:
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_750
    ldmia lr, {r0, r1}
    stmia ip, {r0, r1}
    mov r1, r4
    mov r0, #0x0
    mov r2, #0xec
    bl Fill32
    add r5, sp, #0x0
    mov lr, r4
    mov ip, #0x6
.L_784:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_784
    ldmia r5, {r0, r1}
    stmia lr, {r0, r1}
    ldrh r0, [r4, #0xea]
    add r3, r4, #0xa7
    mov r2, #0x0
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    strh r0, [r4, #0xea]
    mvn r1, #0x0
.L_7b8:
    add r0, r4, r2, lsl #0x4
    strh r1, [r0, #0xa4]
    ldrb r0, [r3]
    add r2, r2, #0x1
    cmp r2, #0x4
    bic r0, r0, #0x1
    strb r0, [r3], #0x10
    blt .L_7b8
    mov r0, #0x1
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, pc}
