; func_02029678 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_0201ef3c
        .extern func_0201f03c
        .extern func_020215d8
        .extern func_0202160c
        .extern func_02029bdc
        .global func_02029678
        .arm
func_02029678:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x90
    mov r7, r0
    add r8, sp, #0x28
    mov r6, r1
    mov r5, r2
    mov ip, r7
    mov r4, #0x6
.L_20:
    ldmia ip!, {r0, r1, r2, r3}
    stmia r8!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_20
    ldmia ip, {r0, r1}
    stmia r8, {r0, r1}
    add r3, r7, #0x100
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x19c
    ldrsh r4, [r3, #0x8c]
    bl Fill32
    add r8, sp, #0x28
    mov lr, r7
    mov ip, #0x6
.L_5c:
    ldmia r8!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_5c
    ldmia r8, {r0, r1}
    stmia lr, {r0, r1}
    add ip, r7, #0x100
    strh r4, [ip, #0x8c]
    mov lr, r6
    add r4, r7, #0x68
    ldmia lr!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia lr!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    add r0, r6, #0x1c
    add r4, r7, #0x16c
    ldmia r0, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    ldrh r0, [ip, #0x9a]
    mvn r3, #0x0
    bic r0, r0, #0x4
    strh r0, [ip, #0x9a]
    ldrh r0, [ip, #0x9a]
    orr r0, r0, #0x2
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    strh r0, [ip, #0x9a]
    strh r3, [ip, #0x84]
    ldrb r0, [r7, #0x187]
    bic r0, r0, #0x1
    strb r0, [r7, #0x187]
    ldrsh r0, [ip, #0x8c]
    cmp r0, #0x0
    bne .L_114
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x10
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    b .L_138
.L_114:
    ldr r2, _LIT0
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x10
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_138:
    ldr r0, [r6, #0x8]
    str r0, [sp, #0x18]
    ldr r0, [r6, #0xc]
    str r0, [sp, #0x1c]
    ldr r0, [r6, #0x28]
    tst r0, #0x2
    beq .L_164
    mov r0, #0x0
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    b .L_174
.L_164:
    ldr r0, [r6]
    str r0, [sp, #0x20]
    ldr r0, [r6, #0x4]
    str r0, [sp, #0x24]
.L_174:
    cmp r5, #0x0
    blt .L_1ac
    bl func_020215d8
    mov r2, r5
    mov r1, #0x5
    bl func_0202160c
    ldr r1, [r0, #0x98]
    add r2, r7, #0xa0
    str r1, [r7, #0x98]
    ldr r1, [r0, #0x9c]
    str r1, [r7, #0x9c]
    ldr r0, [r7, #0x98]
    bl func_0201f03c
    b .L_20c
.L_1ac:
    ldrb r0, [r6, #0x10]
    ldr r1, [r6, #0x18]
    cmp r0, #0x1
    add r0, r7, #0x100
    ldrsh r0, [r0, #0x8c]
    moveq r2, #0x200
    movne r2, #0x20
    cmp r0, #0x0
    moveq r3, #0x1
    movne r3, #0x2
    stmia sp, {r1, r3}
    add r0, sp, #0x18
    str r0, [sp, #0x8]
    ldr r1, [r6, #0x28]
    add r0, r7, #0x100
    and r1, r1, #0x1
    str r1, [sp, #0xc]
    str r2, [sp, #0x10]
    str r0, [sp, #0x14]
    ldr r3, [r6, #0x14]
    add r0, r7, #0x98
    add r1, r7, #0x9c
    add r2, r7, #0xa0
    bl func_0201ef3c
.L_20c:
    mov r0, r7
    mvn r1, #0x0
    mov r2, #0x1
    bl func_02029bdc
    mov r0, #0x1
    add sp, sp, #0x90
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x04001000
