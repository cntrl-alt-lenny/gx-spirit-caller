; func_ov002_0229c7f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d11bc
        .extern data_ov002_022d1400
        .extern data_ov002_022d1410
        .extern data_ov002_022d1a9c
        .extern data_ov002_022d1af8
        .extern data_ov002_022d1b7c
        .extern func_ov002_022a1870
        .extern func_ov002_022a3918
        .extern func_ov002_022a6cc4
        .extern func_ov002_022a6d1c
        .extern func_ov002_022b3910
        .global func_ov002_0229c7f8
        .arm
func_ov002_0229c7f8:
    stmdb sp!, {r3, lr}
    cmp r0, #0x3d
    addls pc, pc, r0, lsl #0x2
    b .L_4ec
    b .L_108
    b .L_198
    b .L_1c8
    b .L_144
    b .L_168
    b .L_168
    b .L_48c
    b .L_4ec
    b .L_4ec
    b .L_4ec
    b .L_4ec
    b .L_4ec
    b .L_378
    b .L_15c
    b .L_15c
    b .L_4ec
    b .L_114
    b .L_4ec
    b .L_108
    b .L_348
    b .L_4ec
    b .L_108
    b .L_4ec
    b .L_4ec
    b .L_2e8
    b .L_108
    b .L_2b8
    b .L_4ec
    b .L_258
    b .L_228
    b .L_240
    b .L_2a0
    b .L_1f8
    b .L_288
    b .L_270
    b .L_318
    b .L_4ec
    b .L_330
    b .L_4ec
    b .L_360
    b .L_4ec
    b .L_4ec
    b .L_4d4
    b .L_4ec
    b .L_4ec
    b .L_4d4
    b .L_4ec
    b .L_4a4
    b .L_3f0
    b .L_150
    b .L_150
    b .L_3a8
    b .L_3a8
    b .L_3d8
    b .L_4ec
    b .L_3fc
    b .L_414
    b .L_42c
    b .L_444
    b .L_45c
    b .L_474
    b .L_3f0
.L_108:
    ldr r0, _LIT0
    bl func_ov002_022a6d1c
    ldmia sp!, {r3, pc}
.L_114:
    ldr r0, _LIT0
    bl func_ov002_022a6d1c
    cmp r0, #0x0
    bne .L_134
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x15
    bne .L_13c
.L_134:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_13c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_144:
    ldr r0, _LIT2
    ldrh r0, [r0]
    ldmia sp!, {r3, pc}
.L_150:
    ldr r0, _LIT3
    bl func_ov002_022a1870
    ldmia sp!, {r3, pc}
.L_15c:
    ldr r0, _LIT4
    bl func_ov002_022b3910
    ldmia sp!, {r3, pc}
.L_168:
    ldr r0, _LIT5
    bl func_ov002_022a3918
    cmp r0, #0x0
    bne .L_188
    ldr r0, _LIT4
    bl func_ov002_022b3910
    cmp r0, #0x0
    beq .L_190
.L_188:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_190:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_198:
    ldr r0, _LIT5
    bl func_ov002_022a3918
    cmp r0, #0x0
    bne .L_1b8
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x1a
    bne .L_1c0
.L_1b8:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1c0:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1c8:
    ldr r0, _LIT4
    bl func_ov002_022b3910
    cmp r0, #0x0
    bne .L_1e8
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x1b
    bne .L_1f0
.L_1e8:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1f0:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1f8:
    ldr r0, _LIT5
    bl func_ov002_022a3918
    cmp r0, #0x0
    bne .L_218
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x5
    bne .L_220
.L_218:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_220:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_228:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xa
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_240:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_258:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_270:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x6
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_288:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_2a0:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x9
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_2b8:
    ldr r0, _LIT0
    bl func_ov002_022a6d1c
    cmp r0, #0x0
    bne .L_2d8
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xb
    bne .L_2e0
.L_2d8:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_2e0:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_2e8:
    ldr r0, _LIT0
    bl func_ov002_022a6d1c
    cmp r0, #0x0
    bne .L_308
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xc
    bne .L_310
.L_308:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_310:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_318:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xe
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_330:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xd
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_348:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x14
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_360:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x16
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_378:
    ldr r0, _LIT5
    bl func_ov002_022a3918
    cmp r0, #0x0
    bne .L_398
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x2
    bne .L_3a0
.L_398:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_3a0:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_3a8:
    ldr r0, _LIT5
    bl func_ov002_022a3918
    cmp r0, #0x0
    bne .L_3c8
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x1
    bne .L_3d0
.L_3c8:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_3d0:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_3d8:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_3f0:
    ldr r0, _LIT5
    bl func_ov002_022a3918
    ldmia sp!, {r3, pc}
.L_3fc:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x18
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_414:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x17
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_42c:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x19
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_444:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x11
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_45c:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x12
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_474:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x13
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_48c:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xf
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_4a4:
    ldr r0, _LIT5
    bl func_ov002_022a3918
    cmp r0, #0x0
    bne .L_4c4
    ldr r0, _LIT0
    bl func_ov002_022a6cc4
    cmp r0, #0x0
    beq .L_4cc
.L_4c4:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_4cc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_4d4:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_4ec:
    ldr r0, _LIT0
    bl func_ov002_022a6cc4
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d1410
_LIT1: .word data_ov002_022d1b7c
_LIT2: .word data_ov002_022d1a9c
_LIT3: .word data_ov002_022d11bc
_LIT4: .word data_ov002_022d1af8
_LIT5: .word data_ov002_022d1400
