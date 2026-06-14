; func_ov014_021b2eec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208c884
        .extern func_ov014_021b3568
        .global func_ov014_021b2eec
        .arm
func_ov014_021b2eec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5]
    mov r4, #0x0
    cmp r1, #0x0
    beq .L_2c
    cmp r1, #0x1
    beq .L_74
    cmp r1, #0x2
    beq .L_88
    b .L_bc
.L_2c:
    ldr r1, [r5, #0x8]
    ldr r0, _LIT0
    add r1, r1, #0x1
    str r1, [r5, #0x8]
    sub r1, r1, #0x10
    bl func_0208c884
    ldr r1, [r5, #0x8]
    ldr r0, _LIT1
    sub r1, r1, #0x10
    bl func_0208c884
    ldr r0, [r5, #0x8]
    cmp r0, #0x10
    blt .L_bc
    mov r0, #0x1
    str r0, [r5]
    mov r0, r4
    str r0, [r5, #0x8]
    b .L_bc
.L_74:
    bl func_ov014_021b3568
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [r5]
    b .L_bc
.L_88:
    ldr r1, [r5, #0x8]
    ldr r0, _LIT0
    add r1, r1, #0x1
    str r1, [r5, #0x8]
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r1, [r5, #0x8]
    ldr r0, _LIT1
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r0, [r5, #0x8]
    cmp r0, #0x10
    movge r4, #0x1
.L_bc:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0400006c
_LIT1: .word 0x0400106c
