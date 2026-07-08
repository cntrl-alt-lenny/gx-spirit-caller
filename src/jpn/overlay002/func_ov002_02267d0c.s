; func_ov002_02267d0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_02267d0c
        .arm
func_ov002_02267d0c:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_54
    bge .L_dc
    sub r1, r2, #0x99
    cmp r0, r1
    bgt .L_30
    bge .L_cc
    sub r1, r2, #0xaf
    cmp r0, r1
    beq .L_c4
    b .L_134
.L_30:
    sub r1, r2, #0x78
    cmp r0, r1
    bgt .L_44
    beq .L_bc
    b .L_134
.L_44:
    sub r1, r2, #0x5
    cmp r0, r1
    beq .L_d4
    b .L_134
.L_54:
    add r1, r2, #0x240
    cmp r0, r1
    bgt .L_74
    bge .L_ec
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_e4
    b .L_134
.L_74:
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_ac
    sub r1, r1, #0x6
    subs r1, r0, r1
    addpl pc, pc, r1, lsl #0x2
    b .L_134
    b .L_f4
    b .L_fc
    b .L_104
    b .L_10c
    b .L_114
    b .L_11c
    b .L_124
.L_ac:
    ldr r1, _LIT3
    cmp r0, r1
    beq .L_12c
    b .L_134
.L_bc:
    mov r0, #0x7d0
    bx lr
.L_c4:
    mov r0, #0x64
    bx lr
.L_cc:
    mov r0, #0x2bc
    bx lr
.L_d4:
    mov r0, #0x3e8
    bx lr
.L_dc:
    mov r0, #0x1f4
    bx lr
.L_e4:
    mov r0, #0x1f4
    bx lr
.L_ec:
    mov r0, #0x3e8
    bx lr
.L_f4:
    mov r0, #0x1f4
    bx lr
.L_fc:
    mov r0, #0x384
    bx lr
.L_104:
    mov r0, #0x1f4
    bx lr
.L_10c:
    mov r0, #0x1f4
    bx lr
.L_114:
    mov r0, #0x1f4
    bx lr
.L_11c:
    mov r0, #0x320
    bx lr
.L_124:
    mov r0, #0x1f4
    bx lr
.L_12c:
    mov r0, #0x1f4
    bx lr
.L_134:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000013f9
_LIT1: .word 0x0000151a
_LIT2: .word 0x00001692
_LIT3: .word 0x00001afc
