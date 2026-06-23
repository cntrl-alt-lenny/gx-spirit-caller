; func_0206bf20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206bf68
        .global func_0206bf20
        .arm
func_0206bf20:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r6, r0
    mov r0, r4
    mov r5, r1
    bl func_0206bf68
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    str r6, [r0]
    str r5, [r0, #0x4]
    mov r1, #0x0
    str r1, [r0, #0x8]
    ldrsb r1, [r5, #0x73]
    strb r1, [r0, #0xc]
    strb r4, [r0, #0xd]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
