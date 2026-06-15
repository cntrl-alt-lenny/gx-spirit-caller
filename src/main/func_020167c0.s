; func_020167c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139c4
        .extern func_020190ec
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201969c
        .extern func_0201aabc
        .extern func_0201aaf4
        .extern func_0201abb0
        .extern func_0201abd4
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_020167c0
        .arm
func_020167c0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_2db0
    b .L_2de8
    b .L_2e18
    b .L_2e30
    b .L_2e3c
    b .L_2e48
    b .L_2e60
    b .L_2e90
.L_2db0:
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aabc
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_2de8:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019664
    cmp r0, #0x78
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aaf4
    ldmia sp!, {r3, r4, r5, pc}
.L_2e18:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x5
    ldreq r0, _LIT2
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2e30:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2e3c:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2e48:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_2e60:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x8
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT6
    mov r0, #0x7
    str r1, [r5, #0x8]
    bl func_0201abb0
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_2e90:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_2eb4
    b .L_2f1c
    b .L_2ef0
    b .L_2ebc
.L_2eb4:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_2ebc:
    bl func_02019664
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x7
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_2ef0:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    ldreq r0, _LIT8
    streq r0, [r5, #0x8]
    ldrne r0, _LIT9
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2f1c:
    ldr r0, _LIT10
    str r0, [r5, #0x8]
    bl func_0201b7b4
    ldr r1, [r4, #0x900]
    mov r0, #0x7
    bic r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_0201abd4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x001c0100
_LIT1: .word 0x001c0200
_LIT2: .word 0x001c0300
_LIT3: .word 0x001c0400
_LIT4: .word 0x001c0500
_LIT5: .word 0x001c0600
_LIT6: .word 0x001c0700
_LIT7: .word 0x001c0800
_LIT8: .word 0x001c0801
_LIT9: .word 0x001c0802
_LIT10: .word 0x001c0803
