; func_02024368 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be71c
        .extern func_0208c04c
        .global func_02024368
        .arm
func_02024368:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x20
    ldr r5, _LIT0
    add r4, sp, #0x8
    mov r3, #0x6
.L_14:
    ldrh r2, [r5]
    ldrh r1, [r5, #0x2]
    add r5, r5, #0x4
    strh r2, [r4]
    strh r1, [r4, #0x2]
    add r4, r4, #0x4
    subs r3, r3, #0x1
    bne .L_14
    ldr r1, _LIT1
    add r7, sp, #0x8
    ldrh r5, [r1]
    ldrh r3, [r1, #0x2]
    ldrh r2, [r1, #0x4]
    ldrh r1, [r1, #0x6]
    strh r5, [sp]
    add r4, sp, #0x0
    mov r8, r7
    strh r3, [sp, #0x2]
    strh r2, [sp, #0x4]
    strh r1, [sp, #0x6]
    add r6, r0, #0x68
    mov r5, #0x0
.L_6c:
    mov r0, r8
    mov r1, r7
    bl func_0208c04c
    ldrh r2, [r7]
    mov r0, r5, lsl #0x1
    ldrh r1, [r7, #0x2]
    ldrh r0, [r4, r0]
    add r5, r5, #0x1
    strh r2, [r6]
    strh r1, [r6, #0x2]
    ldrh r1, [r7, #0x4]
    cmp r5, #0x4
    add r7, r7, #0x6
    strh r1, [r6, #0x4]
    strh r0, [r6, #0x6]
    add r6, r6, #0x8
    add r8, r8, #0x6
    blt .L_6c
    mov r0, #0x1
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_020be71c+0x20
_LIT1: .word data_020be71c+0x8
