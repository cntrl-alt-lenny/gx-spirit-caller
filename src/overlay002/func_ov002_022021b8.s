; func_ov002_022021b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b34f4
        .extern func_ov002_021b3618
        .extern func_ov002_02203930
        .global func_ov002_022021b8
        .arm
func_ov002_022021b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r3, r2, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x2
    bne .L_7c
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3618
    mov r1, r0, lsl #0x10
    mov r2, r1, lsr #0x10
    ldr r1, _LIT0
    mov r2, r2, asr #0x8
    cmp r0, r1
    and r0, r0, #0xff
    and r1, r2, #0xff
    beq .L_74
    ldrh r2, [r4, #0x2]
    mov r3, r2, lsl #0x1a
    mov r4, r2, lsl #0x1f
    mov r2, r4, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_021b34f4
    cmp r0, #0xa
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_74:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_7c:
    bl func_ov002_02203930
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000ffff
