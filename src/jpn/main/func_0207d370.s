; func_0207d370 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d438
        .extern func_0207d90c
        .extern func_0207d934
        .global func_0207d370
        .arm
func_0207d370:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    sub r4, r1, #0x10
    add r5, r0, #0x24
    add r0, sp, #0x0
    mov r1, r4
    bl func_0207d934
    mov r1, r4
    add r0, r5, #0x8
    bl func_0207d90c
    add r1, sp, #0x0
    mov r0, r5
    bl func_0207d438
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
