; func_ov002_0227ee34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc88
        .extern func_0202e2c8
        .extern func_ov002_021bb950
        .global func_ov002_0227ee34
        .arm
func_ov002_0227ee34:
    stmdb sp!, {r3, lr}
    ldr ip, _LIT0
    cmp r0, ip
    bgt .L_6c
    bge .L_1d0
    sub r2, ip, #0x16c
    cmp r0, r2
    bgt .L_48
    bge .L_d0
    ldr r3, _LIT1
    cmp r0, r3
    bgt .L_38
    beq .L_1a4
    b .L_1d8
.L_38:
    add r2, r3, #0x50
    cmp r0, r2
    beq .L_180
    b .L_1d8
.L_48:
    ldr r2, _LIT2
    cmp r0, r2
    bgt .L_5c
    beq .L_d0
    b .L_1d8
.L_5c:
    sub r2, ip, #0x36
    cmp r0, r2
    beq .L_1a4
    b .L_1d8
.L_6c:
    ldr r3, _LIT3
    cmp r0, r3
    bgt .L_a0
    bge .L_1d0
    add r2, ip, #0x114
    cmp r0, r2
    bgt .L_90
    beq .L_d0
    b .L_1d8
.L_90:
    sub r1, r3, #0xb2
    cmp r0, r1
    beq .L_1d0
    b .L_1d8
.L_a0:
    add r2, r3, #0x78
    cmp r0, r2
    bgt .L_c0
    bge .L_1d0
    add r2, r3, #0x29
    cmp r0, r2
    beq .L_1a4
    b .L_1d8
.L_c0:
    ldr r2, _LIT4
    cmp r0, r2
    beq .L_1a4
    b .L_1d8
.L_d0:
    ldr r3, _LIT5
    ldr r2, _LIT6
    ldr r1, [r3, r1, lsl #0x2]
    mov r1, r1, lsl #0x13
    cmp r2, r1, lsr #0x13
    mov r3, r1, lsr #0x13
    bcc .L_104
    cmp r3, r2
    bcs .L_178
    ldr r1, _LIT7
    cmp r3, r1
    beq .L_130
    b .L_1d8
.L_104:
    add r0, r2, #0x1e
    cmp r3, r0
    bhi .L_118
    beq .L_128
    b .L_1d8
.L_118:
    add r0, r2, #0x39c
    cmp r3, r0
    beq .L_144
    b .L_1d8
.L_128:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_130:
    sub r1, r1, #0x46
    cmp r0, r1
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
.L_144:
    add r1, r2, #0x20c
    mov r0, #0x0
    bl func_ov002_021bb950
    cmp r0, #0x0
    bne .L_170
    ldr r1, _LIT8
    mov r0, #0x1
    bl func_ov002_021bb950
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
.L_170:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_178:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_180:
    ldr r2, _LIT5
    add r0, r3, #0x550
    ldr r1, [r2, r1, lsl #0x2]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    cmp r1, r0
    bne .L_1d8
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1a4:
    ldr r2, _LIT5
    ldr r0, _LIT9
    ldr r1, [r2, r1, lsl #0x2]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    cmp r1, r0
    addne r0, r0, #0x2b
    cmpne r1, r0
    bne .L_1d8
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1d0:
    bl func_0202e2c8
    ldmia sp!, {r3, pc}
.L_1d8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x000014d2
_LIT1: .word 0x000012e5
_LIT2: .word 0x0000137d
_LIT3: .word 0x000018f7
_LIT4: .word 0x00001a7e
_LIT5: .word data_ov002_022cdc88
_LIT6: .word 0x00001578
_LIT7: .word 0x000013c3
_LIT8: .word 0x00001784
_LIT9: .word 0x00001956
