; func_ov006_021bddd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern data_ov006_0224f448
        .extern data_ov006_0225e068
        .extern func_0202bbc8
        .extern func_0202bbdc
        .extern func_02037208
        .extern func_ov006_021b7bb0
        .extern func_ov006_021b7c94
        .extern func_ov006_021b7cc0
        .extern func_ov006_021b7ce0
        .extern func_ov006_021b8e4c
        .extern func_ov006_021bbdc0
        .extern func_ov006_021bcb94
        .extern func_ov006_021bd700
        .extern func_ov006_021bd864
        .extern func_ov006_021be0b0
        .extern func_ov006_021bf01c
        .extern func_ov006_021bf2a4
        .extern func_ov006_021ca264
        .extern func_ov006_021ca3e0
        .extern func_ov006_021ca3f0
        .global func_ov006_021bddd4
        .arm
func_ov006_021bddd4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    add r5, sp, #0x0
    mov r7, r0
    mov r1, r5
    add r0, r7, #0x88
    mov r2, #0xc
    mov r6, #0x0
    ldr r4, _LIT0
    ldr r8, _LIT1
    bl Copy32
    mov r2, r6
    str r2, [r7, #0x88]
    str r2, [r7, #0x8c]
    str r2, [r7, #0x90]
    ldr r0, [sp]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_7ec
    b .L_7ec
    b .L_590
    b .L_604
    b .L_658
    b .L_6b8
    b .L_6ec
    b .L_7c0
.L_590:
    ldmib r5, {r1, r2}
    cmp r1, r2
    beq .L_7ec
    mov r0, r7
    bl func_ov006_021be0b0
    movs r6, r0
    beq .L_5ec
    ldr r0, [r7, #0x40]
    cmp r0, #0x1
    beq .L_5c4
    cmp r0, #0x2
    beq .L_5e0
    b .L_7ec
.L_5c4:
    mov r0, r7
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov006_021bcb94
    mov r0, r7
    bl func_ov006_021bf01c
    b .L_7ec
.L_5e0:
    mov r0, r7
    bl func_ov006_021bf2a4
    b .L_7ec
.L_5ec:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_7ec
.L_604:
    ldr r1, [r5, #0x4]
    mov r0, r4
    mov r3, #0x1
    bl func_ov006_021b8e4c
    ldr r0, [r7, #0x50]
    mov r1, #0x4
    cmp r0, #0x4
    strne r0, [r7, #0x5c]
    mov r0, r7
    mov r2, #0x0
    str r1, [r7, #0x50]
    bl func_ov006_021bd700
    mov r0, r7
    bl func_ov006_021bbdc0
    mov r0, r7
    bl func_ov006_021bd864
    ldr r0, [r5, #0x4]
    mov r6, #0x1
    str r0, [r7, #0x60]
    str r6, [r7, #0x84]
    b .L_7ec
.L_658:
    ldr r0, [r5, #0x4]
    bl func_0202bbdc
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, [r5, #0x4]
    movne r1, r6
    bl func_0202bbc8
    mov r8, #0x0
    mov r5, #0x1
    mov r7, r8
.L_680:
    mov r0, r4
    mov r1, r8
    mov r2, r7
    bl func_ov006_021b7ce0
    cmp r0, #0x0
    blt .L_6a8
    mov r0, r4
    mov r1, r8
    bl func_ov006_021b7bb0
    mov r6, r5
.L_6a8:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_680
    b .L_7ec
.L_6b8:
    ldr r1, [r7, #0x50]
    ldr r2, [r5, #0x4]
    mov r0, r4
    bl func_ov006_021b7c94
    ldr r1, [r7, #0x50]
    mov r0, r4
    bl func_ov006_021b7bb0
    ldr r1, [r7, #0x50]
    mov r0, r7
    mov r2, r6
    bl func_ov006_021bd700
    mov r6, #0x1
    b .L_7ec
.L_6ec:
    ldr r6, [r5, #0x4]
    cmp r6, #0x0
    bge .L_788
    ldr r5, [r7, #0x50]
    mov r0, r4
    mov r1, r5
    sub r3, r2, #0x1
    bl func_ov006_021b7cc0
    mov r2, #0x1
    mov r0, r4
    mov r1, r5
    sub r3, r2, #0x2
    bl func_ov006_021b7cc0
    mov r2, #0x2
    mov r0, r4
    mov r1, r5
    sub r3, r2, #0x3
    bl func_ov006_021b7cc0
    mov r0, r4
    mov r1, r5
    mov r2, #0x3
    sub r3, r2, #0x4
    bl func_ov006_021b7cc0
    mov r0, r4
    mov r1, r5
    mov r2, #0x4
    sub r3, r2, #0x5
    bl func_ov006_021b7cc0
    mov r0, r4
    mov r1, r5
    mov r2, #0x5
    sub r3, r2, #0x6
    bl func_ov006_021b7cc0
    mov r1, r5
    mov r0, r4
    mov r2, #0x6
    sub r3, r2, #0x7
    bl func_ov006_021b7cc0
    b .L_79c
.L_788:
    ldr r1, [r7, #0x50]
    ldr r3, [r5, #0x8]
    mov r0, r4
    mov r2, r6
    bl func_ov006_021b7cc0
.L_79c:
    ldr r1, [r7, #0x50]
    mov r0, r4
    bl func_ov006_021b7bb0
    ldr r1, [r7, #0x50]
    mov r0, r7
    mov r2, #0x0
    bl func_ov006_021bd700
    mov r6, #0x1
    b .L_7ec
.L_7c0:
    ldr r1, _LIT2
    mov r0, r8
    mov r2, #0xd
    bl func_ov006_021ca3e0
    mov r0, r8
    mov r1, #0x2
    mov r2, #0xe
    bl func_ov006_021ca3f0
    mov r0, r8
    ldmib r5, {r1, r2}
    bl func_ov006_021ca264
.L_7ec:
    mov r0, r6
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word data_ov006_0225e068
_LIT2: .word 0x00000322
