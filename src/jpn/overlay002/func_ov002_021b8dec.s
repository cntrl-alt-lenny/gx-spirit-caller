; func_ov002_021b8dec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0223dda4
        .global func_ov002_021b8dec
        .arm
func_ov002_021b8dec:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x6]
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    cmp r1, #0x1
    bne .L_4c98
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0x4
    movls r0, #0x1
    ldmlsia sp!, {r3, pc}
.L_4c98:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
