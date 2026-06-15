; func_0202ee40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202ee40
        .arm
func_0202ee40:
    ldr r2, _LIT0
    cmp r0, r2
    bgt .L_3e0
    bge .L_420
    sub r1, r2, #0x33
    cmp r0, r1
    bgt .L_3d0
    bge .L_420
    sub r1, r2, #0x4a
    sub r1, r0, r1
    cmp r1, #0x8
    addls pc, pc, r1, lsl #0x2
    b .L_428
    b .L_420
    b .L_428
    b .L_428
    b .L_428
    b .L_428
    b .L_428
    b .L_420
    b .L_420
    b .L_420
.L_3d0:
    ldr r1, _LIT1
    cmp r0, r1
    beq .L_420
    b .L_428
.L_3e0:
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_400
    bge .L_420
    add r1, r2, #0x1b
    cmp r0, r1
    beq .L_420
    b .L_428
.L_400:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_414
    beq .L_420
    b .L_428
.L_414:
    add r1, r1, #0x1
    cmp r0, r1
    bne .L_428
.L_420:
    mov r0, #0x1
    bx lr
.L_428:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x000016b4
_LIT1: .word 0x000016b3
_LIT2: .word 0x000017ee
_LIT3: .word 0x00001945
