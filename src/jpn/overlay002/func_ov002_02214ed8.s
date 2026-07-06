; func_ov002_02214ed8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c1d64
        .extern func_ov002_021d46ac
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .global func_ov002_02214ed8
        .arm
func_ov002_02214ed8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r1, #0x0
    mov r2, r1
    mov r4, r0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_3c0
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r5, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r6, r0, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021c1d64
    cmp r0, #0x0
    bne .L_3c0
    cmp r5, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x1b
    mov r0, r0, lsl #0x10
    mov r1, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021d46ac
    mov r1, #0x0
    ldrh r0, [r4, #0x2]
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x1c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
.L_3c0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
