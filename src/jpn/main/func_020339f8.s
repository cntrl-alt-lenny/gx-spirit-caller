; func_020339f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020338a8
        .extern func_02092fc8
        .global func_020339f8
        .arm
func_020339f8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl func_020338a8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    add r4, r7, #0x30c
    bl func_02092fc8
    str r0, [r7, #0xf0c]
    str r1, [r4, #0xc04]
    str r6, [r4, #0xc08]
    str r5, [r4, #0xc0c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
