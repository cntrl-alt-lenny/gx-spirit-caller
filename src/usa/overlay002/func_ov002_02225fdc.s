; func_ov002_02225fdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021d70f0
        .extern func_ov002_021e0f5c
        .extern func_ov002_021e277c
        .global func_ov002_02225fdc
        .arm
func_ov002_02225fdc:
    stmdb sp!, {r4, lr}
    ldrh r2, [r0]
    ldr r1, _LIT0
    cmp r2, r1
    beq .L_2a4
    ldr r1, _LIT1
    cmp r2, r1
    beq .L_2b8
    ldr r1, _LIT2
    cmp r2, r1
    bne .L_2c4
.L_2a4:
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r4, r1, #0x1
    b .L_2c4
.L_2b8:
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x1f
    mov r4, r1, lsr #0x1f
.L_2c4:
    ldr r1, _LIT3
    ldr r2, [r1, #0x5a8]
    sub r2, r2, #0x7d
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_3c4
    b .L_3b0
    b .L_388
    b .L_2f8
    b .L_2ec
.L_2ec:
    mov r2, #0x0
    str r2, [r1, #0x5ac]
    str r2, [r1, #0x5b0]
.L_2f8:
    ldr r1, _LIT4
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r1, _LIT5
    ldr r1, [r1, r3]
    cmp r1, #0x0
    beq .L_380
    ldr r1, _LIT6
    add r1, r1, r3
    ldr r1, [r1, #0x120]
    mov r1, r1, lsl #0x12
    cmp r4, r1, lsr #0x1f
    beq .L_358
    ldr r1, _LIT3
    mov r2, #0x1
    str r2, [r1, #0x5b0]
    ldrh r2, [r0]
    ldr r0, _LIT2
    cmp r2, r0
    beq .L_368
    ldr r0, [r1, #0x5ac]
    add r0, r0, #0x1
    str r0, [r1, #0x5ac]
    b .L_368
.L_358:
    ldr r0, _LIT3
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
.L_368:
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_021d70f0
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_380:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_388:
    mov r0, r4
    bl func_ov002_021e277c
    ldr r0, _LIT3
    ldr r0, [r0, #0x5b0]
    cmp r0, #0x0
    beq .L_3a8
    rsb r0, r4, #0x1
    bl func_ov002_021e277c
.L_3a8:
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_3b0:
    ldr r1, [r1, #0x5ac]
    mov r0, r4
    bl func_ov002_021e0f5c
    mov r0, #0x7c
    ldmia sp!, {r4, pc}
.L_3c4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000015aa
_LIT1: .word 0x000016d9
_LIT2: .word 0x000017f3
_LIT3: .word data_ov002_022ce1a8
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf098
_LIT6: .word data_ov002_022cf08c
