; func_ov002_022a0d50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern func_02001cec
        .extern func_02001e74
        .extern func_0200506c
        .extern func_0200516c
        .extern func_0202b778
        .extern func_0208dd64
        .extern func_0208dfb8
        .extern func_02094410
        .global func_ov002_022a0d50
        .arm
func_ov002_022a0d50:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    mov r5, r1
    bl func_0208dd64
    ldr r1, _LIT0
    mov r2, #0x0
    mov r4, r0
    str r2, [r1, #0xc]
    cmp r5, #0x0
    beq .L_258
    mov r0, r5, lsr #0x10
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    bne .L_198
    mov r0, r5
    bl func_0202b778
    mov r5, r0
.L_198:
    ldr r0, [r6, #0x4]
    mov r1, #0x1a
    cmp r0, #0x0
    bge .L_204
    ldr r0, _LIT0
    mov r2, #0x2
    bl func_02001cec
    add r1, r4, #0x40
    mov r0, #0x0
    mov r2, #0x680
    bl func_02094410
    mov r2, #0x1
    mov r1, r5
    str r2, [sp]
    mov r5, #0xc
    ldr r0, _LIT0
    add r2, r4, #0x40
    mov r3, #0x4
    str r5, [sp, #0x4]
    bl func_0200506c
    bl func_0208dfb8
    add r1, r0, #0x46
    ldr r0, _LIT0
    mov r2, #0x2
    mov r3, #0x0
    bl func_02001e74
    b .L_258
.L_204:
    ldr r0, _LIT0
    mov r2, #0x12
    bl func_02001cec
    add r1, r4, #0x40
    mov r0, #0x0
    mov r2, #0x7500
    bl func_02094410
    mov r3, #0x0
    ldr r0, _LIT0
    str r3, [sp]
    mov r2, #0xc
    str r2, [sp, #0x4]
    mov r1, r5
    add r2, r4, #0x40
    bl func_0200516c
    bl func_0208dfb8
    add r1, r0, #0x46
    ldr r0, _LIT0
    mov r2, #0x1
    mov r3, #0x0
    bl func_02001e74
.L_258:
    ldr r0, _LIT0
    ldr r0, [r0, #0xc]
    add r0, r0, #0x14
    mov r0, r0, lsr #0x3
    add r0, r0, #0x1
    str r0, [r6, #0x30]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02102bb0
