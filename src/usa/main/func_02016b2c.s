; func_02016b2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02018a04
        .extern func_02018a30
        .extern func_020195b8
        .extern func_02019630
        .extern func_0201aab4
        .extern func_0201b6c8
        .extern func_0201b6f0
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_02016b2c
        .arm
func_02016b2c:
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
    b .L_7a4
    b .L_7d4
    b .L_7ec
    b .L_814
.L_7a4:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019630
    cmp r0, #0x7a
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, #0x7a
    str r1, [r5, #0x8]
    bl func_0201aab4
    ldmia sp!, {r3, r4, r5, pc}
.L_7d4:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldreq r0, _LIT1
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_7ec:
    ldr r1, _LIT2
    mov r0, #0x14
    str r1, [r5, #0x8]
    ldr r1, [r4, #0x900]
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_02018a04
    mov r0, #0xc
    bl func_0201b6c8
    ldmia sp!, {r3, r4, r5, pc}
.L_814:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_838
    b .L_898
    b .L_86c
    b .L_840
.L_838:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_840:
    bl func_02019630
    cmp r0, #0x71
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    bl func_02018a30
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_86c:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    ldreq r0, _LIT4
    streq r0, [r5, #0x8]
    ldrne r0, _LIT5
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_898:
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_0201b774
    mov r0, #0xc
    bl func_0201b6f0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x001e0100
_LIT1: .word 0x001e0200
_LIT2: .word 0x001e0300
_LIT3: .word 0x001e0400
_LIT4: .word 0x001e0401
_LIT5: .word 0x001e0402
_LIT6: .word 0x001e0403
