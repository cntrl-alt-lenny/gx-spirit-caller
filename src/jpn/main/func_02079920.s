; func_02079920 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020799dc
        .extern func_02079d38
        .extern func_02094500
        .global func_02079920
        .arm
func_02079920:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r8, r3
    mov sl, r1
    mov r9, r2
    mov r2, r8, lsl #0x1
    mov r1, #0x0
    mov fp, r0
    bl func_02094500
    mov r0, sl
    mov r1, r8
    bl func_02079d38
    mov r5, r0
    mov r0, r9
    mov r1, r8
    bl func_02079d38
    str r0, [sp]
    cmp r0, #0x0
    mov r7, #0x0
    addle sp, sp, #0xc
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxle lr
    str r7, [sp, #0x4]
.L_5c:
    ldr r6, [sp, #0x4]
    sub r4, r8, r7
    b .L_90
.L_68:
    mov r1, r6, lsl #0x1
    mov r0, r7, lsl #0x1
    ldrh r2, [sl, r1]
    ldrh r1, [r9, r0]
    mov r0, fp
    mov r3, r8
    mul r1, r2, r1
    add r2, r7, r6
    bl func_020799dc
    add r6, r6, #0x1
.L_90:
    cmp r6, r5
    bge .L_a0
    cmp r6, r4
    blt .L_68
.L_a0:
    ldr r0, [sp]
    add r7, r7, #0x1
    cmp r7, r0
    blt .L_5c
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
