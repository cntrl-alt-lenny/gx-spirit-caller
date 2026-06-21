; func_ov002_02208ad4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021ca698
        .global func_ov002_02208ad4
        .arm
func_ov002_02208ad4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0xf
    bne .L_88
    ldr r2, [r4, #0x14]
    mov r1, r0, lsl #0x1f
    mov r0, r2, lsl #0xa
    mov r0, r0, lsr #0x1f
    cmp r0, r1, lsr #0x1f
    mov r0, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT0
    mov r2, r2, lsl #0x10
    cmp r1, r2, lsr #0x10
    movhi r0, #0x0
    ldmhiia sp!, {r4, pc}
    mov r1, #0x0
    bl func_ov002_021ca698
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca698
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_88:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000bb8
