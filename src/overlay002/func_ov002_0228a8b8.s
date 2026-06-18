; func_ov002_0228a8b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_0228a8b8
        .arm
func_ov002_0228a8b8:
    ldrh r3, [r1]
    ldr r2, _LIT0
    cmp r3, r2
    bgt .L_44
    bge .L_9c
    ldr r0, _LIT1
    cmp r3, r0
    bgt .L_34
    bge .L_9c
    sub r0, r0, #0x1e
    cmp r3, r0
    beq .L_9c
    b .L_a4
.L_34:
    ldr r0, _LIT2
    cmp r3, r0
    beq .L_9c
    b .L_a4
.L_44:
    ldr r1, _LIT3
    cmp r3, r1
    bgt .L_7c
    bge .L_9c
    add r0, r2, #0x23
    cmp r3, r0
    bgt .L_a4
    sub r0, r1, #0x13c
    cmp r3, r0
    blt .L_a4
    addne r0, r2, #0x23
    cmpne r3, r0
    beq .L_9c
    b .L_a4
.L_7c:
    add r0, r1, #0x22
    cmp r3, r0
    bgt .L_90
    beq .L_9c
    b .L_a4
.L_90:
    add r0, r1, #0x23
    cmp r3, r0
    bne .L_a4
.L_9c:
    mov r0, #0x1
    bx lr
.L_a4:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000018fe
_LIT1: .word 0x00001303
_LIT2: .word 0x0000149c
_LIT3: .word 0x00001a5c
