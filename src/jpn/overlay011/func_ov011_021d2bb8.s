; func_ov011_021d2bb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .global func_ov011_021d2bb8
        .arm
func_ov011_021d2bb8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    str r1, [r4, #0x2c]
    str r2, [r4, #0x30]
    ldr r0, [r4, #0x34]
    str r1, [sp, #0x8]
    bic r0, r0, #0x1
    str r0, [r4, #0x34]
    ldr r0, [r4, #0x20]
    str r2, [sp, #0xc]
    str r1, [sp]
    str r2, [sp, #0x4]
    cmp r0, #0x0
    beq .L_48
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x20]
.L_48:
    ldr r0, [r4, #0x40]
    bic r0, r0, #0x100
    str r0, [r4, #0x40]
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
