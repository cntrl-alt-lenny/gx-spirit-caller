; func_020165d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02013990
        .extern func_02019000
        .extern func_020190b8
        .extern func_020195b8
        .extern func_02019630
        .extern func_0201aa7c
        .extern func_0201aab4
        .extern func_0201b6c8
        .extern func_0201b6f0
        .extern func_0201b774
        .extern func_0201b7a0
        .global func_020165d8
        .arm
func_020165d8:
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
    b .L_250
    b .L_29c
    b .L_2d4
    b .L_2fc
.L_250:
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
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
.L_29c:
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
    mov r0, #0xa
    bl func_0201b6c8
    ldmia sp!, {r3, r4, r5, pc}
.L_2d4:
    bl func_02019630
    cmp r0, #0x6f
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT2
    str r0, [r5, #0x8]
    bl func_0201b774
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_2fc:
    ldr r0, [r4, #0x924]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, r4, r5, pc}
    ldmia sp!, {r3, r4, r5, pc}
    b .L_320
    b .L_390
    b .L_364
    b .L_328
.L_320:
    mov r0, #0x4
    str r0, [r4, #0x924]
.L_328:
    bl func_02019630
    cmp r0, #0x6f
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02019000
    ldr r1, [r4, #0x8dc]
    add r1, r1, #0x1
    cmp r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_364:
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
.L_390:
    ldr r1, _LIT6
    mov r0, #0xa
    str r1, [r5, #0x8]
    bl func_0201b6f0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x001b0100
_LIT1: .word 0x001b0200
_LIT2: .word 0x001b0300
_LIT3: .word 0x001b0400
_LIT4: .word 0x001b0401
_LIT5: .word 0x001b0402
_LIT6: .word 0x001b0403
