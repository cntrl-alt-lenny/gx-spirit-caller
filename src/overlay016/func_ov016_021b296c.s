; func_ov016_021b296c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern func_02001d0c
        .extern func_02004f58
        .extern func_020054a4
        .extern func_02094504
        .extern func_02094550
        .global func_ov016_021b296c
        .arm
func_ov016_021b296c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r4, r3, asr #0x2
    add r6, r3, r4, lsr #0x1d
    mov r5, r0
    mov r7, r2
    mov r2, r3
    mov r4, r6, asr #0x3
    mov r0, #0x0
    mov sl, r1
    bl func_02094504
    mov r0, r4, asr #0x2
    add r1, r4, r0, lsr #0x1d
    ldr r0, _LIT0
    mov r1, r1, asr #0x3
    mov r2, #0x2
    bl func_02001d0c
    mov r0, r7
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, r6, asr #0x3
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r7
    mov r2, sl
    bl func_02004f58
    mov r0, r5, lsl #0x7
    add r5, r0, #0x6600000
    mov r0, #0x0
    mov r1, r5
    mov r2, #0x400
    bl func_02094504
    mov r0, r4, asr #0x4
    add r0, r4, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    mov r9, r0, lsl #0x1
    cmp r9, #0x0
    mov r6, #0x0
    addle sp, sp, #0x8
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4, lsl #0x3
    add r0, r0, r0, lsr #0x1f
    mov r7, r6
    mov r8, r6
    add fp, sl, r0, asr #0x1
.L_75c:
    mov r0, r8, lsl #0x8
    add r4, r0, r0, lsr #0x1f
    add r1, r7, r7, lsr #0x1f
    mov r2, #0x80
    add r0, sl, r4, asr #0x1
    add r1, r5, r1, asr #0x1
    bl func_02094550
    add r1, r6, #0x1
    mov r1, r1, lsl #0x8
    add r1, r1, r1, lsr #0x1f
    add r0, fp, r4, asr #0x1
    add r1, r5, r1, asr #0x1
    mov r2, #0x80
    bl func_02094550
    add r6, r6, #0x2
    cmp r6, r9
    add r7, r7, #0x200
    add r8, r8, #0x1
    blt .L_75c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102c90
