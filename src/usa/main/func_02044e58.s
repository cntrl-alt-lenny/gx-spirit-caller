; func_02044e58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020444d8
        .extern func_02044e9c
        .global func_02044e58
        .arm
func_02044e58:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    add r0, sp, #0x0
    bl func_02044e9c
    cmp r0, #0x0
    addeq sp, sp, #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, sp, #0x0
    mov r1, r4
    bl func_020444d8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
