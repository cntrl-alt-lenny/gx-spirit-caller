; func_0201b5d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0201b504
        .global func_0201b5d0
        .arm
func_0201b5d0:
    stmdb sp!, {r4, lr}
    bl GetSystemWork
    mov r4, #0x0
.L_82c:
    add r0, r4, #0x1
    bl func_0201b504
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_82c
    mov r4, #0x0
.L_844:
    add r0, r4, #0x11
    bl func_0201b504
    add r4, r4, #0x1
    cmp r4, #0x10
    blt .L_844
    ldmia sp!, {r4, pc}
