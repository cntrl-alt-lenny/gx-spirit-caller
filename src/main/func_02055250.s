; func_02055250 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206e9b0
        .global func_02055250
        .arm
func_02055250:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r1
    mov r1, #0x3
    mov r2, #0x0
    mov r5, r0
    bl func_0206e9b0
    cmp r4, #0x0
    bicne r2, r0, #0x4
    orreq r2, r0, #0x4
    mov r0, r5
    mov r1, #0x4
    bl func_0206e9b0
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
