; func_ov002_021ff5e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bcca0
        .global func_ov002_021ff5e0
        .arm
func_ov002_021ff5e0:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    and r2, r0, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021bcca0
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, pc}
