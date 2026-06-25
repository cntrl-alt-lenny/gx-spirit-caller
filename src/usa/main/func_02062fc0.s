; func_02062fc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054b88
        .extern func_02054ca0
        .extern func_02054f8c
        .extern func_02063114
        .extern func_02063214
        .extern func_02064450
        .global func_02062fc0
        .arm
func_02062fc0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    mov sl, r0
    ldr r0, [sl]
    bl func_02054f8c
    cmp r0, #0x0
    beq .L_13c
    ldr fp, _LIT1
    add r6, sp, #0x14
    add r8, sp, #0x8
    add r7, sp, #0x10
    mov r9, #0x8
    mov r5, #0x0
    mvn r4, #0xe
.L_3c:
    str r9, [sp, #0x10]
    str r8, [sp]
    str r7, [sp, #0x4]
    ldr r0, [sl]
    mov r1, r6
    mov r2, fp
    mov r3, r5
    bl func_02054ca0
    mov r2, r0
    mvn r0, #0x0
    cmp r2, r0
    bne .L_e4
    ldr r0, [sl]
    bl func_02054b88
    cmp r0, r4
    bne .L_c0
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
    bl func_02063114
    cmp r0, #0x0
    bne .L_12c
    ldr ip, _LIT0
    mov r0, #0x0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c0:
    mvn r1, #0x22
    cmp r0, r1
    beq .L_12c
    mov r0, sl
    bl func_02064450
    ldr ip, _LIT0
    mov r0, #0x0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e4:
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
    bl func_02063214
    cmp r0, #0x0
    ldreq ip, _LIT0
    moveq r0, #0x0
    addeq sp, sp, ip
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12c:
    ldr r0, [sl]
    bl func_02054f8c
    cmp r0, #0x0
    bne .L_3c
.L_13c:
    mov r0, #0x1
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000005f4
_LIT1: .word 0x000005dc
