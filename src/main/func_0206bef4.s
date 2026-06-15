; func_0206bef4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206bf60
        .extern func_0209256c
        .global func_0206bef4
        .arm
func_0206bef4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r1
    beq .L_1c
    ldrsb r1, [r5, #0xd]
    ands r1, r1, #0x1
    beq .L_24
.L_1c:
    mov r2, #0x1
    b .L_28
.L_24:
    mov r2, #0x0
.L_28:
    mov r1, r5
    bl func_0209256c
    movs r4, r0
    bne .L_40
    mov r0, r5
    bl func_0206bf60
.L_40:
    cmp r4, #0x0
    movne r0, #0x0
    mvneq r0, #0x29
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
