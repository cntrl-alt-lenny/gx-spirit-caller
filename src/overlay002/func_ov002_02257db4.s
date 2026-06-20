; func_ov002_02257db4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021f4a84
        .extern func_ov002_021f4df4
        .extern func_ov002_021f634c
        .extern func_ov002_021f781c
        .extern func_ov002_021f8760
        .extern func_ov002_021f9434
        .extern func_ov002_021f980c
        .extern func_ov002_021facbc
        .extern func_ov002_02257464
        .global func_ov002_02257db4
        .arm
func_ov002_02257db4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x12
    movs r1, r1, lsr #0x1e
    cmpne r1, #0x3
    bne .L_24
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_24:
    bl func_ov002_02257464
    cmp r0, #0x0
    beq .L_378
    ldr r1, [r0, #0x10]
    ldr r0, _LIT0
    cmp r1, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT1
    cmp r1, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT2
    cmp r1, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT3
    cmp r1, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT4
    cmp r1, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT5
    cmp r1, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT6
    cmp r1, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT7
    cmp r1, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4]
    ldr ip, _LIT8
    cmp r0, ip
    bgt .L_1cc
    bge .L_314
    ldr r3, _LIT9
    cmp r0, r3
    bgt .L_13c
    bge .L_2f8
    ldr r2, _LIT10
    cmp r0, r2
    bgt .L_10c
    bge .L_2b0
    sub r1, r2, #0xab
    cmp r0, r1
    bgt .L_fc
    beq .L_2b8
    b .L_378
.L_fc:
    sub r1, r2, #0x3a
    cmp r0, r1
    beq .L_2b0
    b .L_378
.L_10c:
    sub r1, ip, #0x450
    cmp r0, r1
    bgt .L_12c
    bge .L_2c0
    add r1, r2, #0x4e
    cmp r0, r1
    beq .L_330
    b .L_378
.L_12c:
    sub r1, r3, #0xcd
    cmp r0, r1
    beq .L_2dc
    b .L_378
.L_13c:
    ldr r2, _LIT11
    cmp r0, r2
    bgt .L_184
    sub r1, r2, #0x1
    cmp r0, r1
    blt .L_160
    cmpne r0, r2
    beq .L_2b0
    b .L_378
.L_160:
    sub r1, r2, #0x38
    cmp r0, r1
    bgt .L_174
    beq .L_2b0
    b .L_378
.L_174:
    sub r1, r2, #0x2c
    cmp r0, r1
    beq .L_2b8
    b .L_378
.L_184:
    add r1, r2, #0xdc
    cmp r0, r1
    bgt .L_1a4
    bge .L_314
    add r1, r2, #0xcc
    cmp r0, r1
    beq .L_2b0
    b .L_378
.L_1a4:
    add r1, r2, #0xdf
    cmp r0, r1
    bgt .L_378
    add r1, r2, #0xde
    cmp r0, r1
    blt .L_378
    addne r1, r2, #0xdf
    cmpne r0, r1
    beq .L_330
    b .L_378
.L_1cc:
    ldr r2, _LIT12
    cmp r0, r2
    bgt .L_240
    bge .L_2b0
    sub r1, r2, #0x16c
    cmp r0, r1
    bgt .L_210
    bge .L_2b0
    add r1, ip, #0x78
    cmp r0, r1
    bgt .L_200
    beq .L_2c0
    b .L_378
.L_200:
    sub r1, r2, #0x178
    cmp r0, r1
    beq .L_2b0
    b .L_378
.L_210:
    sub r1, r2, #0x85
    cmp r0, r1
    bgt .L_230
    bge .L_34c
    sub r1, r2, #0x8d
    cmp r0, r1
    beq .L_2b0
    b .L_378
.L_230:
    sub r1, r2, #0x30
    cmp r0, r1
    beq .L_2b0
    b .L_378
.L_240:
    add r1, r2, #0x17
    cmp r0, r1
    bgt .L_280
    bge .L_368
    add r1, r2, #0x15
    cmp r0, r1
    bgt .L_270
    bge .L_368
    add r1, r2, #0x9
    cmp r0, r1
    beq .L_2b8
    b .L_378
.L_270:
    add r1, r2, #0x16
    cmp r0, r1
    beq .L_368
    b .L_378
.L_280:
    add r1, r2, #0xf5
    cmp r0, r1
    bgt .L_2a0
    bge .L_368
    add r1, r2, #0xf4
    cmp r0, r1
    beq .L_368
    b .L_378
.L_2a0:
    add r1, r2, #0xf6
    cmp r0, r1
    beq .L_368
    b .L_378
.L_2b0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_2b8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_2c0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    bne .L_378
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_2dc:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x5
    beq .L_378
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_2f8:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0xf
    beq .L_378
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_314:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x2
    bne .L_378
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_330:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x5
    bne .L_378
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_34c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0xf
    bne .L_378
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_368:
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_378:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word func_ov002_021f4a84
_LIT1: .word func_ov002_021f4df4
_LIT2: .word func_ov002_021f634c
_LIT3: .word func_ov002_021f781c
_LIT4: .word func_ov002_021f8760
_LIT5: .word func_ov002_021f980c
_LIT6: .word func_ov002_021facbc
_LIT7: .word func_ov002_021f9434
_LIT8: .word 0x00001817
_LIT9: .word 0x000015d0
_LIT10: .word 0x00001181
_LIT11: .word 0x000016f9
_LIT12: .word 0x00001a58
