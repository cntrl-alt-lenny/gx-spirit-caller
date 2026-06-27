; func_ov002_021f80dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b9af4
        .extern func_ov002_021debec
        .global func_ov002_021f80dc
        .arm
func_ov002_021f80dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9af4
    strh r0, [r4, #0xa]
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r3, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021debec
    mov r0, #0x1
    ldmia sp!, {r4, pc}
