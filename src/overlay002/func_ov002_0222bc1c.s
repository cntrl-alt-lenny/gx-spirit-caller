; func_ov002_0222bc1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021d479c
        .extern func_ov002_021d87dc
        .extern func_ov002_021e2818
        .extern func_ov002_021e286c
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .extern func_ov002_0226b094
        .extern func_ov002_0226b194
        .global func_ov002_0222bc1c
        .arm
func_ov002_0222bc1c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    sub r0, r0, #0x76
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b .L_310
    b .L_2f4
    b .L_2dc
    b .L_2bc
    b .L_310
    b .L_310
    b .L_310
    b .L_310
    b .L_310
    b .L_310
    b .L_22c
    b .L_1e0
.L_1e0:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0225368c
    cmp r0, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b194
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_22c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e286c
    ldrh r0, [r4, #0x2]
    mov r3, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsbs r0, r0, #0x1
    movne r1, #0x8000
    ldr r0, _LIT1
    moveq r1, #0x0
    orr r1, r1, #0x57
    ldrh r2, [r0, #0xb2]
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0xd
    bl func_ov002_021d479c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e2818
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021d87dc
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e2818
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_2bc:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b094
    mov r0, #0x77
    ldmia sp!, {r4, pc}
.L_2dc:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226b054
    mov r0, #0x76
    ldmia sp!, {r4, pc}
.L_2f4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_310:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
