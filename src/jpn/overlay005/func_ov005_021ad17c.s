; func_ov005_021ad17c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208c79c
        .extern func_ov005_021ae49c
        .global func_ov005_021ad17c
        .arm
func_ov005_021ad17c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5]
    mov r4, #0x0
    cmp r1, #0x0
    beq .L_2c
    cmp r1, #0x1
    beq .L_74
    cmp r1, #0x2
    beq .L_94
    b .L_c8
.L_2c:
    ldr r1, [r5, #0xc]
    ldr r0, _LIT0
    add r1, r1, #0x1
    str r1, [r5, #0xc]
    sub r1, r1, #0x10
    bl func_0208c79c
    ldr r1, [r5, #0xc]
    ldr r0, _LIT1
    sub r1, r1, #0x10
    bl func_0208c79c
    ldr r0, [r5, #0xc]
    cmp r0, #0x10
    blt .L_c8
    mov r0, #0x1
    str r0, [r5]
    mov r0, r4
    str r0, [r5, #0xc]
    b .L_c8
.L_74:
    bl func_ov005_021ae49c
    cmp r0, #0x0
    beq .L_c8
    mov r0, #0x2
    str r0, [r5]
    mov r0, r4
    str r0, [r5, #0xc]
    b .L_c8
.L_94:
    ldr r1, [r5, #0xc]
    ldr r0, _LIT0
    add r1, r1, #0x1
    str r1, [r5, #0xc]
    rsb r1, r1, #0x0
    bl func_0208c79c
    ldr r1, [r5, #0xc]
    ldr r0, _LIT1
    rsb r1, r1, #0x0
    bl func_0208c79c
    ldr r0, [r5, #0xc]
    cmp r0, #0x10
    movge r4, #0x1
.L_c8:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0400006c
_LIT1: .word 0x0400106c
