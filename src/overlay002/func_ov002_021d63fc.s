; func_ov002_021d63fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d6434
        .global func_ov002_021d63fc
        .arm
func_ov002_021d63fc:
    stmdb sp!, {r3, lr}
    mov ip, r0
    ldrh r0, [ip, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    str r0, [sp]
    mov r0, r1
    mov r1, r2
    mov r2, r3
    ldrh r3, [ip]
    bl func_ov002_021d6434
    ldmia sp!, {r3, pc}
