; func_ov002_0227b7cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202f994
        .global func_ov002_0227b7cc
        .arm
func_ov002_0227b7cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0202f994
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT0
    cmp r4, r1
    bgt .L_85c
    bge .L_888
    sub r0, r1, #0xab
    cmp r4, r0
    bgt .L_84c
    bge .L_888
    ldr r0, _LIT1
    cmp r4, r0
    beq .L_888
    b .L_890
.L_84c:
    sub r0, r1, #0x78
    cmp r4, r0
    beq .L_888
    b .L_890
.L_85c:
    ldr r0, _LIT2
    cmp r4, r0
    bgt .L_87c
    bge .L_888
    sub r0, r0, #0xb8
    cmp r4, r0
    beq .L_888
    b .L_890
.L_87c:
    ldr r0, _LIT3
    cmp r4, r0
    bne .L_890
.L_888:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_890:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000013e8
_LIT1: .word 0x00001286
_LIT2: .word 0x0000152e
_LIT3: .word 0x000019bd
