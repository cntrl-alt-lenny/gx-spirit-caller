; func_0202ba94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b9ec
        .extern func_0202ba38
        .extern func_0202bb0c
        .extern func_0202bb20
        .extern func_0202bb64
        .global func_0202ba94
        .arm
func_0202ba94:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    bl func_0202b9ec
    add r1, r4, r0
    cmp r1, #0x9
    movgt r1, #0x9
    mov r0, r5
    bl func_0202ba38
    mov r0, r5
    bl func_0202bb20
    cmp r0, #0x0
    bne .L_124
    mov r0, r5
    mov r1, #0x1
    bl func_0202bb64
.L_124:
    mov r0, r5
    mov r1, #0x1
    bl func_0202bb0c
    ldmia sp!, {r3, r4, r5, pc}
