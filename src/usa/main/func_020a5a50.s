; func_020a5a50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9844
        .extern data_021a9848
        .extern func_02094688
        .extern func_020a5940
        .extern func_020a59a0
        .global func_020a5a50
        .arm
func_020a5a50:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrb r0, [r6]
    mov r5, r1
    mov r4, r2
    strb r0, [r5]
    ldrb r0, [r5]
    cmp r0, #0x7
    beq .L_38
    cmp r0, #0x8
    beq .L_a4
    cmp r0, #0x9
    beq .L_d0
    b .L_11c
.L_38:
    mov r0, r4
    bl func_020a5940
    cmp r0, #0x0
    ldrne r0, _LIT0
    subne r1, r4, #0x1
    ldrne r0, [r0]
    addne r0, r0, r1, lsl #0x5
    ldmneia sp!, {r4, r5, r6, lr}
    bxne lr
    ldrb r1, [r6, #0x1]
    ldr r0, _LIT1
    strb r1, [r5, #0x2]
    ldrb r2, [r5, #0x2]
    ldr r1, [r0, #0x4]
    cmp r2, r1
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, lr}
    bxgt lr
    ldr r2, [r0]
    add r0, r6, #0x2
    add r1, r5, #0x3
    bl func_02094688
    mov r0, r5
    mov r1, r4
    bl func_020a59a0
    mov r4, r0
    b .L_128
.L_a4:
    ldrb r0, [r6, #0x1]
    add r4, r6, #0x3
    and r0, r0, #0xff
    strh r0, [r5, #0x2]
    ldrb r0, [r6, #0x2]
    ldrh r1, [r5, #0x2]
    mov r0, r0, lsl #0x8
    and r0, r0, #0xff00
    orr r0, r1, r0
    strh r0, [r5, #0x2]
    b .L_128
.L_d0:
    ldrb r0, [r6, #0x1]
    add r4, r6, #0x3
    ldr r1, _LIT1
    and r0, r0, #0xff
    strh r0, [r5, #0x2]
    ldrb r2, [r6, #0x2]
    ldrh r3, [r5, #0x2]
    mov r0, r4
    mov r2, r2, lsl #0x8
    and r2, r2, #0xff00
    orr r2, r3, r2
    strh r2, [r5, #0x2]
    ldr r2, [r1]
    add r1, r5, #0x4
    bl func_02094688
    ldr r0, _LIT1
    ldr r0, [r0]
    add r4, r4, r0
    b .L_128
.L_11c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_128:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a9844
_LIT1: .word data_021a9848
