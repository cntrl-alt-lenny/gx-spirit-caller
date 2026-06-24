; func_02010024 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_0218cae8
        .extern func_0200fadc
        .extern func_02010e98
        .global func_02010024
        .arm
func_02010024:
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
    beq .L_298
    ldr lr, _LIT1
    sub r5, r5, #0x1
    and lr, r6, lr
    mov r5, r5, lsl #0x17
    orr r5, lr, r5, lsr #0x14
    str r5, [r4, #0xc]
.L_298:
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
    beq .L_2d0
    cmp r2, #0x1
    beq .L_2d8
    b .L_2e0
.L_2d0:
    mov r3, r0
    b .L_2e8
.L_2d8:
    mov ip, r0
    b .L_2e8
.L_2e0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_2e8:
    cmp r3, #0x0
    beq .L_374
    ldrsb r0, [r3]
    cmp r0, #0x5
    addeq r0, r1, #0x10c
    addeq r0, r0, #0x1800
    beq .L_380
    add r0, r1, #0x1000
    ldr lr, [r0, #0x914]
    mvn r5, #0x0
    cmp lr, #0x0
    mov r6, #0x0
    bls .L_358
    ldr ip, [r3, #0x18]
.L_320:
    add r0, r1, r6, lsl #0x3
    add r0, r0, #0x1000
    ldr r2, [r0, #0x918]
    cmp ip, r2
    bcc .L_34c
    ldr r2, [r3, #0xc]
    ldr r0, [r0, #0x91c]
    add r2, ip, r2
    cmp r2, r0
    movls r5, r6
    bls .L_358
.L_34c:
    add r6, r6, #0x1
    cmp r6, lr
    bcc .L_320
.L_358:
    cmp r5, #0x0
    bge .L_368
    bl func_02010e98
.L_364:
    b .L_364
.L_368:
    add r0, r1, #0x1900
    add r0, r0, r5, lsl #0x2
    b .L_380
.L_374:
    cmp ip, #0x0
    addne r0, r1, #0x910
    addne r0, r0, #0x1000
.L_380:
    ldr r1, [r0]
    cmp r1, r4
    ldreq r1, [r4]
    streq r1, [r0]
    mov r0, r4
    bl func_0200fadc
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x14
    bl Fill32
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0218cae8
_LIT1: .word 0xfffff007
