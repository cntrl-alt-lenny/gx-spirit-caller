; func_ov002_0224192c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021d8fd0
        .extern func_ov002_0223d9e0
        .extern func_ov002_0226afe0
        .global func_ov002_0224192c
        .arm
func_ov002_0224192c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_194
    b .L_2c
    b .L_58
    b .L_128
    b .L_170
.L_2c:
    ldrh r0, [r4, #0x2]
    mov r1, #0x91
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_58:
    ldrh r2, [r4]
    ldr r1, _LIT1
    cmp r2, r1
    bgt .L_90
    bge .L_f8
    ldr r0, _LIT2
    cmp r2, r0
    bgt .L_80
    beq .L_c0
    b .L_110
.L_80:
    add r0, r0, #0x200
    cmp r2, r0
    beq .L_dc
    b .L_110
.L_90:
    add r0, r1, #0xf5
    cmp r2, r0
    bgt .L_b0
    bge .L_f8
    add r0, r1, #0xbf
    cmp r2, r0
    beq .L_f8
    b .L_110
.L_b0:
    ldr r0, _LIT3
    cmp r2, r0
    beq .L_f8
    b .L_110
.L_c0:
    ldrh r0, [r4, #0x2]
    mov r1, #0x4b
    mov r3, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021af8f0
    b .L_110
.L_dc:
    ldrh r0, [r4, #0x2]
    mov r1, #0x4d
    mov r3, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021af8f0
    b .L_110
.L_f8:
    ldrh r0, [r4, #0x2]
    mov r1, #0x4c
    mov r3, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021af8f0
.L_110:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_128:
    ldr r1, _LIT4
    ldr r1, [r1, #0xd44]
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_0223d9e0
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4, #0x8]
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8fd0
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_170:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldrh r2, [r4, #0x8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afe0
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_194:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x000015de
_LIT2: .word 0x00001368
_LIT3: .word 0x00001803
_LIT4: .word data_ov002_022d008c
