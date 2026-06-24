; func_ov002_02230cdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021ae4bc
        .extern func_ov002_021ba294
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .extern func_ov002_0227adb8
        .global func_ov002_02230cdc
        .arm
func_ov002_02230cdc:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x64
    bgt .L_20
    beq .L_200
    b .L_218
.L_20:
    sub r0, r0, #0x78
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_218
    b .L_1e4
    b .L_218
    b .L_218
    b .L_218
    b .L_218
    b .L_1c8
    b .L_168
    b .L_e0
    b .L_54
.L_54:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    bne .L_c8
    ldrh r0, [r4, #0x2]
    mov r1, #0xd
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x78
    ldmia sp!, {r4, pc}
.L_c8:
    bl func_ov002_021e2b3c
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd44]
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_e0:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_118
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    bne .L_120
.L_118:
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_120:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_14c
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_160
.L_14c:
    ldrh r1, [r4, #0x4]
    mov r0, #0x35
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021ae4bc
.L_160:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_168:
    ldr r0, _LIT1
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x7d
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r4, r0, lsr #0x1f
    mov r0, r4
    bl func_ov002_021ba294
    ldr r3, _LIT3
    ldr r1, _LIT4
    and r2, r4, #0x1
    mla r1, r2, r1, r3
    mov r2, r0
    add r1, r1, #0x260
    add r1, r1, r2, lsl #0x2
    mov r0, r4
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0227adb8
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_1c8:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1e4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_200:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_218:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022cd744
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00000868
