; func_0203141c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203141c
        .arm
func_0203141c:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_17c
    bge .L_20c
    sub r1, r3, #0x540
    cmp r0, r1
    bgt .L_158
    bge .L_20c
    cmp r0, #0xfe0
    bgt .L_148
    beq .L_20c
    b .L_214
.L_148:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_20c
    b .L_214
.L_158:
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_16c
    beq .L_20c
    b .L_214
.L_16c:
    add r1, r1, #0xa
    cmp r0, r1
    beq .L_20c
    b .L_214
.L_17c:
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_1c4
    sub r1, r2, #0x1
    cmp r0, r1
    blt .L_1a0
    cmpne r0, r2
    beq .L_20c
    b .L_214
.L_1a0:
    add r1, r3, #0xe5
    cmp r0, r1
    bgt .L_1b4
    beq .L_20c
    b .L_214
.L_1b4:
    ldr r1, _LIT4
    cmp r0, r1
    beq .L_20c
    b .L_214
.L_1c4:
    add r1, r2, #0x11c
    cmp r0, r1
    bgt .L_1e4
    bge .L_20c
    add r1, r2, #0x3b
    cmp r0, r1
    beq .L_20c
    b .L_214
.L_1e4:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_214
    sub r1, r2, #0x2
    cmp r0, r1
    blt .L_214
    subne r1, r2, #0x1
    cmpne r0, r1
    cmpne r0, r2
    bne .L_214
.L_20c:
    mov r0, #0x1
    bx lr
.L_214:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000168f
_LIT1: .word 0x00000fee
_LIT2: .word 0x0000158a
_LIT3: .word 0x00001a25
_LIT4: .word 0x0000179c
_LIT5: .word 0x00001b44
