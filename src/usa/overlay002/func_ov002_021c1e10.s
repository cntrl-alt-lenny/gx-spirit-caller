; func_ov002_021c1e10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_ov002_021b9dec
        .extern func_ov002_021bad9c
        .extern func_ov002_021baf88
        .extern func_ov002_021c8860
        .global func_ov002_021c1e10
        .arm
func_ov002_021c1e10:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r1, _LIT0
    and r3, r5, #0x1
    mov r4, r2
    mov r2, #0x14
    mul r1, r3, r1
    ldr r3, _LIT1
    mul r2, r4, r2
    add r3, r3, r1
    add r3, r3, r2
    ldr r3, [r3, #0x30]
    mov r6, r0
    mov r0, r3, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    add r0, r0, r1
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT3
    ldr r0, [r0, #0x5c0]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r4, #0x4
    bgt .L_164
    ldr r0, _LIT4
    add r0, r0, r1
    ldr r0, [r2, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_c0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9dec
    ldr r2, _LIT5
    cmp r0, r2
    addne r1, r2, #0x1
    cmpne r0, r1
    addne r1, r2, #0x2
    cmpne r0, r1
    bne .L_c0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_c0:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8860
    cmp r0, #0x1
    bne .L_110
    ldr r0, _LIT6
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT7
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
.L_110:
    ldrh r0, [r6, #0x2]
    ldr r1, _LIT8
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bad9c
    cmp r0, #0x0
    beq .L_164
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9dec
    ldr r2, _LIT9
    cmp r0, r2
    addne r1, r2, #0x1
    cmpne r0, r1
    addne r1, r2, #0x2
    cmpne r0, r1
    bne .L_164
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_164:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022ce1a8
_LIT4: .word data_ov002_022cf0cc
_LIT5: .word 0x00001386
_LIT6: .word 0x0000128b
_LIT7: .word 0x00001879
_LIT8: .word 0x000017dc
_LIT9: .word 0x000017d2
