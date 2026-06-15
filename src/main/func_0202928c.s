; func_0202928c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern func_0201d47c
        .extern func_02029624
        .global func_0202928c
        .arm
func_0202928c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x68
    mov r6, r0
    add r7, sp, #0x0
    mov r5, r1
    mov ip, r6
    mov r4, #0x6
.L_aa4:
    ldmia ip!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    subs r4, r4, #0x1
    bne .L_aa4
    ldmia ip, {r0, r1}
    stmia r7, {r0, r1}
    add r3, r6, #0x100
    mov r1, r6
    mov r0, #0x0
    mov r2, #0x19c
    ldrsh r4, [r3, #0x8c]
    bl Fill32
    add r7, sp, #0x0
    mov lr, r6
    mov ip, #0x6
.L_ae0:
    ldmia r7!, {r0, r1, r2, r3}
    stmia lr!, {r0, r1, r2, r3}
    subs ip, ip, #0x1
    bne .L_ae0
    ldmia r7, {r0, r1}
    stmia lr, {r0, r1}
    add ip, r6, #0x100
    strh r4, [ip, #0x8c]
    mov lr, r5
    add r4, r6, #0x68
    ldmia lr!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    add r0, r5, #0x10
    add r3, r6, #0x16c
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldrh r1, [ip, #0x9a]
    mvn r0, #0x0
    orr r1, r1, #0x6
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    strh r1, [ip, #0x9a]
    strh r0, [ip, #0x84]
    ldrb r0, [r6, #0x187]
    bic r0, r0, #0x1
    strb r0, [r6, #0x187]
    ldrsh r0, [ip, #0x8c]
    cmp r0, #0x0
    bne .L_b84
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x10
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    b .L_ba8
.L_b84:
    ldr r2, _LIT0
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x10
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_ba8:
    add r0, r6, #0x90
    bl func_0201d47c
    add r0, r6, #0x100
    ldrsh r0, [r0, #0x8c]
    ldrh r1, [r6, #0xa4]
    cmp r0, #0x0
    moveq r0, #0x4
    movne r0, #0x9
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    strh r0, [r6, #0xa4]
    ldr r0, [r5, #0x1c]
    tst r0, #0x4
    mvnne r0, #0x0
    ldreq r0, [r5, #0x8]
    str r0, [r6, #0x9c]
    ldr r0, [r5, #0x1c]
    tst r0, #0x8
    mvnne r0, #0x0
    ldreq r0, [r5, #0xc]
    moveq r0, r0, lsl #0x10
    moveq r0, r0, asr #0x10
    strh r0, [r6, #0xa0]
    ldrb r0, [r5, #0x4]
    ldrh r1, [r6, #0xa4]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x10
    mov r0, r0, lsl #0x1f
    orr r1, r1, r0, lsr #0x1b
    mov r0, r6
    strh r1, [r6, #0xa4]
    bl func_02029624
    mov r0, #0x1
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x04001000
