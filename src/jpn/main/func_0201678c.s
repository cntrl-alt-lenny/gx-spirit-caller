; func_0201678c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013990
        .extern func_020190b8
        .extern func_020195b8
        .extern func_02019630
        .extern func_02019668
        .extern func_0201aa7c
        .extern func_0201aab4
        .extern func_0201ab70
        .extern func_0201ab94
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_0201678c
        .arm
func_0201678c:
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
    b .L_54
    b .L_8c
    b .L_bc
    b .L_d4
    b .L_e0
    b .L_ec
    b .L_104
    b .L_134
.L_54:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02013990
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aa7c
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_8c:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019630
    cmp r0, #0x78
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, #0x78
    str r1, [r5, #0x8]
    bl func_0201aab4
    ldmia sp!, {r3, r4, r5, pc}
.L_bc:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x5
    ldreq r0, _LIT2
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_d4:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_e0:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_ec:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_104:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x8
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT6
    mov r0, #0x7
    str r1, [r5, #0x8]
    bl func_0201ab70
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_134:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_158
    b .L_1c0
    b .L_194
    b .L_160
.L_158:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_160:
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x7
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_194:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    ldreq r0, _LIT8
    streq r0, [r5, #0x8]
    ldrne r0, _LIT9
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1c0:
    ldr r0, _LIT10
    str r0, [r5, #0x8]
    bl func_0201b774
    ldr r1, [r4, #0x900]
    mov r0, #0x7
    bic r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_0201ab94
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
