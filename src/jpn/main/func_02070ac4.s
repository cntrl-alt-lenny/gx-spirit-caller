; func_02070ac4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee34
        .extern data_021a62f0
        .extern func_02074374
        .extern func_02074638
        .extern func_02092fc8
        .global func_02070ac4
        .arm
func_02070ac4:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    ldr r4, [r0, #0xa4]
    cmp r4, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldrb r0, [r4, #0x9]
    cmp r0, #0x0
    beq .L_30
    mov r0, r4
    bl func_02074638
.L_30:
    bl func_02092fc8
    mov r6, r0, lsr #0x10
    orr r6, r6, r1, lsl #0x10
    ldr r5, _LIT1
    b .L_48
.L_44:
    bl func_02074374
.L_48:
    ldr r0, [r5]
    blx r0
    cmp r0, #0x0
    beq .L_7c
    ldrb r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_7c
    bl func_02092fc8
    mov r0, r0, lsr #0x10
    orr r0, r0, r1, lsl #0x10
    sub r0, r0, r6
    cmp r0, #0x27
    blt .L_44
.L_7c:
    mov r0, #0x0
    strb r0, [r4, #0x8]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a62f0
_LIT1: .word data_0219ee34
