; func_020181d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139b4
        .extern func_02018a38
        .extern func_02018a64
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201969c
        .extern func_0201abb0
        .extern func_0201abd4
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_020181d0
        .arm
func_020181d0:
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
    beq .L_f70
    cmp r0, #0x2
    beq .L_fa4
    cmp r0, #0x3
    beq .L_fdc
    ldmia sp!, {r3, r4, r5, pc}
.L_f70:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020139b4
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, [r4, #0x900]
    ldr r0, _LIT0
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_fa4:
    bl func_0201969c
    cmp r0, #0x4a
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, #0x6
    str r1, [r5, #0x8]
    bl func_0201abb0
    bl GetSystemWork
    ldr r1, [r0, #0x8f8]
    orr r1, r1, #0x1000
    str r1, [r0, #0x8f8]
    mov r0, #0x14
    bl func_02018a38
    ldmia sp!, {r3, r4, r5, pc}
.L_fdc:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_1000
    b .L_106c
    b .L_1040
    b .L_1008
.L_1000:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_1008:
    bl func_02019664
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x6
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    bl func_02018a64
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1040:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    ldreq r0, _LIT3
    streq r0, [r5, #0x8]
    ldrne r0, _LIT4
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_106c:
    ldr r1, _LIT5
    mov r0, #0x6
    str r1, [r5, #0x8]
    bl func_0201abd4
    bl func_0201b7b4
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl GetSystemWork
    ldr r1, [r0, #0x8f8]
    bic r1, r1, #0x1000
    str r1, [r0, #0x8f8]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x002b0100
_LIT1: .word 0x002b0200
_LIT2: .word 0x002b0300
_LIT3: .word 0x002b0301
_LIT4: .word 0x002b0302
_LIT5: .word 0x002b0303
