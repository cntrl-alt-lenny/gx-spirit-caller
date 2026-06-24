; func_02094f3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094ba0
        .extern func_02095b04
        .global func_02094f3c
        .arm
func_02094f3c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r7, r2
    mov r9, r0
    mov r8, r1
    mov r6, r3
    mov r4, r7
    mov r5, #0x0
    b .L_3c
.L_24:
    ands r0, r4, #0x1
    beq .L_34
    mov r0, r5
    bl func_02095b04
.L_34:
    add r5, r5, #0x1
    mov r4, r4, lsr #0x1
.L_3c:
    cmp r5, #0x8
    bge .L_4c
    cmp r4, #0x0
    bne .L_24
.L_4c:
    mov r1, r9
    mov r2, r8
    mov r3, r7
    mov r0, #0xd
    str r6, [sp]
    bl func_02094ba0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
