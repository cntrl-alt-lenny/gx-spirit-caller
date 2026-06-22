; func_ov002_02229dcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .global func_ov002_02229dcc
        .arm
func_ov002_02229dcc:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    ldr r3, [r3, #0x48c]
    ldrh ip, [r3, #0x2]
    mov ip, ip, lsl #0x1f
    cmp r0, ip, lsr #0x1f
    cmpeq r1, #0xb
    bne .L_104
    ldr r1, _LIT1
    ldr ip, _LIT2
    and lr, r0, #0x1
    mla r0, lr, r1, ip
    add r0, r0, r2, lsl #0x2
    ldr r0, [r0, #0x120]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x13
    cmp r1, r0, lsr #0x13
    mov r2, r0, lsr #0x13
    blt .L_64
    cmp r2, r1
    bge .L_b8
    sub r0, r1, #0xed
    cmp r2, r0
    beq .L_a4
    b .L_104
.L_64:
    add r0, r1, #0x38
    cmp r2, r0
    bgt .L_78
    beq .L_cc
    b .L_104
.L_78:
    add r0, r1, #0x68
    cmp r2, r0
    bgt .L_104
    add r0, r1, #0x67
    cmp r2, r0
    blt .L_104
    beq .L_e0
    add r0, r1, #0x68
    cmp r2, r0
    beq .L_f4
    b .L_104
.L_a4:
    ldrh r0, [r3, #0x8]
    tst r0, #0x1
    bne .L_104
    mov r0, #0x800
    ldmia sp!, {r3, pc}
.L_b8:
    ldrh r0, [r3, #0x8]
    tst r0, #0x2
    bne .L_104
    mov r0, #0x800
    ldmia sp!, {r3, pc}
.L_cc:
    ldrh r0, [r3, #0x8]
    tst r0, #0x4
    bne .L_104
    mov r0, #0x800
    ldmia sp!, {r3, pc}
.L_e0:
    ldrh r0, [r3, #0x8]
    tst r0, #0x8
    bne .L_104
    mov r0, #0x800
    ldmia sp!, {r3, pc}
.L_f4:
    ldrh r0, [r3, #0x8]
    tst r0, #0x10
    moveq r0, #0x800
    ldmeqia sp!, {r3, pc}
.L_104:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x0000161e
