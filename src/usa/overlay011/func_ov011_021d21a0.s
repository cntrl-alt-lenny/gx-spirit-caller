; func_ov011_021d21a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov011_021d21a0
        .arm
func_ov011_021d21a0:
    stmdb sp!, {r0, r1, r2, r3}
    stmfd sp!, {r3}
    sub sp, sp, #0x4
    ldr r2, [sp, #0xc]
    ldr r1, [sp, #0x10]
    mov r2, r2, asr #0x10
    strh r2, [sp]
    mov r1, r1, asr #0x10
    strh r1, [sp, #0x2]
    ldrh r2, [sp]
    ldrh r1, [sp, #0x2]
    strh r2, [r0]
    strh r1, [r0, #0x2]
    add sp, sp, #0x4
    ldmfd sp!, {r3}
    add sp, sp, #0x10
    bx lr
