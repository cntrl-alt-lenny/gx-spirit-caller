; func_ov002_021fa97c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b4040
        .extern func_ov002_021d5a90
        .global func_ov002_021fa97c
        .arm
func_ov002_021fa97c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b4040
    str r0, [r4, #0x14]
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021d5a90
    mov r0, #0x1
    ldmia sp!, {r4, pc}
