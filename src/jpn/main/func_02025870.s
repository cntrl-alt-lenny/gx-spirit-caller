; func_02025870 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_02025eac
        .global func_02025870
        .arm
func_02025870:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x68
    mov r5, r0
    add ip, sp, #0x0
    mov r4, r1
    mov lr, r5
    mov r6, #0x6
.L_1c:
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    subs r6, r6, #0x1
    bne .L_1c
    ldmia lr, {r0, r1}
    stmia ip, {r0, r1}
    mov r1, r5
    mov r0, #0x0
    mov r2, #0x16c
    bl Fill32
    add r6, sp, #0x0
    mov lr, r5
    mov ip, #0x6
.L_50:
    ldmia r6!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_50
    ldmia r6, {r0, r1}
    stmia lr, {r0, r1}
    mov lr, r4
    add ip, r5, #0x68
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1, r2}
    stmia ip, {r0, r1, r2}
    add r0, r4, #0x1c
    add r3, r5, #0xac
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    mov r0, #0x0
    str r0, [r5, #0xb8]
    str r0, [r5, #0xbc]
    str r0, [r5, #0xc0]
    mov r1, #0x1000
    str r1, [r5, #0xc4]
    str r1, [r5, #0xc8]
    str r1, [r5, #0xcc]
    mov r1, #0x1f0
    str r1, [r5, #0xd0]
    str r0, [r5, #0xd4]
    str r0, [r5, #0xd8]
    mov r1, #0x2
    add r2, r5, #0x100
    strh r1, [r2, #0x62]
    strh r0, [r2, #0x64]
    ldrh r3, [r2, #0x6a]
    add r1, r5, #0x3
    add r1, r1, #0x100
    orr r3, r3, #0x6
    bic r3, r3, #0x1
    orr r3, r3, #0x1
    strh r3, [r2, #0x6a]
    ldrh r3, [r2, #0x6a]
    bic r3, r3, #0x20
    strh r3, [r2, #0x6a]
    ldrh r3, [r2, #0x6a]
    bic r3, r3, #0xf000
    orr r3, r3, #0xf000
    strh r3, [r2, #0x6a]
    mvn r3, #0x0
.L_114:
    add r2, r5, r0, lsl #0x4
    add r2, r2, #0x100
    strh r3, [r2]
    ldrb r2, [r1]
    add r0, r0, #0x1
    cmp r0, #0x6
    bic r2, r2, #0x1
    strb r2, [r1], #0x10
    blt .L_114
    mov r0, r5
    bl func_02025eac
    mov r0, #0x1
    add sp, sp, #0x68
    ldmia sp!, {r4, r5, r6, pc}
