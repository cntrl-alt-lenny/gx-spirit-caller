; func_02023d34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_02023e64
        .extern func_02023ed4
        .extern func_02023ef8
        .global func_02023d34
        .arm
func_02023d34:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x68
    mov r4, r0
    add ip, sp, #0x0
    mov lr, r4
    mov r5, #0x6
.L_18:
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne .L_18
    ldmia lr, {r0, r1}
    stmia ip, {r0, r1}
    mov r1, r4
    mov r0, #0x0
    mov r2, #0xd0
    bl Fill32
    add r5, sp, #0x0
    mov lr, r4
    mov ip, #0x6
.L_4c:
    ldmia r5!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_4c
    ldmia r5, {r0, r1}
    stmia lr, {r0, r1}
    ldrh r1, [r4, #0xce]
    mov r0, r4
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    strh r1, [r4, #0xce]
    ldrh r1, [r4, #0xce]
    orr r1, r1, #0x2
    strh r1, [r4, #0xce]
    bl func_02023e64
    mov r0, r4
    bl func_02023ed4
    mov r0, r4
    bl func_02023ef8
    add r3, r4, #0xa7
    mov r2, #0x0
    mvn r1, #0x0
.L_a4:
    add r0, r4, r2, lsl #0x4
    strh r1, [r0, #0xa4]
    ldrb r0, [r3]
    add r2, r2, #0x1
    cmp r2, #0x3
    bic r0, r0, #0x1
    strb r0, [r3], #0x10
    blt .L_a4
    mov r0, #0x1
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, pc}
