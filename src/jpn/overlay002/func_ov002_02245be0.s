; func_ov002_02245be0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_02245be0
        .arm
func_ov002_02245be0:
    ldrh r0, [r0]
    ldr r3, _LIT0
    cmp r0, r3
    bne .L_b28
    mov r0, #0x1
    bx lr
.L_b28:
    ldr r0, _LIT1
    cmp r1, r0
    bgt .L_b90
    bge .L_bfc
    ldr r2, _LIT2
    cmp r1, r2
    bgt .L_b6c
    sub r0, r2, #0x4
    cmp r1, r0
    blt .L_b5c
    cmpne r1, r2
    beq .L_bfc
    b .L_c04
.L_b5c:
    sub r0, r2, #0xc5
    cmp r1, r0
    beq .L_bfc
    b .L_c04
.L_b6c:
    add r0, r3, #0x82
    cmp r1, r0
    bgt .L_b80
    beq .L_bfc
    b .L_c04
.L_b80:
    add r0, r2, #0x3e4
    cmp r1, r0
    beq .L_bfc
    b .L_c04
.L_b90:
    ldr r2, _LIT3
    cmp r1, r2
    bgt .L_bdc
    bge .L_bfc
    sub r0, r2, #0xa
    cmp r1, r0
    bgt .L_bb4
    beq .L_bfc
    b .L_c04
.L_bb4:
    sub r0, r2, #0x8
    cmp r1, r0
    bgt .L_c04
    sub r0, r2, #0x9
    cmp r1, r0
    blt .L_c04
    subne r0, r2, #0x8
    cmpne r1, r0
    beq .L_bfc
    b .L_c04
.L_bdc:
    add r0, r2, #0x1
    cmp r1, r0
    bgt .L_bf0
    beq .L_bfc
    b .L_c04
.L_bf0:
    add r0, r2, #0x2
    cmp r1, r0
    bne .L_c04
.L_bfc:
    mov r0, #0x1
    bx lr
.L_c04:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000017bc
_LIT1: .word 0x000019b7
_LIT2: .word 0x000015ab
_LIT3: .word 0x00001b02
