; func_ov002_02241f04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3dc
        .extern func_ov002_021b4040
        .extern func_ov002_021b939c
        .extern func_ov002_021d5a90
        .extern func_ov002_0223d9e0
        .global func_ov002_02241f04
        .arm
func_ov002_02241f04:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x5b8]
    cmp r0, #0x0
    beq .L_418
    cmp r0, #0x1
    beq .L_4c4
    b .L_4dc
.L_418:
    ldrh r0, [r5, #0x2]
    ldr r2, _LIT1
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b4040
    movs r4, r0
    bmi .L_46c
    bl func_ov002_021b939c
    mov r1, r4, lsl #0x10
    mov r0, r5
    mov r1, r1, lsr #0x10
    bl func_ov002_0223d9e0
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021d5a90
    b .L_474
.L_46c:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_474:
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_4a0
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_4ac
.L_4a0:
    mov r1, r4
    mov r0, #0x35
    bl func_ov002_021ae3dc
.L_4ac:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_4c4:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    movne r0, #0x1
    mvneq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_4dc:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001415
_LIT2: .word data_ov002_022cd664
_LIT3: .word data_ov002_022d008c
