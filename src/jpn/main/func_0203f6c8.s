; func_0203f6c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203f4f4
        .extern func_0203f540
        .global func_0203f6c8
        .arm
func_0203f6c8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r1
    add r1, sp, #0x0
    bl func_0203f540
    add r0, sp, #0x0
    mov r1, r4
    bl func_0203f4f4
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
