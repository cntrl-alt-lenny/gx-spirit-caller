; func_ov002_021e1780 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_0202e274
        .extern func_ov002_021ca4dc
        .extern func_ov002_021d46ac
        .extern func_ov002_021e1324
        .extern func_ov002_02244efc
        .global func_ov002_021e1780
        .arm
func_ov002_021e1780:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r1
    ldr r1, _LIT0
    mov r3, r4, lsl #0x2
    ldrh r1, [r1, r3]
    mov r5, r0
    mov r0, r4
    mov r1, r1, lsl #0x13
    mov r7, r2
    mov r6, r1, lsr #0x13
    bl func_ov002_021ca4dc
    cmp r0, #0x0
    bne .L_4f4
    mov r0, r6
    bl func_0202e274
    cmp r0, #0x0
    movne r1, #0xc
    moveq r1, #0xd
    cmp r7, #0x0
    movne r2, #0x1
    moveq r2, #0x0
    cmp r5, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x33
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r3, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    mov r0, #0x24
    mov r1, #0x0
    bl func_ov002_02244efc
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_4f4:
    mov r0, r5
    mov r1, r4
    mov r2, r7
    bl func_ov002_021e1324
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d0170
