; func_02076a8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02076b64
        .extern func_02076b74
        .extern func_02094500
        .extern func_02094688
        .global func_02076a8c
        .arm
func_02076a8c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    ldrb r0, [r5]
    ldrb r1, [r5, #0x1]
    bl func_02076b64
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    ldrb r2, [r5, #0x2]
    ldrb r1, [r5, #0x3]
    ldr r3, _LIT0
    add r0, r5, #0x8
    add r4, r1, r2, lsl #0x8
    smull r2, r1, r3, r4
    add r1, r1, r4, lsr #0x1f
    mov r2, #0x3
    bl func_02076b74
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    strh r0, [r6, #0x32]
    ldrb ip, [r5, #0x4]
    ldrb r0, [r5, #0x5]
    ldrb r3, [r5, #0x6]
    ldrb r2, [r5, #0x7]
    mov r1, #0x0
    add ip, r0, ip, lsl #0x8
    add r0, r4, #0x8
    add r4, r2, r3, lsl #0x8
    add r0, r0, ip
    strb r1, [r6, #0x30]
    cmp r4, #0x20
    add r5, r5, r0
    blt .L_a4
    mov r0, r5
    add r1, r6, #0x34
    mov r2, #0x20
    bl func_02094688
    b .L_c4
.L_a4:
    add r0, r6, #0x34
    rsb r2, r4, #0x20
    bl func_02094500
    add r1, r6, #0x54
    mov r0, r5
    mov r2, r4
    sub r1, r1, r4
    bl func_02094688
.L_c4:
    mov r0, #0x1
    strb r0, [r6, #0x455]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word 0x55555556
