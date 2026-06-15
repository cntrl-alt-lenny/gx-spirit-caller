; func_02013c64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_020139b4
        .extern func_020139c4
        .extern func_020190ec
        .extern func_020190fc
        .extern func_020191cc
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201969c
        .extern func_0201b7e0
        .global func_02013c64
        .arm
func_02013c64:
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
    b .L_24c
    b .L_2bc
    b .L_2dc
    b .L_374
    b .L_3a4
    b .L_3bc
.L_24c:
    ldr r0, [r4, #0x924]
    cmp r0, #0x1
    beq .L_26c
    cmp r0, #0x2
    beq .L_2a4
    cmp r0, #0x3
    beq .L_274
    ldmia sp!, {r3, r4, r5, pc}
.L_26c:
    mov r0, #0x3
    str r0, [r4, #0x924]
.L_274:
    bl func_020190ec
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x0
    ldreq r0, _LIT0
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2a4:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x5
    ldreq r0, _LIT1
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2bc:
    bl func_02019664
    cmp r0, #0x6a
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x4
    ldreq r0, _LIT2
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_2dc:
    ldr r0, [r4, #0x924]
    cmp r0, #0x1
    beq .L_2fc
    cmp r0, #0x2
    beq .L_348
    cmp r0, #0x3
    beq .L_304
    ldmia sp!, {r3, r4, r5, pc}
.L_2fc:
    mov r0, #0x3
    str r0, [r4, #0x924]
.L_304:
    bl func_020191cc
    cmp r0, #0x4
    ldmltia sp!, {r3, r4, r5, pc}
    bl func_020139b4
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x8
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x8e0]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x8e0]
    ldmia sp!, {r3, r4, r5, pc}
.L_348:
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
.L_374:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020139c4
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_020190fc
    cmp r0, #0x0
    movne r0, #0x30400
    strne r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_3a4:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x5
    ldreq r0, _LIT6
    streq r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_3bc:
    ldr r0, _LIT7
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00030100
_LIT1: .word 0x00030101
_LIT2: .word 0x00030200
_LIT3: .word 0x00030300
_LIT4: .word 0x00030301
_LIT5: .word 0x00030302
_LIT6: .word 0x00030500
_LIT7: .word 0x00030600
