; func_ov004_021cb778 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005dac
        .global func_ov004_021cb778
        .arm
func_ov004_021cb778:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r5, [sp, #0x30]
    mov sl, r0
    mov r0, r5, asr #0x4
    add r0, r5, r0, lsr #0x1b
    mov r8, r0, asr #0x5
    cmp r8, #0x0
    mov r9, r3
    mov r4, #0x0
    addle sp, sp, #0x8
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mul r0, r2, r5
    mov r0, r0, lsl #0x4
    and r1, r1, #0xff
    add r0, r0, r0, lsr #0x1f
    orr r6, r1, #0x4000
    mov r0, r0, asr #0x1
    mov r5, r4
    orr r6, r6, #-2147483648
    add r7, r0, #0xc80
    mov fp, #0x2
.L_2b8:
    add r0, r5, r5, lsr #0x1f
    add r1, r7, r0, asr #0x1
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    mov r1, sl, lsl #0x17
    orr r2, r6, r1, lsr #0x7
    mov r0, r0, asr #0x7
    orr r0, r0, #0x800
    orr r3, r0, r9, lsl #0xc
    mov r0, fp
    mov r1, #0x0
    str r2, [sp]
    strh r3, [sp, #0x4]
    bl func_02005dac
    ldr r2, [sp]
    add r4, r4, #0x1
    ldr r1, [sp, #0x4]
    str r2, [r0]
    str r1, [r0, #0x4]
    cmp r4, r8
    add sl, sl, #0x20
    add r5, r5, #0x200
    blt .L_2b8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
