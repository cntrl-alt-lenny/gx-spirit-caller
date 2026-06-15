; func_0206f624 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206f688
        .extern func_0206fb64
        .extern func_02070f24
        .extern func_02070f44
        .extern func_02070f78
        .extern func_02070fe8
        .global func_0206f624
        .arm
func_0206f624:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_02070f44
    bl func_02070fe8
    mov r0, #0x44
    mov r1, #0x43
    mvn r2, #0x0
    bl func_02070f78
    mov r4, #0x0
.L_588:
    bl func_0206fb64
    mov r1, r4
    bl func_0206f688
    mov r5, r0
    cmp r5, #0x1
    beq .L_5ac
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_588
.L_5ac:
    bl func_02070f24
    cmp r5, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
