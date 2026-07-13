; func_ov003_021cea48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005d90
        .extern func_020943b0
        .global func_ov003_021cea48
        .arm
func_ov003_021cea48:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r0, #0x18
    mul r0, r2, r0
    add r0, r0, #0x94
    cmp r1, #0x0
    movne r8, #0x1
    and r0, r0, #0xff
    moveq r8, #0x2
    cmp r2, #0x0
    movne r9, #0x10
    orr r7, r0, #0x4000
    mov r5, #0x0
    ldr r6, [sp, #0x30]
    mov sl, r3
    moveq r9, #0x8
    orr r7, r7, #-2147483648
    mov r4, r5
    add fp, sp, #0x0
.L_1d2c:
    add r0, r6, #0x14
    mov r1, r0, lsl #0x17
    orr r3, r7, r1, lsr #0x7
    orr r0, r9, #0x400
    orr r2, r0, sl, lsl #0xc
    mov r0, r8
    mov r1, r4
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005d90
    mov r1, r0
    mov r0, fp
    mov r2, #0x6
    bl func_020943b0
    add r5, r5, #0x1
    cmp r5, #0x4
    add r6, r6, #0x20
    add r9, r9, #0x2
    blt .L_1d2c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
