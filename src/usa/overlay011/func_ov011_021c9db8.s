; func_ov011_021c9db8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_ov000_021c74b4
        .extern func_02013980
        .extern func_ov011_021c9da0
        .extern func_ov011_021c9dac
        .extern func_ov011_021cf218
        .global func_ov011_021c9db8
        .arm
func_ov011_021c9db8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    ldr r0, [r0, #0x900]
    mov r0, r0, lsl #0x15
    mov r0, r0, lsr #0x1e
    tst r0, #0x2
    beq .L_48
    bl GetSystemWork
    ldr r2, [r0, #0x900]
    mov r1, r2, lsl #0x15
    mov r1, r1, lsr #0x1e
    bic r1, r1, #0x2
    bic r2, r2, #0x600
    mov r1, r1, lsl #0x1e
    orr r1, r2, r1, lsr #0x15
    str r1, [r0, #0x900]
    ldmia sp!, {r4, pc}
.L_48:
    cmp r4, #0x0
    bne .L_60
    mov r0, #0x0
    .word 0xebff9e84
    bl func_ov011_021c9da0
    ldmia sp!, {r4, pc}
.L_60:
    bl func_ov011_021cf218
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x0
    beq .L_190
    cmp r4, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x24]
    mov r0, r0, lsl #0xb
    mov r4, r0, lsr #0x18
    bl func_02013980
    cmp r0, #0x0
    bne .L_b0
    cmp r4, #0x32
    cmpne r4, #0x44
    bne .L_b0
    mov r0, #0x1
    .word 0xebff9e6f
    b .L_dc
.L_b0:
    bl func_02013980
    cmp r0, #0x2
    bne .L_d4
    sub r0, r4, #0x21
    cmp r0, #0x1
    bhi .L_d4
    mov r0, #0x2
    .word 0xebff9e66
    b .L_dc
.L_d4:
    mov r0, #0x0
    .word 0xebff9e63
.L_dc:
    cmp r4, #0x2b
    bgt .L_118
    bge .L_15c
    cmp r4, #0x15
    bgt .L_f8
    beq .L_144
    b .L_188
.L_f8:
    cmp r4, #0x22
    bgt .L_188
    cmp r4, #0x20
    blt .L_188
    beq .L_144
    cmp r4, #0x22
    beq .L_168
    b .L_188
.L_118:
    cmp r4, #0x32
    bgt .L_13c
    cmp r4, #0x2f
    blt .L_188
    beq .L_150
    cmp r4, #0x30
    cmpne r4, #0x32
    beq .L_144
    b .L_188
.L_13c:
    cmp r4, #0x44
    bne .L_188
.L_144:
    mov r0, #0xb0
    bl func_ov011_021c9dac
    ldmia sp!, {r4, pc}
.L_150:
    mov r0, #0xa0
    bl func_ov011_021c9dac
    ldmia sp!, {r4, pc}
.L_15c:
    mov r0, #0xcc
    bl func_ov011_021c9dac
    ldmia sp!, {r4, pc}
.L_168:
    bl func_02013980
    cmp r0, #0x0
    bne .L_180
    mov r0, #0xcb
    bl func_ov011_021c9dac
    ldmia sp!, {r4, pc}
.L_180:
    bl func_ov011_021c9da0
    ldmia sp!, {r4, pc}
.L_188:
    bl func_ov011_021c9da0
    ldmia sp!, {r4, pc}
.L_190:
    mov r0, #0x0
    .word 0xebff9e34
    bl func_ov011_021c9da0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov000_021c74b4
