; func_02014c08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013980
        .extern func_02018a04
        .extern func_02018a30
        .extern func_02019000
        .extern func_0201908c
        .extern func_02019198
        .extern func_020195b8
        .extern func_02019630
        .extern func_0201b6c8
        .extern func_0201b6f0
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_02014c08
        .arm
func_02014c08:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_48
    b .L_b8
    b .L_e4
    b .L_13c
    b .L_158
.L_48:
    bl func_02019198
    cmp r0, #0x9
    ldmltia sp!, {r3, r4, r5, pc}
    bl func_02013980
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201908c
    cmp r0, #0x6
    beq .L_a0
    bl func_0201908c
    cmp r0, #0x0
    beq .L_a0
    bl func_0201908c
    cmp r0, #0x1
    beq .L_a0
    bl func_0201908c
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
.L_a0:
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_b8:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x5
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    str r0, [r5, #0x8]
    bl func_0201b774
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_e4:
    mov r0, r5
    bl func_0201b7a0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_02013980
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r0, #0x13
    str r1, [r5, #0x8]
    ldr r1, [r4, #0x900]
    orr r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_02018a04
    mov r0, #0xc
    bl func_0201b6c8
    ldmia sp!, {r3, r4, r5, pc}
.L_13c:
    bl func_02019630
    cmp r0, #0x71
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    bl func_02018a30
    ldmia sp!, {r3, r4, r5, pc}
.L_158:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_17c
    b .L_1ec
    b .L_1a0
    b .L_184
.L_17c:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_184:
    ldr r0, _LIT4
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1a0:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    ldreq r0, _LIT5
    streq r0, [r5, #0x8]
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, #0x5
    str r0, [r4, #0x920]
    str r0, [r4, #0x924]
    ldmia sp!, {r3, r4, r5, pc}
.L_1ec:
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    bl func_0201b774
    ldr r1, [r4, #0x900]
    mov r0, #0xc
    bic r1, r1, #0x1000000
    str r1, [r4, #0x900]
    bl func_0201b6f0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000d0100
_LIT1: .word 0x000d0200
_LIT2: .word 0x000d0300
_LIT3: .word 0x000d0400
_LIT4: .word 0x000d0500
_LIT5: .word 0x000d0501
_LIT6: .word 0x000d0502
_LIT7: .word 0x000d0503
