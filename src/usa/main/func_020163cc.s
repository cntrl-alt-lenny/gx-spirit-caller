; func_020163cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013980
        .extern func_02013990
        .extern func_02018a04
        .extern func_02018a30
        .extern func_02019000
        .extern func_020190b8
        .extern func_020195b8
        .extern func_02019630
        .extern func_02019668
        .extern func_0201aa7c
        .extern func_0201aab4
        .extern func_0201ab70
        .extern func_0201ab94
        .extern func_0201b6c8
        .extern func_0201b6f0
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_020163cc
        .arm
func_020163cc:
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
    b .L_44
    b .L_90
    b .L_c8
    b .L_138
.L_44:
    bl func_020190b8
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x2
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
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
.L_90:
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
    mov r0, #0x13
    bl func_02018a04
    ldmia sp!, {r3, r4, r5, pc}
.L_c8:
    bl func_02013980
    cmp r0, #0x2
    mov r0, #0x1
    bne .L_e0
    bl func_0201ab70
    b .L_e4
.L_e0:
    bl func_0201ab94
.L_e4:
    bl func_02019630
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019668
    cmp r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02013980
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r0, #0x1
    str r1, [r5, #0x8]
    bl func_0201ab94
    bl func_0201b774
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_02018a30
    mov r0, #0x8
    bl func_0201b6c8
    ldmia sp!, {r3, r4, r5, pc}
.L_138:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_15c
    b .L_1d8
    b .L_1ac
    b .L_164
.L_15c:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_164:
    bl func_02019630
    cmp r0, #0x6d
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    bl func_02013980
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_1ac:
    ldr r0, [r4, #0x8e0]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020195b8
    cmp r0, #0x0
    ldreq r0, _LIT4
    streq r0, [r5, #0x8]
    ldrne r0, _LIT5
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1d8:
    ldr r0, _LIT6
    str r0, [r5, #0x8]
    bl func_0201b774
    mov r0, #0x8
    bl func_0201b6f0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x001a0100
_LIT1: .word 0x001a0200
_LIT2: .word 0x001a0300
_LIT3: .word 0x001a0400
_LIT4: .word 0x001a0401
_LIT5: .word 0x001a0402
_LIT6: .word 0x001a0403
