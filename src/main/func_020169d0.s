; func_020169d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139b4
        .extern func_020139c4
        .extern func_02019034
        .extern func_020190ec
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201aabc
        .extern func_0201b7b4
        .global func_020169d0
        .arm
func_020169d0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_2fb8
    b .L_2fec
    b .L_301c
    b .L_3028
    b .L_3034
    b .L_30c4
.L_2fb8:
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
    ldrcs r0, _LIT0
    strcs r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2fec:
    bl func_02019664
    cmp r0, #0x6a
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020139b4
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_301c:
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_3028:
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_3034:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_3058
    b .L_30a8
    b .L_307c
    b .L_3060
.L_3058:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_3060:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_307c:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195ec
    cmp r0, #0x0
    ldreq r0, _LIT5
    streq r0, [r5, #0x8]
    ldrne r0, _LIT6
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_30a8:
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_0201b7b4
    ldmia sp!, {r3, r4, r5, pc}
.L_30c4:
    ldr r1, _LIT8
    mov r0, #0x7a
    str r1, [r5, #0x8]
    bl func_0201aabc
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x001d0100
_LIT1: .word 0x001d0200
_LIT2: .word 0x001d0300
_LIT3: .word 0x001d0400
_LIT4: .word 0x001d0500
_LIT5: .word 0x001d0501
_LIT6: .word 0x001d0502
_LIT7: .word 0x001d0503
_LIT8: .word 0x001d0600
