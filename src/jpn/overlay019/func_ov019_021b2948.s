; func_ov019_021b2948 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005d90
        .extern func_020943b0
        .global func_ov019_021b2948
        .arm
func_ov019_021b2948:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r4, [sp, #0x30]
    mov sl, r0
    mov r0, r4, asr #0x4
    add r0, r4, r0, lsr #0x1b
    mov r5, r0, asr #0x5
    cmp r5, #0x0
    mov r9, r2
    mov r8, r3
    mov r6, #0x0
    addle sp, sp, #0x8
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    and r0, r1, #0xff
    orr r7, r0, #0x4000
    orr r7, r7, #-2147483648
    mov r4, #0x2
    mov fp, r6
.L_1b4:
    mov r1, sl, lsl #0x17
    orr r3, r7, r1, lsr #0x7
    orr r0, r9, #0x800
    orr r2, r0, r8, lsl #0xc
    mov r0, r4
    mov r1, fp
    str r3, [sp]
    strh r2, [sp, #0x4]
    bl func_02005d90
    mov r1, r0
    add r0, sp, #0x0
    mov r2, #0x6
    bl func_020943b0
    add r6, r6, #0x1
    cmp r6, r5
    add sl, sl, #0x20
    add r9, r9, #0x2
    blt .L_1b4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
