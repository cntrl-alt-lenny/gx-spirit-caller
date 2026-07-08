; func_ov002_021df3e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd3d8
        .extern func_0202e2a4
        .extern func_ov002_021b9fd0
        .extern func_ov002_021c1d64
        .extern func_ov002_021d46ac
        .extern func_ov002_021dcb58
        .global func_ov002_021df3e8
        .arm
func_ov002_021df3e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    cmp r1, #0x0
    ldreq r0, _LIT0
    ldr fp, _LIT1
    ldreq r8, [r0]
    ldrne r0, _LIT0
    mov r6, #0x0
    ldrne r8, [r0, #0x4]
    cmp r1, #0x0
    ldreq r0, _LIT0
    ldreq r9, [r0, #0x1c]
    ldrne r0, _LIT0
    ldrne r9, [r0, #0x20]
    mov r0, #0x14
    mul r5, r1, r0
    add r0, fp, r5
    bl func_ov002_021b9fd0
    ldr r2, [fp, r5]
    mov r4, r0
    mov r0, r2, lsl #0x2
    mov r1, r0, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r7, r1, r2, lsr #0x1f
    mov r0, sl
    mov r1, r8
    mov r2, r9
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r4, #0x0
    beq .L_788
    mov r0, r4
    bl func_0202e2a4
    cmp r0, #0x0
    beq .L_718
    cmp r8, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    and r0, r9, #0xff
    orr r2, r1, #0x31
    orr r1, r0, #0xff00
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r7, lsl #0x10
    mov r3, r2, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x10
    bl func_ov002_021d46ac
    b .L_76c
.L_718:
    ldrh r0, [sl, #0x2]
    ldr r1, [fp, r5]
    and r7, r8, #0x1
    mov r0, r0, lsl #0x1f
    mov r1, r1, lsl #0x12
    mov r0, r0, lsr #0x1f
    cmp r0, r8
    mov r1, r1, lsr #0x1f
    mov r4, r9, lsl #0x1b
    and r1, r1, #0x1
    orrne r6, r6, #0x1
    mov r3, r6, lsl #0x10
    mov r0, #0x40
    orr r2, r1, #0x5a
    orr r4, r7, r4, lsr #0x1a
    rsb r1, r0, #0x10000
    orr r1, r4, r1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
.L_76c:
    mov r1, r8
    mov r2, r9
    mov r3, r6
    add r0, fp, r5
    bl func_ov002_021dcb58
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_788:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cd3d8
