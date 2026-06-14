; func_ov011_021d2330 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov011_021d22d4
        .global func_ov011_021d2330
        .arm
func_ov011_021d2330:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    ldrsh r3, [sp, #0x18]
    ldrsh r2, [sp, #0x1a]
    ldrsh r1, [sp, #0x1c]
    mov lr, r3, lsl #0xc
    mov ip, r2, lsl #0xc
    mov r3, r1, lsl #0xc
    ldrsh r0, [sp, #0x1e]
    add r2, sp, #0x0
    str lr, [sp, #0x8]
    mov r1, r0, lsl #0xc
    add r0, sp, #0x8
    str ip, [sp, #0xc]
    str r1, [sp, #0x4]
    str r3, [sp]
    ldmia r0, {r0, r1}
    ldmia r2, {r2, r3}
    bl func_ov011_021d22d4
    add sp, sp, #0x10
    ldmia sp!, {r3, lr}
    add sp, sp, #0x10
    bx lr
