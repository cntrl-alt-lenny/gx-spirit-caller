; func_ov002_0221fafc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_021e27c0
        .extern func_ov002_021e286c
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .extern func_ov002_0227adb8
        .global func_ov002_0221fafc
        .arm
func_ov002_0221fafc:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    bgt .L_c84
    bge .L_d4c
    cmp r0, #0x64
    bgt .L_c5c
    beq .L_dc8
    b .L_de0
.L_c5c:
    cmp r0, #0x6e
    bgt .L_de0
    cmp r0, #0x6c
    blt .L_de0
    beq .L_dac
    cmp r0, #0x6d
    beq .L_d90
    cmp r0, #0x6e
    beq .L_d74
    b .L_de0
.L_c84:
    cmp r0, #0x7f
    bgt .L_c94
    beq .L_d28
    b .L_de0
.L_c94:
    cmp r0, #0x80
    bne .L_de0
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
    ldrh r0, [r4, #0x2]
    bne .L_d10
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x6e
    ldmia sp!, {r4, pc}
.L_d10:
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT1
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_d28:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_d4c:
    bl func_ov002_021afb74
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x1
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_0227adb8
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_d74:
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e27c0
    mov r0, #0x6d
    ldmia sp!, {r4, pc}
.L_d90:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    mov r0, #0x6c
    ldmia sp!, {r4, pc}
.L_dac:
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e27c0
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_dc8:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_de0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000011d
