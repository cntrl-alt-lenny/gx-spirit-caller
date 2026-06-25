; func_0208a810 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c3104
        .extern data_021a5c5c
        .extern func_02088180
        .extern func_02088214
        .extern func_0208a6e0
        .extern func_0208af58
        .extern func_0208af70
        .extern func_0208af88
        .global func_0208a810
        .arm
func_0208a810:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r5, _LIT0
    mov r7, #0x0
    ldr r4, _LIT1
.L_14:
    ldr r1, [r5, #0x110]
    mov r0, r1, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_f4
    ldr r0, [r5, #0x114]
    cmp r0, #0x0
    bne .L_3c
    mov r0, r5
    bl func_0208a6e0
    b .L_f4
.L_3c:
    mov r0, r1, lsl #0x1d
    movs r0, r0, asr #0x1f
    beq .L_74
    ldr r0, [r5, #0x118]
    cmp r0, #0x0
    beq .L_74
    mov r0, r5
    bl func_02088214
    ldr r0, [r5, #0x110]
    orr r0, r0, #0x2
    str r0, [r5, #0x110]
    ldr r0, [r5, #0x110]
    bic r0, r0, #0x4
    str r0, [r5, #0x110]
.L_74:
    ldr r0, [r5, #0x110]
    mov r0, r0, lsl #0x1e
    movs r0, r0, asr #0x1f
    beq .L_f4
    add r0, r5, #0xe8
    bl func_0208af70
    ldr r1, [r5, #0x154]
    add r0, r5, #0xe8
    mov r1, r1, lsl #0x1
    ldrsh r6, [r4, r1]
    bl func_0208af88
    mov r0, r0, asr #0x8
    mov r0, r0, lsl #0x1
    ldrsh r1, [r4, r0]
    ldr r0, [r5, #0x158]
    add r6, r1, r6
    cmp r6, r0
    beq .L_cc
    mov r0, r5
    mov r1, r6
    bl func_02088180
    str r6, [r5, #0x158]
.L_cc:
    ldr r0, [r5, #0x110]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1f
    beq .L_f4
    add r0, r5, #0xe8
    bl func_0208af58
    cmp r0, #0x0
    beq .L_f4
    mov r0, r5
    bl func_0208a6e0
.L_f4:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r5, r5, #0x170
    blt .L_14
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021a5c5c
_LIT1: .word data_020c3104
