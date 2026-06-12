; func_ov002_022812ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0227aee0
        .extern func_ov002_0227af30
        .global func_ov002_022812ac
        .arm
func_ov002_022812ac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x2c
    mov r6, #0x0
    mov r8, r0
    mov r7, r1
    mov r5, r6
    add r4, sp, #0x0
.L_2b44:
    cmp r8, r7
    mov r0, r7
    mov r1, r5
    bne .L_2b60
    mov r2, r4
    bl func_ov002_0227aee0
    b .L_2b68
.L_2b60:
    mov r2, r4
    bl func_ov002_0227af30
.L_2b68:
    ldr r0, [sp, #0x14]
    add r5, r5, #0x1
    cmp r5, #0x5
    add r6, r6, r0
    blt .L_2b44
    mov r0, r6
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
