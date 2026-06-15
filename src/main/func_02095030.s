; func_02095030 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094c94
        .extern func_02095bf8
        .global func_02095030
        .arm
func_02095030:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r7, r2
    mov r9, r0
    mov r8, r1
    mov r6, r3
    mov r4, r7
    mov r5, #0x0
    b .L_88
.L_70:
    ands r0, r4, #0x1
    beq .L_80
    mov r0, r5
    bl func_02095bf8
.L_80:
    add r5, r5, #0x1
    mov r4, r4, lsr #0x1
.L_88:
    cmp r5, #0x8
    bge .L_98
    cmp r4, #0x0
    bne .L_70
.L_98:
    mov r1, r9
    mov r2, r8
    mov r3, r7
    mov r0, #0xd
    str r6, [sp]
    bl func_02094c94
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
