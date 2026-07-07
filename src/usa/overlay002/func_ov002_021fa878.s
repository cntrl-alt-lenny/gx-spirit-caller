; func_ov002_021fa878 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021debec
        .extern func_ov002_021f4004
        .extern func_ov002_022574e0
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0226adb8
        .global func_ov002_021fa878
        .arm
func_ov002_021fa878:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5b4]
    cmp r1, #0x0
    beq .L_2c
    cmp r1, #0x1
    beq .L_70
    cmp r1, #0x2
    beq .L_c8
    b .L_f0
.L_2c:
    ldrh r0, [r4, #0x2]
    mov r1, #0x3a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_70:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_b0
    ldr r1, _LIT2
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_021debec
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_b0:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_c8:
    bl func_ov002_021f4004
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r3, r2
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226adb8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_f0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_022574e0
_LIT2: .word data_ov002_022d008c
