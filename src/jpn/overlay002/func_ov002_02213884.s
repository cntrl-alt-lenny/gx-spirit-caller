; func_ov002_02213884 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c83c8
        .extern func_ov002_021d630c
        .extern func_ov002_021de3e8
        .extern func_ov002_021df618
        .extern func_ov002_021e2a2c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021e2ca4
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02253dbc
        .global func_ov002_02213884
        .arm
func_ov002_02213884:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldrh r1, [r8, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r1, #0x0
    bl func_ov002_0223dda4
    and r4, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r5, r0, asr #0x8
    ldr r0, _LIT0
    and r2, r4, #0x1
    ldr r1, _LIT1
    mul r7, r2, r0
    ldr r3, _LIT2
    ldr r2, [r1, #0x5a8]
    and r5, r5, #0xff
    mov r0, #0x14
    smulbb r6, r5, r0
    add r0, r3, r7
    add r0, r0, r6
    ldr r0, [r0, #0x30]
    cmp r2, #0x7e
    mov r0, r0, lsl #0x13
    mov r1, r0, lsr #0x13
    beq .L_43c
    cmp r2, #0x7f
    beq .L_418
    cmp r2, #0x80
    bne .L_490
    mov r1, #0x0
    mov r0, r8
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_410
    ldr r0, _LIT3
    add r0, r0, r7
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    beq .L_410
    ldr r0, _LIT4
    add r0, r0, r7
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    bne .L_410
    bl func_ov002_021e2a4c
    mov r0, r8
    mov r1, r4
    mov r2, r5
    mov r3, #0x1
    bl func_ov002_021d630c
    mov r0, r4
    mov r1, r5
    mov r2, #0x2
    mov r3, #0x1
    bl func_ov002_021e2ca4
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_410:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_418:
    mov r0, r4
    bl func_ov002_021df618
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    mvn r0, #0x0
    mov r1, #0x0
    bl func_ov002_02253dbc
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_43c:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c83c8
    cmp r0, #0x7d0
    mov r0, r8
    mov r1, r4
    ble .L_47c
    mov r2, r5
    mov r3, #0x0
    bl func_ov002_021d630c
    mov r0, r4
    mov r1, r5
    mov r2, #0x2
    mov r3, #0x0
    bl func_ov002_021e2ca4
    b .L_484
.L_47c:
    mov r2, r5
    bl func_ov002_021de3e8
.L_484:
    bl func_ov002_021e2b6c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_490:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022ce1a8
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0c2
_LIT4: .word data_ov002_022cf0c4
