; func_ov002_022bcf70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccef8
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_020a9698
        .extern func_ov002_022bda78
        .global func_ov002_022bcf70
        .arm
func_ov002_022bcf70:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_16c4
    b .L_1594
    b .L_15b0
    b .L_1608
    b .L_1684
    b .L_16a4
.L_1594:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_16c4
.L_15b0:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_16c4
    mov r0, #0x0
    str r0, [sp]
    add r0, r4, #0xc00
    ldrh r1, [r0, #0x68]
    ldr r0, _LIT1
    add r3, r4, #0xc80
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1f
    mov r1, #0x38
    bl func_ov002_022bda78
    add r0, r4, #0x124
    ldr r1, _LIT2
    add r0, r0, #0x800
    bl func_020a9698
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_16c4
.L_1608:
    ldr r0, [r4, #0xc64]
    ldr r5, _LIT1
    cmp r0, #0xa
    cmpne r0, #0x19
    cmpne r0, #0x28
    bne .L_1634
    mov r0, #0x33
    sub r1, r0, #0x34
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_1634:
    mov r1, #0x0
.L_1638:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_1654
    ldr r0, [r5, #0x4]
    cmp r0, #0x38
    moveq r0, #0x1
    beq .L_1668
.L_1654:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r5, r5, #0x8
    blt .L_1638
    mov r0, #0x0
.L_1668:
    cmp r0, #0x0
    bne .L_16c4
    mov r0, #0x3
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_16c4
.L_1684:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xf
    blt .L_16c4
    mov r0, #0x4
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_16c4
.L_16a4:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_16c4:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d1a18
_LIT1: .word data_ov002_022d281c
_LIT2: .word data_ov002_022ccef8
