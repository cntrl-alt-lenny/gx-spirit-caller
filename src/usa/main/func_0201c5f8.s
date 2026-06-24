; func_0201c5f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0200a1e8
        .extern func_02019584
        .global func_0201c5f8
        .arm
func_0201c5f8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GetSystemWork
    mov r0, r6
    mov r1, #0x2
    bl func_02019584
    mov r5, r0
    mov r0, r6
    mov r1, #0x0
    bl func_02019584
    mov r4, r0
    mov r0, r6
    mov r1, #0x1
    bl func_02019584
    add r0, r4, r0
    add r0, r5, r0
    cmp r0, #0x1e
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r6
    bl func_0200a1e8
    ldmia sp!, {r4, r5, r6, pc}
