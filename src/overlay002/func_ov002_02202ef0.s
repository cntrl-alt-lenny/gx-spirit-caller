; func_ov002_02202ef0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf8f4
        .extern func_ov002_021b947c
        .global func_ov002_02202ef0
        .arm
func_ov002_02202ef0:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1e
    cmp r1, #0x2
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r0, [r0, #0x14]
    mov r0, r0, lsr #0x3
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r0, lsr #0x10
    mov r2, r1, asr #0x8
    mov r1, r3, lsl #0x10
    and r2, r2, #0xff
    cmp r2, #0xf
    and r2, r0, #0xff
    mov r3, r1, lsr #0x10
    bne .L_78
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r2, #0x1
    mla r0, r2, r0, r1
    mov r1, r3, lsl #0x1
    ldrh r0, [r1, r0]
    and r0, r0, #0xff
    cmp r0, #0x40
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
.L_78:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf8f4
