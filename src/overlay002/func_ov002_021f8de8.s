; func_ov002_021f8de8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae514
        .extern func_ov002_021c4c9c
        .extern func_ov002_021deb28
        .extern func_ov002_0226aff0
        .extern func_ov002_0226b0d0
        .global func_ov002_021f8de8
        .arm
func_ov002_021f8de8:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x34
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1b8
    b .L_30
    b .L_64
    b .L_120
    b .L_154
.L_30:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226aff0
    ldr r1, _LIT0
    add sp, sp, #0x34
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, pc}
.L_64:
    ldr r0, _LIT2
    add r2, sp, #0x8
    ldrh r0, [r0, #0xb0]
    mov r1, r0, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c4c9c
    ldr r1, [sp, #0x1c]
    ldr r0, _LIT1
    cmp r1, r0
    movgt r1, r0
    strh r1, [r4, #0x8]
    ldr r1, [sp, #0x20]
    ldr r0, _LIT1
    cmp r1, r0
    movgt r1, r0
    strh r1, [r4, #0xa]
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_e4
    ldrh r1, [r4, #0x8]
    ldrh r0, [r4, #0xa]
    cmp r1, r0
    movcc r1, #0x1
    ldr r0, _LIT4
    movcs r1, #0x0
    str r1, [r0, #0xd44]
    b .L_104
.L_e4:
    mov r3, #0x0
    mov r1, #0x198
    str r3, [sp]
    mov r4, #0xf
    add r2, r1, #0x1
    mov r0, #0x81
    str r4, [sp, #0x4]
    bl func_ov002_021ae514
.L_104:
    ldr r1, _LIT0
    add sp, sp, #0x34
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, pc}
.L_120:
    ldr r0, _LIT2
    ldrh r0, [r0, #0xb0]
    mov r1, r0, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021deb28
    ldr r1, _LIT0
    add sp, sp, #0x34
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, pc}
.L_154:
    ldr r0, _LIT4
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    beq .L_174
    cmp r0, #0x1
    ldreqh r0, [r4, #0xa]
    streqh r0, [r4, #0xc]
    b .L_17c
.L_174:
    ldrh r0, [r4, #0x8]
    strh r0, [r4, #0xc]
.L_17c:
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT4
    ldrh r1, [r4]
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, [r0, #0xd44]
    rsb r0, r3, #0x1
    bl func_ov002_0226b0d0
    ldr r1, _LIT0
    add sp, sp, #0x34
    ldr r2, [r1, #0x5b4]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, pc}
.L_1b8:
    mov r0, #0x1
    add sp, sp, #0x34
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000ffff
_LIT2: .word data_ov002_022d0e6c
_LIT3: .word data_ov002_022cd744
_LIT4: .word data_ov002_022d016c
