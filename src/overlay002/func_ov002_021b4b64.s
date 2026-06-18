; func_ov002_021b4b64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_021b4b64
        .arm
func_ov002_021b4b64:
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_520
    bge .L_540
    cmp r0, #0x1300
    bgt .L_510
    ldr r1, _LIT1
    cmp r0, r1
    blt .L_548
    cmpne r0, #0x1300
    beq .L_540
    b .L_548
.L_510:
    ldr r1, _LIT2
    cmp r0, r1
    beq .L_540
    b .L_548
.L_520:
    ldr r1, _LIT3
    cmp r0, r1
    bgt .L_534
    beq .L_540
    b .L_548
.L_534:
    add r1, r1, #0xce
    cmp r0, r1
    bne .L_548
.L_540:
    mov r0, #0x1
    bx lr
.L_548:
    mov r0, #0x0
    bx lr
_LIT0: .word 0x00001932
_LIT1: .word 0x000012fd
_LIT2: .word 0x00001517
_LIT3: .word 0x00001a38
