; func_ov002_0224431c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_0223dbd0
        .extern func_ov002_0223fc8c
        .extern func_ov002_022574e0
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .global func_ov002_0224431c
        .arm
func_ov002_0224431c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b8]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_13c
    b .L_2c
    b .L_98
    b .L_c4
    b .L_f4
.L_2c:
    mov r6, #0x0
    mov r5, r6
.L_34:
    mov r7, r5
.L_38:
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_78
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_ov002_0223dbd0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_78:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_38
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_34
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_98:
    ldrh r0, [r4, #0x2]
    mov r1, #0x7b
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c4:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_f4:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_124
    ldr r1, _LIT2
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dbd0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_124:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    sub r2, r2, #0x2
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_13c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_0223fc8c
_LIT2: .word data_ov002_022d008c
