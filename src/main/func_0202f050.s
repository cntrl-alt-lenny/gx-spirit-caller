; func_0202f050 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202f050
        .arm
func_0202f050:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_1ac
    bge .L_20c
    sub r1, r2, #0x10c
    cmp r0, r1
    bgt .L_178
    bge .L_20c
    sub r1, r2, #0x20c
    cmp r0, r1
    bgt .L_168
    ldr r2, _LIT1
    cmp r0, r2
    blt .L_214
    addne r1, r2, #0x1
    cmpne r0, r1
    addne r1, r2, #0x2
    cmpne r0, r1
    beq .L_20c
    b .L_214
.L_168:
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_20c
    b .L_214
.L_178:
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_19c
    sub r1, r2, #0x4
    cmp r0, r1
    blt .L_214
    cmpne r0, r2
    beq .L_20c
    b .L_214
.L_19c:
    add r1, r2, #0x9
    cmp r0, r1
    beq .L_20c
    b .L_214
.L_1ac:
    add r1, r2, #0x3
    cmp r0, r1
    bgt .L_1e0
    bge .L_20c
    add r1, r2, #0x1
    cmp r0, r1
    bgt .L_1d0
    beq .L_20c
    b .L_214
.L_1d0:
    add r1, r2, #0x2
    cmp r0, r1
    beq .L_20c
    b .L_214
.L_1e0:
    add r1, r2, #0x5c
    cmp r0, r1
    bgt .L_200
    bge .L_20c
    add r1, r2, #0x5b
    cmp r0, r1
    beq .L_20c
    b .L_214
.L_200:
    add r1, r2, #0x5e
    cmp r0, r1
    bne .L_214
.L_20c:
    mov r0, #0x1
    bx lr
.L_214:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001ab9
_LIT1: .word 0x000018ab
_LIT2: .word 0x000019aa
_LIT3: .word 0x000019b2
