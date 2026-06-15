; func_02016400 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139b4
        .extern func_020139c4
        .extern func_02018a38
        .extern func_02018a64
        .extern func_02019034
        .extern func_020190ec
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201969c
        .extern func_0201aabc
        .extern func_0201aaf4
        .extern func_0201abb0
        .extern func_0201abd4
        .extern func_0201b708
        .extern func_0201b730
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_02016400
        .arm
func_02016400:
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
    b .L_29e0
    b .L_2a2c
    b .L_2a64
    b .L_2ad4
.L_29e0:
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x2
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
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
.L_2a2c:
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
    mov r0, #0x13
    bl func_02018a38
    ldmia sp!, {r3, r4, r5, pc}
.L_2a64:
    bl func_020139b4
    cmp r0, #0x2
    mov r0, #0x1
    bne .L_2a7c
    bl func_0201abb0
    b .L_2a80
.L_2a7c:
    bl func_0201abd4
.L_2a80:
    bl func_02019664
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020139b4
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r0, #0x1
    str r1, [r5, #0x8]
    bl func_0201abd4
    bl func_0201b7b4
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_02018a64
    mov r0, #0x8
    bl func_0201b708
    ldmia sp!, {r3, r4, r5, pc}
.L_2ad4:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_2af8
    b .L_2b74
    b .L_2b48
    b .L_2b00
.L_2af8:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_2b00:
    bl func_02019664
    cmp r0, #0x6d
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_020139b4
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_2b48:
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
.L_2b74:
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    bl func_0201b7b4
    mov r0, #0x8
    bl func_0201b730
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x001a0100
_LIT1: .word 0x001a0200
_LIT2: .word 0x001a0300
_LIT3: .word 0x001a0400
_LIT4: .word 0x001a0401
_LIT5: .word 0x001a0402
_LIT6: .word 0x001a0403
