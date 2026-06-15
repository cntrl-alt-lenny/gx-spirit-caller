; func_0203f718 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203f544
        .extern func_0203f590
        .global func_0203f718
        .arm
func_0203f718:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r1
    add r1, sp, #0x0
    bl func_0203f590
    add r0, sp, #0x0
    mov r1, r4
    bl func_0203f544
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
