; func_ov002_022a0e60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern func_02001d0c
        .extern func_02001e94
        .extern func_02005088
        .extern func_02005188
        .extern func_0202b7cc
        .extern func_0208de4c
        .extern func_0208e0a0
        .extern func_02094504
        .global func_ov002_022a0e60
        .arm
func_ov002_022a0e60:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    mov r5, r1
    bl func_0208de4c
    ldr r1, _LIT0
    mov r2, #0x0
    mov r4, r0
    str r2, [r1, #0xc]
    cmp r5, #0x0
    beq .L_ab8
    mov r0, r5, lsr #0x10
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    bne .L_9f8
    mov r0, r5
    bl func_0202b7cc
    mov r5, r0
.L_9f8:
    ldr r0, [r6, #0x4]
    mov r1, #0x1a
    cmp r0, #0x0
    bge .L_a64
    ldr r0, _LIT0
    mov r2, #0x2
    bl func_02001d0c
    add r1, r4, #0x40
    mov r0, #0x0
    mov r2, #0x680
    bl func_02094504
    mov r2, #0x1
    mov r1, r5
    str r2, [sp]
    mov r5, #0xc
    ldr r0, _LIT0
    add r2, r4, #0x40
    mov r3, #0x4
    str r5, [sp, #0x4]
    bl func_02005088
    bl func_0208e0a0
    add r1, r0, #0x46
    ldr r0, _LIT0
    mov r2, #0x2
    mov r3, #0x0
    bl func_02001e94
    b .L_ab8
.L_a64:
    ldr r0, _LIT0
    mov r2, #0x12
    bl func_02001d0c
    add r1, r4, #0x40
    mov r0, #0x0
    mov r2, #0x7500
    bl func_02094504
    mov r3, #0x0
    ldr r0, _LIT0
    str r3, [sp]
    mov r2, #0xc
    str r2, [sp, #0x4]
    mov r1, r5
    add r2, r4, #0x40
    bl func_02005188
    bl func_0208e0a0
    add r1, r0, #0x46
    ldr r0, _LIT0
    mov r2, #0x1
    mov r3, #0x0
    bl func_02001e94
.L_ab8:
    ldr r0, _LIT0
    ldr r0, [r0, #0xc]
    add r0, r0, #0x14
    mov r0, r0, lsr #0x3
    add r0, r0, #0x1
    str r0, [r6, #0x30]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02102c90
