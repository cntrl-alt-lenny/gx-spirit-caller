; func_02005a60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094688
        .global func_02005a60
        .arm
func_02005a60:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov fp, r1
    sub r6, fp, #0x1
    mov sl, r0
    mov r9, r2
    str r3, [sp]
    cmp r6, #0x0
    mov r5, #0x0
    ble .L_200
    str r5, [sp, #0x8]
    str r5, [sp, #0x4]
.L_164:
    ldr r0, [sp, #0x8]
    ldr r2, [sp]
    add r1, r0, r9
    ldr r0, [sp, #0x4]
    add r1, sl, r1
    add r0, sl, r0
    blx r2
    cmp r0, #0x0
    bne .L_1d8
    add r4, r5, #0x1
    cmp r4, r6
    bge .L_1c8
    mul r6, r4, r9
    mov r7, r6
    sub r8, fp, #0x1
.L_1a0:
    add r0, r7, r9
    mov r2, r9
    add r0, sl, r0
    add r1, sl, r6
    bl func_02094688
    add r4, r4, #0x1
    cmp r4, r8
    add r6, r6, r9
    add r7, r7, r9
    blt .L_1a0
.L_1c8:
    sub r0, fp, #0x1
    mov r0, r0, lsl #0x10
    mov fp, r0, lsr #0x10
    b .L_1f4
.L_1d8:
    ldr r0, [sp, #0x8]
    add r5, r5, #0x1
    add r0, r0, r9
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x4]
    add r0, r0, r9
    str r0, [sp, #0x4]
.L_1f4:
    sub r6, fp, #0x1
    cmp r5, r6
    blt .L_164
.L_200:
    mov r0, fp
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
