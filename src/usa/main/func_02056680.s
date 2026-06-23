; func_02056680 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045364
        .extern func_02054610
        .extern func_02058654
        .global func_02056680
        .arm
func_02056680:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r4, [r5]
    mov r1, #0x1
    bl func_02058654
    ldr r0, [r4, #0x460]
    bl func_02045364
    mov r0, #0x0
    str r0, [r4, #0x460]
    ldr r0, [r4, #0x428]
    bl func_02054610
    mov r0, r4
    bl func_02045364
    mov r0, #0x0
    str r0, [r5]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
