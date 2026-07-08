; func_ov002_021f8a10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021ae3dc
        .extern func_ov002_021bb82c
        .extern func_ov002_021d7b2c
        .extern func_ov002_021debec
        .extern func_ov002_021df53c
        .extern func_ov002_021f8924
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_022903f0
        .global func_ov002_021f8a10
        .arm
func_ov002_021f8a10:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1d0
    b .L_2c
    b .L_a4
    b .L_f4
    b .L_154
.L_2c:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_78
    ldrh r1, [r4]
    bl func_ov002_021bb82c
    cmp r0, #0x0
    beq .L_68
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_8c
.L_68:
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_8c
.L_78:
    ldrh r1, [r4, #0x4]
    mov r0, #0xfa
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae3dc
.L_8c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_a4:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021df53c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_f4:
    ldrh r0, [r4, #0x2]
    mov r1, #0x3a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_134
    ldrh r1, [r4]
    ldr r2, _LIT3
    bl func_ov002_022903f0
    b .L_13c
.L_134:
    ldr r0, _LIT3
    bl func_ov002_02259204
.L_13c:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_154:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_1b8
    ldr r2, _LIT2
    ldr ip, [r2, #0xd74]
    cmp ip, #0xb
    bne .L_19c
    ldr r0, [r2, #0xd70]
    ldr r4, _LIT4
    ldr r1, _LIT5
    and r3, r0, #0x1
    mla r4, r3, r1, r4
    ldr r1, [r2, #0xd78]
    add r2, r4, #0x120
    add r1, r2, r1, lsl #0x2
    mov r2, #0x0
    bl func_ov002_021d7b2c
    b .L_1b0
.L_19c:
    ldr r3, [r2, #0xd78]
    ldr r1, [r2, #0xd70]
    mov r0, r4
    add r2, ip, r3
    bl func_ov002_021debec
.L_1b0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_1b8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_1d0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word func_ov002_021f8924
_LIT4: .word data_ov002_022cf08c
_LIT5: .word 0x00000868
