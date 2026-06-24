; func_0202ba40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b998
        .extern func_0202b9e4
        .extern func_0202bab8
        .extern func_0202bacc
        .extern func_0202bb10
        .global func_0202ba40
        .arm
func_0202ba40:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    bl func_0202b998
    add r1, r4, r0
    cmp r1, #0x9
    movgt r1, #0x9
    mov r0, r5
    bl func_0202b9e4
    mov r0, r5
    bl func_0202bacc
    cmp r0, #0x0
    bne .L_9c
    mov r0, r5
    mov r1, #0x1
    bl func_0202bb10
.L_9c:
    mov r0, r5
    mov r1, #0x1
    bl func_0202bab8
    ldmia sp!, {r3, r4, r5, pc}
