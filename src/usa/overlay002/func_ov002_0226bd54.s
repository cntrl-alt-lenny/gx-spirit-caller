; func_ov002_0226bd54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_0202df24
        .extern func_0202e1e0
        .extern func_ov002_021b3ef8
        .extern func_ov002_02253600
        .global func_ov002_0226bd54
        .arm
func_ov002_0226bd54:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    ldr r3, [r3, #0xd94]
    cmp r0, r3
    cmpeq r1, #0xb
    bne .L_3c4
    ldr r1, _LIT1
    ldr r3, _LIT2
    and r4, r0, #0x1
    mla r1, r4, r1, r3
    ldr ip, _LIT3
    add r5, r1, #0x120
    ldr r3, [r5, r2, lsl #0x2]
    ldrh r1, [ip, #0xb4]
    ldr lr, _LIT4
    mov r3, r3, lsl #0x13
    cmp r1, lr
    mov r4, r3, lsr #0x13
    mov r3, #0x1
    bgt .L_314
    cmp r1, lr
    bge .L_378
    sub ip, lr, #0x260
    cmp r1, ip
    bgt .L_304
    bge .L_358
    ldr ip, _LIT5
    cmp r1, ip
    beq .L_358
    b .L_3b8
.L_304:
    sub ip, lr, #0x63
    cmp r1, ip
    beq .L_358
    b .L_3b8
.L_314:
    ldr lr, _LIT6
    cmp r1, lr
    bgt .L_334
    bge .L_358
    sub r0, lr, #0xf0
    cmp r1, r0
    beq .L_364
    b .L_3b8
.L_334:
    add ip, lr, #0xc5
    cmp r1, ip
    bgt .L_348
    beq .L_378
    b .L_3b8
.L_348:
    ldr r0, _LIT7
    cmp r1, r0
    beq .L_3ac
    b .L_3b8
.L_358:
    bl func_ov002_02253600
    mov r3, r0
    b .L_3b8
.L_364:
    ldrh r1, [ip, #0xa2]
    mov r0, r4
    bl func_0202df24
    mov r3, r0
    b .L_3b8
.L_378:
    ldr r3, [r5, r2, lsl #0x2]
    ldr r2, _LIT8
    mov r1, r3, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r1, r1, lsl #0x1
    add r3, r1, r3, lsr #0x1f
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    moveq r3, #0x1
    movne r3, #0x0
    b .L_3b8
.L_3ac:
    mov r0, r4
    bl func_0202e1e0
    mov r3, r0
.L_3b8:
    cmp r3, #0x0
    movne r0, #0x800
    ldmneia sp!, {r3, r4, r5, pc}
.L_3c4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022d0d8c
_LIT4: .word 0x000015dc
_LIT5: .word 0x0000135b
_LIT6: .word 0x000017c3
_LIT7: .word 0x00001a19
_LIT8: .word 0x000012a1
