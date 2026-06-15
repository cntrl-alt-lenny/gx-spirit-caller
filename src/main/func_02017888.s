; func_02017888 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139c4
        .extern func_02019034
        .extern func_020190c0
        .extern func_020190ec
        .extern func_020195ec
        .extern func_02019640
        .extern func_02019664
        .extern func_0201aabc
        .extern func_0201aaf4
        .extern func_0201ab5c
        .extern func_0201b7b4
        .extern func_0201b7e0
        .extern func_ov000_021ae4ac
        .global func_02017888
        .arm
func_02017888:
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
    beq .L_628
    cmp r0, #0x2
    beq .L_674
    cmp r0, #0x3
    beq .L_694
    ldmia sp!, {r3, r4, r5, pc}
.L_628:
    bl func_020190c0
    cmp r0, #0x1
    beq .L_64c
    bl func_020190c0
    cmp r0, #0x2
    beq .L_64c
    bl func_020190c0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
.L_64c:
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
.L_674:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    bl func_0201b7b4
    ldmia sp!, {r3, r4, r5, pc}
.L_694:
    ldr r0, [r4, #0x924]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_6bc
    b .L_7b0
    b .L_748
    b .L_710
    b .L_6c4
.L_6bc:
    mov r0, #0x5
    str r0, [r4, #0x924]
.L_6c4:
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02019034
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r0, #0x7b
    str r1, [r5, #0x8]
    ldr r1, [r4, #0x900]
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_0201aabc
    ldmia sp!, {r3, r4, r5, pc}
.L_710:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x3
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019664
    cmp r0, #0x7b
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_748:
    bl func_ov000_021ae4ac
    cmp r0, #0x2
    bne .L_784
    mov r0, #0x23
    str r0, [r4, #0x91c]
    mov r0, #0x3
    str r0, [r4, #0x920]
    mov r0, #0x4
    str r0, [r4, #0x924]
    ldr r1, [r4, #0x8e0]
    mov r0, #0x0
    orr r1, r1, #0x4
    str r1, [r4, #0x8e0]
    bl func_02019640
    ldmia sp!, {r3, r4, r5, pc}
.L_784:
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
.L_7b0:
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    bl func_0201b7b4
    mov r0, #0x7b
    bl func_0201aaf4
    mov r0, #0x2
    bl func_0201ab5c
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00230100
_LIT1: .word 0x00230200
_LIT2: .word 0x00230300
_LIT3: .word 0x00230301
_LIT4: .word 0x00230302
_LIT5: .word 0x00230303
_LIT6: .word 0x00230304
