; func_0201a5c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020097d4
        .global func_0201a5c0
        .arm
func_0201a5c0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    mov r5, r6
    mov r4, #0x1
.L_10:
    add r0, r5, #0x1
    bl func_020097d4
    cmp r0, #0x50
    orrge r6, r6, r4, lsl r5
    add r5, r5, #0x1
    cmp r5, #0x1a
    blt .L_10
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
