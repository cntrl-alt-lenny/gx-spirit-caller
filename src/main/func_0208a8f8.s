; func_0208a8f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c31f8
        .extern data_021a5d3c
        .extern func_02088268
        .extern func_020882fc
        .extern func_0208a7c8
        .extern func_0208b040
        .extern func_0208b058
        .extern func_0208b070
        .global func_0208a8f8
        .arm
func_0208a8f8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r5, _LIT0
    mov r7, #0x0
    ldr r4, _LIT1
.L_254:
    ldr r1, [r5, #0x110]
    mov r0, r1, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_334
    ldr r0, [r5, #0x114]
    cmp r0, #0x0
    bne .L_27c
    mov r0, r5
    bl func_0208a7c8
    b .L_334
.L_27c:
    mov r0, r1, lsl #0x1d
    movs r0, r0, asr #0x1f
    beq .L_2b4
    ldr r0, [r5, #0x118]
    cmp r0, #0x0
    beq .L_2b4
    mov r0, r5
    bl func_020882fc
    ldr r0, [r5, #0x110]
    orr r0, r0, #0x2
    str r0, [r5, #0x110]
    ldr r0, [r5, #0x110]
    bic r0, r0, #0x4
    str r0, [r5, #0x110]
.L_2b4:
    ldr r0, [r5, #0x110]
    mov r0, r0, lsl #0x1e
    movs r0, r0, asr #0x1f
    beq .L_334
    add r0, r5, #0xe8
    bl func_0208b058
    ldr r1, [r5, #0x154]
    add r0, r5, #0xe8
    mov r1, r1, lsl #0x1
    ldrsh r6, [r4, r1]
    bl func_0208b070
    mov r0, r0, asr #0x8
    mov r0, r0, lsl #0x1
    ldrsh r1, [r4, r0]
    ldr r0, [r5, #0x158]
    add r6, r1, r6
    cmp r6, r0
    beq .L_30c
    mov r0, r5
    mov r1, r6
    bl func_02088268
    str r6, [r5, #0x158]
.L_30c:
    ldr r0, [r5, #0x110]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1f
    beq .L_334
    add r0, r5, #0xe8
    bl func_0208b040
    cmp r0, #0x0
    beq .L_334
    mov r0, r5
    bl func_0208a7c8
.L_334:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r5, r5, #0x170
    blt .L_254
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021a5d3c
_LIT1: .word data_020c31f8
