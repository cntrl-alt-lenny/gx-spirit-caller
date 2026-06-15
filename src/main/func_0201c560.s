; func_0201c560 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02008d1c
        .extern func_02009758
        .extern func_020097a4
        .global func_0201c560
        .arm
func_0201c560:
    stmdb sp!, {r3, r4, r5, lr}
    mov r0, #0x9
    bl func_020097a4
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r5, #0x0
    mov r4, #0x1
.L_3c0:
    cmp r5, #0x16
    cmpne r5, #0x17
    beq .L_3e0
    mov r0, r4
    mov r1, r5
    bl func_02008d1c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_3e0:
    add r5, r5, #0x1
    cmp r5, #0x20
    blt .L_3c0
    mov r0, #0x9
    bl func_02009758
    ldmia sp!, {r3, r4, r5, pc}
