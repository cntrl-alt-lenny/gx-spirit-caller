; func_020191dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020191dc
        .arm
func_020191dc:
    cmp r0, #0x3a
    bgt .L_50
    bge .L_104
    cmp r0, #0x2d
    bgt .L_44
    bge .L_d4
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_114
    b .L_114
    b .L_114
    b .L_bc
    b .L_c4
    b .L_114
    b .L_cc
    b .L_114
    b .L_e4
.L_44:
    cmp r0, #0x34
    beq .L_f4
    b .L_114
.L_50:
    cmp r0, #0x5e
    bgt .L_b0
    bge .L_c4
    sub r1, r0, #0x3b
    cmp r1, #0x10
    addls pc, pc, r1, lsl #0x2
    b .L_114
    b .L_dc
    b .L_dc
    b .L_dc
    b .L_ec
    b .L_e4
    b .L_10c
    b .L_114
    b .L_114
    b .L_114
    b .L_114
    b .L_114
    b .L_114
    b .L_e4
    b .L_fc
    b .L_d4
    b .L_bc
    b .L_cc
.L_b0:
    cmp r0, #0x5f
    beq .L_104
    b .L_114
.L_bc:
    mov r0, #0x2
    bx lr
.L_c4:
    mov r0, #0x3
    bx lr
.L_cc:
    mov r0, #0x5
    bx lr
.L_d4:
    mov r0, #0x2d
    bx lr
.L_dc:
    mov r0, #0x3b
    bx lr
.L_e4:
    mov r0, #0x7
    bx lr
.L_ec:
    mov r0, #0x3c
    bx lr
.L_f4:
    mov r0, #0x34
    bx lr
.L_fc:
    mov r0, #0x43
    bx lr
.L_104:
    mov r0, #0x3a
    bx lr
.L_10c:
    mov r0, #0x56
    bx lr
.L_114:
    cmp r0, #0x41
    blt .L_128
    cmp r0, #0x46
    suble r0, r0, #0x4
    bxle lr
.L_128:
    cmp r0, #0x4c
    bxlt lr
    cmp r0, #0x5d
    suble r0, r0, #0x8
    bx lr
