; func_02010040 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0218cbc8
        .extern List_Unlink
        .extern func_02010eb4
        .global func_02010040
        .arm
func_02010040:
    stmdb sp!, {r4, r5, r6, lr}
    mov r3, #0x0
    mov r4, r1
    cmp r0, #0x0
    mov ip, r3
    ldr r1, _LIT0
    moveq r0, r3
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r4, #0x0
    moveq r0, r3
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r6, [r4, #0xc]
    mov r5, r6, lsl #0x14
    movs r5, r5, lsr #0x17
    beq .L_2d4
    ldr lr, _LIT1
    sub r5, r5, #0x1
    and lr, r6, lr
    mov r5, r5, lsl #0x17
    orr r5, lr, r5, lsr #0x14
    str r5, [r4, #0xc]
.L_2d4:
    ldr lr, [r4, #0xc]
    mov r5, lr, lsl #0x14
    movs r5, r5, lsr #0x17
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    mov lr, lr, lsl #0x1e
    movs lr, lr, lsr #0x1f
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r2, #0x0
    beq .L_30c
    cmp r2, #0x1
    beq .L_314
    b .L_31c
.L_30c:
    mov r3, r0
    b .L_324
.L_314:
    mov ip, r0
    b .L_324
.L_31c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_324:
    cmp r3, #0x0
    beq .L_3b0
    ldrsb r0, [r3]
    cmp r0, #0x5
    addeq r0, r1, #0x10c
    addeq r0, r0, #0x1800
    beq .L_3bc
    add r0, r1, #0x1000
    ldr lr, [r0, #0x914]
    mvn r5, #0x0
    cmp lr, #0x0
    mov r6, #0x0
    bls .L_394
    ldr ip, [r3, #0x18]
.L_35c:
    add r0, r1, r6, lsl #0x3
    add r0, r0, #0x1000
    ldr r2, [r0, #0x918]
    cmp ip, r2
    bcc .L_388
    ldr r2, [r3, #0xc]
    ldr r0, [r0, #0x91c]
    add r2, ip, r2
    cmp r2, r0
    movls r5, r6
    bls .L_394
.L_388:
    add r6, r6, #0x1
    cmp r6, lr
    bcc .L_35c
.L_394:
    cmp r5, #0x0
    bge .L_3a4
    bl func_02010eb4
.L_3a0:
    b .L_3a0
.L_3a4:
    add r0, r1, #0x1900
    add r0, r0, r5, lsl #0x2
    b .L_3bc
.L_3b0:
    cmp ip, #0x0
    addne r0, r1, #0x910
    addne r0, r0, #0x1000
.L_3bc:
    ldr r1, [r0]
    cmp r1, r4
    ldreq r1, [r4]
    streq r1, [r0]
    mov r0, r4
    bl List_Unlink
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x14
    bl Fill32
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0218cbc8
_LIT1: .word 0xfffff007
