; func_ov002_021b7ad8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b7ad8
        .arm
func_ov002_021b7ad8:
    ldr r3, _LIT0
    cmp r0, r3
    bgt .L_30a4
    bge .L_314c
    ldr r2, _LIT1
    cmp r0, r2
    bgt .L_304c
    sub r1, r2, #0x4
    cmp r0, r1
    blt .L_3008
    cmpne r0, r2
    beq .L_314c
    b .L_3154
.L_3008:
    sub r1, r2, #0x1dc
    cmp r0, r1
    bgt .L_3028
    bge .L_314c
    sub r1, r2, #0x248
    cmp r0, r1
    beq .L_314c
    b .L_3154
.L_3028:
    sub r1, r2, #0x17
    cmp r0, r1
    bgt .L_303c
    beq .L_314c
    b .L_3154
.L_303c:
    sub r1, r2, #0x9
    cmp r0, r1
    beq .L_314c
    b .L_3154
.L_304c:
    add r1, r2, #0xbf
    cmp r0, r1
    bgt .L_3080
    bge .L_314c
    add r1, r2, #0x4b
    cmp r0, r1
    bgt .L_3070
    beq .L_314c
    b .L_3154
.L_3070:
    add r1, r2, #0x56
    cmp r0, r1
    beq .L_314c
    b .L_3154
.L_3080:
    add r1, r2, #0x250
    cmp r0, r1
    bgt .L_3094
    beq .L_314c
    b .L_3154
.L_3094:
    sub r1, r3, #0x59
    cmp r0, r1
    beq .L_314c
    b .L_3154
.L_30a4:
    add r1, r3, #0x19c
    cmp r0, r1
    bgt .L_30f8
    bge .L_314c
    add r1, r3, #0xd
    cmp r0, r1
    bgt .L_30d4
    bge .L_314c
    add r1, r3, #0x9
    cmp r0, r1
    beq .L_314c
    b .L_3154
.L_30d4:
    add r1, r3, #0x81
    cmp r0, r1
    bgt .L_30e8
    beq .L_314c
    b .L_3154
.L_30e8:
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_314c
    b .L_3154
.L_30f8:
    add r1, r3, #0x264
    cmp r0, r1
    bgt .L_312c
    bge .L_314c
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_311c
    beq .L_314c
    b .L_3154
.L_311c:
    add r1, r1, #0x41
    cmp r0, r1
    beq .L_314c
    b .L_3154
.L_312c:
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_3140
    beq .L_314c
    b .L_3154
.L_3140:
    add r1, r1, #0x95
    cmp r0, r1
    bne .L_3154
.L_314c:
    mov r0, #0x1
    bx lr
.L_3154:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000017b9
_LIT1: .word 0x000014de
_LIT2: .word 0x00001936
_LIT3: .word 0x000019c6
_LIT4: .word 0x00001a24
