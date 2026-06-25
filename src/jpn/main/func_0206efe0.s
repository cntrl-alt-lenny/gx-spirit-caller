; func_0206efe0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206f130
        .extern func_02070e3c
        .extern func_02070e5c
        .extern func_02070e90
        .extern func_02070f00
        .global func_0206efe0
        .arm
func_0206efe0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    movs r5, r1
    mov r6, r0
    mov r4, r2
    addeq sp, sp, #0x8
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, lr}
    bxeq lr
    bl func_02070e5c
    bl func_02070f00
    mov r2, r5
    mov r0, #0x0
    mov r1, #0x35
    bl func_02070e90
    mov r0, r6
    mov r2, r4
    mov r3, #0x0
    str r3, [sp]
    mov r1, #0x1
    bl func_0206f130
    mov r4, r0
    bl func_02070e3c
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
