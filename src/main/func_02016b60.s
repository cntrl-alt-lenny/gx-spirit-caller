; func_02016b60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02018a38
        .extern func_02018a64
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201aaf4
        .extern func_0201b708
        .extern func_0201b730
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_02016b60
        .arm
func_02016b60:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_3140
    b .L_3170
    b .L_3188
    b .L_31b0
.L_3140:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019664
    cmp r0, #0x7a
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, #0x7a
    str r1, [r5, #0x8]
    bl func_0201aaf4
    ldmia sp!, {r3, r4, r5, pc}
.L_3170:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldreq r0, _LIT1
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_3188:
    ldr r1, _LIT2
    mov r0, #0x14
    str r1, [r5, #0x8]
    ldr r1, [r4, #0x900]
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_02018a38
    mov r0, #0xc
    bl func_0201b708
    ldmia sp!, {r3, r4, r5, pc}
.L_31b0:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_31d4
    b .L_3234
    b .L_3208
    b .L_31dc
.L_31d4:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_31dc:
    bl func_02019664
    cmp r0, #0x71
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    bl func_02018a64
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_3208:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    ldreq r0, _LIT4
    streq r0, [r5, #0x8]
    ldrne r0, _LIT5
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_3234:
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_0201b7b4
    mov r0, #0xc
    bl func_0201b730
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x001e0100
_LIT1: .word 0x001e0200
_LIT2: .word 0x001e0300
_LIT3: .word 0x001e0400
_LIT4: .word 0x001e0401
_LIT5: .word 0x001e0402
_LIT6: .word 0x001e0403
