; func_02044758 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02043a78
        .extern func_02044eec
        .extern func_0209448c
        .extern func_02094688
        .global func_02044758
        .arm
func_02044758:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r7, r0
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x400
    bl func_0209448c
    mov r2, #0x0
    mov r1, #0xff
.L_58:
    add r0, r7, r2, lsl #0x8
    add r2, r2, #0x1
    strb r1, [r0, #0xe7]
    cmp r2, #0x3
    blt .L_58
    add r0, sp, #0x0
    bl func_02044eec
    add r0, sp, #0x0
    bl func_02043a78
    mov r6, r0
    mov r5, #0x0
    mov r4, #0xe
.L_88:
    mov r0, r6
    mov r2, r4
    add r1, r7, #0xf0
    bl func_02094688
    add r5, r5, #0x1
    cmp r5, #0x2
    add r7, r7, #0x100
    blt .L_88
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
