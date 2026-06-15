; func_02015494 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .extern func_0201b708
        .extern func_0201b7b4
        .extern func_0201b7e0
        .global func_02015494
        .arm
func_02015494:
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
    b .L_1a74
    b .L_1ab8
    b .L_1af0
    b .L_1b90
.L_1a74:
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_1ab8:
    bl func_020139b4
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, #0x4
    str r1, [r5, #0x8]
    bl func_0201b708
    mov r0, #0x13
    bl func_02018a38
    ldmia sp!, {r3, r4, r5, pc}
.L_1af0:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_1b14
    b .L_1b74
    b .L_1b48
    b .L_1b1c
.L_1b14:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_1b1c:
    bl func_02019664
    cmp r0, #0x69
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    bl func_02018a64
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1b48:
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
.L_1b74:
    ldr r0, _LIT5
    str r0, [r5, #0x8]
    bl func_0201b7b4
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_1b90:
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldreq r0, _LIT6
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00110100
_LIT1: .word 0x00110200
_LIT2: .word 0x00110300
_LIT3: .word 0x00110301
_LIT4: .word 0x00110302
_LIT5: .word 0x00110303
_LIT6: .word 0x00110400
