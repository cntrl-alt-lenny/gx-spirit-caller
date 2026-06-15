; func_02019940 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b5e20
        .extern data_02102c64
        .extern func_02019210
        .global func_02019940
        .arm
func_02019940:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    bl GetSystemWork
    ldr r4, _LIT0
    mov r5, #0x0
.L_6c:
    cmp r7, #0x0
    beq .L_88
    cmp r7, #0x1
    beq .L_9c
    cmp r7, #0x2
    beq .L_b4
    b .L_c8
.L_88:
    mov r0, r8
    bl func_02019210
    mov r1, #0x3c
    mla r6, r0, r1, r4
    b .L_c8
.L_9c:
    mov r0, r8
    bl func_02019210
    mov r1, #0x3c
    mla r1, r0, r1, r4
    add r6, r1, #0x14
    b .L_c8
.L_b4:
    mov r0, r8
    bl func_02019210
    mov r1, #0x3c
    mla r1, r0, r1, r4
    add r6, r1, #0x28
.L_c8:
    mov r0, r5, lsl #0x1
    ldrsh r1, [r6, r0]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_f0
.L_dc:
    add r5, r5, #0x1
    mov r1, r5, lsl #0x1
    ldrsh r1, [r6, r1]
    cmp r1, r0
    bne .L_dc
.L_f0:
    cmp r5, #0x0
    addeq r7, r7, #0x1
    cmp r5, #0x0
    beq .L_6c
    cmp r5, #0x1
    ldreqsh r0, [r6]
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT1
    ldr r2, [r0]
    ldmib r0, {r1, r3}
    umull r7, r4, r3, r2
    mla r4, r3, r1, r4
    ldr r1, [r0, #0xc]
    ldr r3, [r0, #0x10]
    mla r4, r1, r2, r4
    ldr r1, [r0, #0x14]
    adds r2, r3, r7
    adc r3, r1, r4
    stmia r0, {r2, r3}
    cmp r5, #0x0
    beq .L_158
    mov r2, #0x0
    umull r1, r0, r3, r5
    mla r0, r3, r2, r0
    mla r0, r2, r5, r0
    mov r3, r0
.L_158:
    mov r0, r3, lsl #0x1
    ldrsh r0, [r6, r0]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020b5e20
_LIT1: .word data_02102c64
