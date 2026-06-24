; func_0206f5b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206f614
        .extern func_0206faf0
        .extern func_02070e3c
        .extern func_02070e5c
        .extern func_02070e90
        .extern func_02070f00
        .global func_0206f5b0
        .arm
func_0206f5b0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl func_02070e5c
    bl func_02070f00
    mov r0, #0x44
    mov r1, #0x43
    mvn r2, #0x0
    bl func_02070e90
    mov r4, #0x0
.L_1bc:
    bl func_0206faf0
    mov r1, r4
    bl func_0206f614
    mov r5, r0
    cmp r5, #0x1
    beq .L_1e0
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_1bc
.L_1e0:
    bl func_02070e3c
    cmp r5, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
