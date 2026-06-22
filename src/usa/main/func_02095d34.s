; func_02095d34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02092800
        .extern func_020951dc
        .extern func_020951f0
        .global func_02095d34
        .arm
func_02095d34:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_020951f0
    add r0, r6, #0x3c
    add r2, r6, r5, lsl #0x2
    add r0, r0, r5, lsl #0x2
    mov r1, #0x4
    str r4, [r2, #0x3c]
    bl func_02092800
    bl func_020951dc
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
