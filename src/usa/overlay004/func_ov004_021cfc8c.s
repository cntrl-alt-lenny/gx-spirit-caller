; func_ov004_021cfc8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005d90
        .global func_ov004_021cfc8c
        .arm
func_ov004_021cfc8c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    add r2, r2, r2, lsl #0x1
    mov r2, r2, lsl #0xa
    and r3, r1, #0xff
    mov r6, #0x0
    add r1, r2, r2, lsr #0x1f
    orr r8, r3, #0x4000
    mov r1, r1, asr #0x1
    mov sl, r0
    mov r7, r6
    orr r8, r8, #-2147483648
    add r9, r1, #0x80
    mov r5, #0x2
    mov r4, r6
.L_144:
    add r0, r7, r7, lsr #0x1f
    add r1, r9, r0, asr #0x1
    mov r0, r1, asr #0x6
    mov r2, sl, lsl #0x17
    add r0, r1, r0, lsr #0x19
    orr r3, r8, r2, lsr #0x7
    mov r0, r0, asr #0x7
    orr r2, r0, #0x2000
    mov r0, r5
    mov r1, r4
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005d90
    ldr r2, [sp]
    add r6, r6, #0x1
    ldr r1, [sp, #0x4]
    str r2, [r0]
    str r1, [r0, #0x4]
    cmp r6, #0x6
    add sl, sl, #0x20
    add r7, r7, #0x200
    blt .L_144
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
