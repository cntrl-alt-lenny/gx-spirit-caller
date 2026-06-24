; func_020147e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02019000
        .extern func_020195b8
        .extern func_02019630
        .extern func_ov000_021ae3a0
        .global func_020147e0
        .arm
func_020147e0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_d18
    b .L_db8
    b .L_d5c
    b .L_d20
.L_d18:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_d20:
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_02019630
    cmp r0, #0x6c
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_d5c:
    bl func_ov000_021ae3a0
    cmp r0, #0x2
    bne .L_d8c
    mov r0, #0xa
    str r0, [r4, #0x91c]
    mov r0, #0x1
    str r0, [r4, #0x920]
    str r0, [r4, #0x924]
    ldr r0, [r4, #0x8e0]
    orr r0, r0, #0x4
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_d8c:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    ldreq r0, _LIT1
    streq r0, [r5, #0x8]
    ldrne r0, _LIT2
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_db8:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00090100
_LIT1: .word 0x00090101
_LIT2: .word 0x00090102
_LIT3: .word 0x00090103
