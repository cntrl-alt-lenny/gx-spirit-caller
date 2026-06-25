; func_0201515c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02019000
        .extern func_020195b8
        .extern func_02019630
        .extern func_02019668
        .extern func_0201ab70
        .extern func_0201ab94
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_0201515c
        .arm
func_0201515c:
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
    beq .L_58c
    cmp r0, #0x2
    beq .L_664
    ldmia sp!, {r3, r4, r5, pc}
.L_58c:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_5b0
    b .L_654
    b .L_628
    b .L_5cc
.L_5b0:
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x3
    cmp r0, r1
    bcc .L_5cc
    mov r0, #0x2
    bl func_0201ab70
.L_5cc:
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x2
    bl func_0201ab94
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    bne .L_614
    mov r0, #0x1
    str r0, [r4, #0x920]
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_614:
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_628:
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
.L_654:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    bl func_0201b774
    ldmia sp!, {r3, r4, r5, pc}
.L_664:
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x3
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT4
    mov r0, #0x1
    str r1, [r5, #0x8]
    bl func_0201ab70
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000f0100
_LIT1: .word 0x000f0101
_LIT2: .word 0x000f0102
_LIT3: .word 0x000f0103
_LIT4: .word 0x000f0200
