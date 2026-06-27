; func_ov002_022abe4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021afaf4
        .global func_ov002_022abe4c
        .arm
func_ov002_022abe4c:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x4]
    rsb r2, r2, #0x0
    cmp r2, #0x4b
    cmpne r2, #0x4c
    cmpne r2, #0x4d
    bne .L_bcc
    ldr r0, [r0, #0x70]
    ldr r0, [r0, r1, lsl #0x2]
    ldmia sp!, {r3, pc}
.L_bcc:
    ldr r0, [r0, #0x68]
    ldr r0, [r0, r1, lsl #0x2]
    bl func_ov002_021afaf4
    ldmia sp!, {r3, pc}
