; func_02063034 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054bfc
        .extern func_02054d14
        .extern func_02055000
        .extern func_02063188
        .extern func_02063288
        .extern func_020644c4
        .global func_02063034
        .arm
func_02063034:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    mov sl, r0
    ldr r0, [sl]
    bl func_02055000
    cmp r0, #0x0
    beq .L_844
    ldr fp, _LIT1
    add r6, sp, #0x14
    add r8, sp, #0x8
    add r7, sp, #0x10
    mov r9, #0x8
    mov r5, #0x0
    mvn r4, #0xe
.L_744:
    str r9, [sp, #0x10]
    str r8, [sp]
    str r7, [sp, #0x4]
    ldr r0, [sl]
    mov r1, r6
    mov r2, fp
    mov r3, r5
    bl func_02054d14
    mov r2, r0
    mvn r0, #0x0
    cmp r2, r0
    bne .L_7ec
    ldr r0, [sl]
    bl func_02054bfc
    cmp r0, r4
    bne .L_7c8
    ldrh r2, [sp, #0xa]
    ldr r1, [sp, #0xc]
    mov r0, sl
    mov r3, r2, asr #0x8
    mov r2, r2, lsl #0x8
    and r3, r3, #0xff
    and r2, r2, #0xff00
    orr r2, r3, r2
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_02063188
    cmp r0, #0x0
    bne .L_834
    ldr ip, _LIT0
    mov r0, #0x0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7c8:
    mvn r1, #0x22
    cmp r0, r1
    beq .L_834
    mov r0, sl
    bl func_020644c4
    ldr ip, _LIT0
    mov r0, #0x0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_7ec:
    ldrh ip, [sp, #0xa]
    mov r0, sl
    mov r1, r6
    mov r3, ip, asr #0x8
    mov ip, ip, lsl #0x8
    and r3, r3, #0xff
    and ip, ip, #0xff00
    orr r3, r3, ip
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    str r3, [sp]
    ldr r3, [sp, #0xc]
    bl func_02063288
    cmp r0, #0x0
    ldreq ip, _LIT0
    moveq r0, #0x0
    addeq sp, sp, ip
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_834:
    ldr r0, [sl]
    bl func_02055000
    cmp r0, #0x0
    bne .L_744
.L_844:
    mov r0, #0x1
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000005f4
_LIT1: .word 0x000005dc
