; func_ov002_021f95f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021f9434
        .global func_ov002_021f95f8
        .arm
func_ov002_021f95f8:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r2, r2, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x2
    cmpne r2, #0x5
    bne .L_90c
    bl func_ov002_021f9434
    ldmia sp!, {r3, pc}
.L_90c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
