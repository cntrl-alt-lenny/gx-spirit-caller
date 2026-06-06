; func_ov002_0220d7c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ff46c
        .global func_ov002_0220d7c0
        .arm
func_ov002_0220d7c0:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r3, r2, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x8
    bne .L_3c
    ldr r3, [r0, #0x14]
    mov r2, r2, lsl #0x1f
    mov r3, r3, lsl #0x16
    mov r3, r3, lsr #0x1f
    cmp r3, r2, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_021ff46c
    ldmia sp!, {r3, pc}
.L_3c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
