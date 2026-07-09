; func_ov002_021b6338 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b6338
        .arm
func_ov002_021b6338:
    ldrh r1, [r0]
    ldr ip, _LIT0
    cmp r1, ip
    bgt .L_1908
    bge .L_19d0
    ldr r2, _LIT1
    cmp r1, r2
    bgt .L_189c
    bge .L_19c8
    sub r0, r2, #0xf1
    cmp r1, r0
    bgt .L_1878
    bge .L_19d0
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_19f4
    b .L_19fc
.L_1878:
    sub r0, r2, #0x2e
    cmp r1, r0
    bgt .L_188c
    beq .L_19c8
    b .L_19fc
.L_188c:
    sub r0, r2, #0x25
    cmp r1, r0
    beq .L_19f4
    b .L_19fc
.L_189c:
    sub r0, ip, #0x34
    cmp r1, r0
    bgt .L_18e4
    bge .L_19f4
    add r0, r2, #0x2b
    cmp r1, r0
    bgt .L_18d4
    add r0, r2, #0x2a
    cmp r1, r0
    blt .L_19fc
    addne r0, r2, #0x2b
    cmpne r1, r0
    beq .L_19d0
    b .L_19fc
.L_18d4:
    add r0, r2, #0xba
    cmp r1, r0
    beq .L_19f4
    b .L_19fc
.L_18e4:
    sub r0, ip, #0x13
    cmp r1, r0
    bgt .L_18f8
    beq .L_19d0
    b .L_19fc
.L_18f8:
    sub r0, ip, #0xf
    cmp r1, r0
    beq .L_19d0
    b .L_19fc
.L_1908:
    ldr r3, _LIT3
    cmp r1, r3
    bgt .L_1970
    bge .L_19f4
    sub r0, r3, #0x9a
    cmp r1, r0
    bgt .L_194c
    bge .L_19c8
    add r0, ip, #0x55
    cmp r1, r0
    bgt .L_193c
    beq .L_19d0
    b .L_19fc
.L_193c:
    add r0, ip, #0x88
    cmp r1, r0
    beq .L_19f4
    b .L_19fc
.L_194c:
    sub r0, r3, #0x97
    cmp r1, r0
    bgt .L_1960
    beq .L_19d0
    b .L_19fc
.L_1960:
    sub r0, r3, #0x5b
    cmp r1, r0
    beq .L_19f4
    b .L_19fc
.L_1970:
    add r2, r3, #0x198
    cmp r1, r2
    bgt .L_19a4
    bge .L_19d8
    add r0, r3, #0x2b
    cmp r1, r0
    bgt .L_1994
    beq .L_19d0
    b .L_19fc
.L_1994:
    ldr r0, _LIT4
    cmp r1, r0
    beq .L_19c8
    b .L_19fc
.L_19a4:
    add r0, r3, #0x1b4
    cmp r1, r0
    bgt .L_19b8
    beq .L_19c8
    b .L_19fc
.L_19b8:
    ldr r0, _LIT5
    cmp r1, r0
    beq .L_19f4
    b .L_19fc
.L_19c8:
    mov r0, #0x1
    bx lr
.L_19d0:
    mov r0, #0x2
    bx lr
.L_19d8:
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    bne .L_19fc
    mov r0, #0x2
    bx lr
.L_19f4:
    mov r0, #0x3
    bx lr
.L_19fc:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x0000151c
_LIT1: .word 0x000012fa
_LIT2: .word 0x000011f5
_LIT3: .word 0x00001803
_LIT4: .word 0x00001970
_LIT5: .word 0x00001b5a
