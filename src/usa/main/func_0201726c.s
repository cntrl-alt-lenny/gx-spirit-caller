; func_0201726c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0201725c
        .extern func_02018a30
        .extern func_020195b8
        .extern func_0201960c
        .extern func_02019630
        .extern func_0201b6f0
        .extern func_0201b774
        .global func_0201726c
        .arm
func_0201726c:
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
    b .L_44
    b .L_78
    b .L_168
    b .L_258
.L_44:
    bl func_02019630
    cmp r0, #0x70
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_70
    mov r0, #0x0
    bl func_0201960c
.L_70:
    bl func_02018a30
    ldmia sp!, {r3, r4, r5, pc}
.L_78:
    ldr r0, [r4, #0x924]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_a0
    b .L_144
    b .L_d0
    b .L_a8
    b .L_138
.L_a0:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_a8:
    bl func_02019630
    cmp r0, #0x70
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_d0:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    bne .L_12c
    bl func_0201725c
    cmp r0, #0x0
    ldrne r0, _LIT2
    strne r0, [r5, #0x8]
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x2
    str r0, [r4, #0x920]
    mov r0, #0x6
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_12c:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_138:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_144:
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    bl func_0201960c
    ldmia sp!, {r3, r4, r5, pc}
.L_168:
    ldr r0, [r4, #0x924]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_190
    b .L_234
    b .L_1c0
    b .L_198
    b .L_228
.L_190:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_198:
    bl func_02019630
    cmp r0, #0x70
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1c0:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    bne .L_21c
    bl func_0201725c
    cmp r0, #0x0
    ldrne r0, _LIT8
    strne r0, [r5, #0x8]
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT9
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x3
    str r0, [r4, #0x920]
    mov r0, #0x6
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_21c:
    ldr r0, _LIT10
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_228:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_234:
    ldr r0, _LIT11
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    bl func_0201960c
    ldmia sp!, {r3, r4, r5, pc}
.L_258:
    ldr r0, [r4, #0x924]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_280
    b .L_324
    b .L_2b0
    b .L_288
    b .L_318
.L_280:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_288:
    bl func_02019630
    cmp r0, #0x70
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT12
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_2b0:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    bne .L_30c
    bl func_0201725c
    cmp r0, #0x0
    ldrne r0, _LIT13
    strne r0, [r5, #0x8]
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT14
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x4
    str r0, [r4, #0x920]
    mov r0, #0x6
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_30c:
    ldr r0, _LIT15
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_318:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_324:
    ldr r0, _LIT16
    str r0, [r5, #0x8]
    bl func_0201b774
    ldr r1, [r4, #0x900]
    mov r0, #0xb
    bic r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_0201b6f0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00210100
_LIT1: .word 0x00210200
_LIT2: .word 0x00210201
_LIT3: .word 0x00210204
_LIT4: .word 0x00210202
_LIT5: .word 0x00210205
_LIT6: .word 0x00210203
_LIT7: .word 0x00210300
_LIT8: .word 0x00210301
_LIT9: .word 0x00210304
_LIT10: .word 0x00210302
_LIT11: .word 0x00210303
_LIT12: .word 0x00210400
_LIT13: .word 0x00210401
_LIT14: .word 0x00210404
_LIT15: .word 0x00210402
_LIT16: .word 0x00210403
