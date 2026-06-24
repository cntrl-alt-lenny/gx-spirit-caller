; func_0201abdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_0201abbc
        .global func_0201abdc
        .arm
func_0201abdc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    cmp r4, #0x8
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    bge .L_3c
.L_1c:
    mov r0, r4
    bl func_0201abbc
    cmp r0, #0x0
    movne r0, r4
    ldmneia sp!, {r4, pc}
    add r4, r4, #0x1
    cmp r4, #0x8
    blt .L_1c
.L_3c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
