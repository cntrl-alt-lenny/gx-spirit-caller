; func_02088874 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a520c
        .extern data_021a524c
        .extern func_02087328
        .extern func_0208738c
        .extern func_020873cc
        .extern func_020924c0
        .extern func_02094dd8
        .extern func_02095030
        .extern func_020955a8
        .extern func_020955e8
        .extern func_02095678
        .global func_02088874
        .arm
func_02088874:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    ldr r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    ldr r1, [r4, #0x2c]
    mov r3, #0x0
    cmp r1, #0x0
    movge r7, #0x1
    movlt r7, #0x0
    cmp r7, #0x0
    movne r0, #0x1
    movne r2, r0, lsl r1
    ldr r0, [r4, #0x24]
    ldr r1, [r4, #0x28]
    moveq r2, #0x0
    bl func_02095030
    cmp r7, #0x0
    beq .L_3c0
    bl func_020955a8
    mov r5, r0
    mov r0, #0x1
    bl func_02095678
    mov r0, r5
    bl func_020955e8
    ldr r6, _LIT1
    mov r5, #0x0
.L_3a8:
    mov r0, r6
    mov r1, r5
    mov r2, r5
    bl func_020924c0
    cmp r0, #0x0
    bne .L_3a8
.L_3c0:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_3d0
    bl func_0208738c
.L_3d0:
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    beq .L_3e0
    bl func_020873cc
.L_3e0:
    cmp r7, #0x0
    beq .L_3f0
    ldr r0, [r4, #0x2c]
    bl func_02087328
.L_3f0:
    ldr r0, [r4, #0x4]
    cmp r0, #0x1
    bne .L_410
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    mov r3, r0
    bl func_02094dd8
.L_410:
    mov r0, #0x0
    str r0, [r4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021a524c
_LIT1: .word data_021a520c
