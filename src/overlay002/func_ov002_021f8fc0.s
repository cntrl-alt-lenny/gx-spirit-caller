; func_ov002_021f8fc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b8a8
        .extern func_ov002_021ae400
        .extern func_ov002_021c38c4
        .extern func_ov002_021d7a1c
        .extern func_ov002_021f4a4c
        .extern func_ov002_022107b4
        .extern func_ov002_022592ec
        .extern func_ov002_022593f4
        .extern func_ov002_02290500
        .global func_ov002_021f8fc0
        .arm
func_ov002_021f8fc0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r6, r0
    ldr r0, [r2, #0x5b4]
    cmp r0, #0x0
    beq .L_204
    cmp r0, #0x1
    beq .L_284
    cmp r0, #0x2
    beq .L_358
    b .L_380
.L_204:
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x23
    bne .L_228
    mov r0, #0x2
    str r0, [r2, #0x5b4]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_228:
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0x29
    bl func_ov002_021ae400
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_264
    ldr r2, _LIT2
    mov r1, #0x2
    bl func_ov002_02290500
    b .L_26c
.L_264:
    ldr r0, _LIT2
    bl func_ov002_022592ec
.L_26c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_284:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_340
    ldr r0, _LIT3
    ldr r4, [r0, #0xd70]
    ldr r5, [r0, #0xd78]
    mov r0, r4
    mov r1, r5
    bl func_ov002_021d7a1c
    ldrh r1, [r6]
    ldr r0, _LIT4
    cmp r1, r0
    beq .L_300
    add r0, r0, #0x36
    cmp r1, r0
    bne .L_328
    ldr r2, _LIT5
    ldr r0, _LIT6
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    add r0, r0, #0x120
    ldr r2, [r0, r5, lsl #0x2]
    mov r0, r4
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c38c4
    strh r0, [r6, #0xc]
    b .L_328
.L_300:
    ldr r0, _LIT6
    ldr r1, _LIT5
    and r2, r4, #0x1
    mla r0, r2, r0, r1
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
    strh r0, [r6, #0xc]
.L_328:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_340:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_358:
    ldrh r2, [r6]
    ldr r0, _LIT7
    cmp r2, r0
    ldrne r0, _LIT4
    cmpne r2, r0
    bne .L_378
    mov r0, r6
    bl func_ov002_021f4a4c
.L_378:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_380:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word func_ov002_022107b4
_LIT3: .word data_ov002_022d016c
_LIT4: .word 0x00001895
_LIT5: .word data_ov002_022cf16c
_LIT6: .word 0x00000868
_LIT7: .word 0x00001727
