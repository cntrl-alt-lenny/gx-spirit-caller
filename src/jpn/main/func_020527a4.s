; func_020527a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020522c0
        .extern func_020522f8
        .global func_020527a4
        .arm
func_020527a4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl func_020522f8
    mov r4, r0
    mov r0, r7
    bl func_020522c0
    cmp r0, #0x2
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    str r6, [r4, #0x4]
    str r5, [r4, #0x8]
    mov r0, #0x1
    strb r0, [r4, #0x1d]
    mov r1, #0x0
    str r1, [r4, #0x10]
    str r1, [r4, #0x18]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
