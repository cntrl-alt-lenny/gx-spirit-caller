; func_ov004_021d0db8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02104e6c
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001e74
        .extern func_02004f3c
        .extern func_02005488
        .extern func_0202c06c
        .extern func_0208de04
        .extern func_0208e0c4
        .extern func_02094410
        .global func_ov004_021d0db8
        .arm
func_ov004_021d0db8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov sl, r0
    ldr r0, [r1, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT1
    mov r1, #0xa
    mov r2, #0x3
    bl func_02001cec
    mov r4, #0x0
    ldr fp, _LIT1
    mov r7, r4
    mov r6, #0xf1
.L_82c:
    bl func_0208de04
    add r1, r0, r6, lsl #0x5
    mov r0, #0x0
    mov r2, #0x3c0
    bl func_02094410
    cmp sl, #0x0
    beq .L_8c8
    add r0, r4, #0x1d
    bl func_0202c06c
    mov r5, r0
    bl func_0208de04
    mov r8, r0
    cmp r4, #0x0
    moveq r9, #0x1
    mov r0, r5
    mov r1, #0xc
    movne r9, #0x0
    bl func_02005488
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    mov r1, r5
    mov r5, #0x6
    str r5, [sp]
    mov r5, #0xc
    add r3, r9, r9, lsl #0x1
    rsb r0, r0, #0x28
    add r3, r3, r0
    add r2, r8, r6, lsl #0x5
    mov r0, fp
    str r5, [sp, #0x4]
    bl func_02004f3c
    bl func_0208e0c4
    add r0, r0, #0x4a
    add r0, r0, #0x400
    add r1, r0, r7, lsl #0x1
    mov r0, fp
    mov r2, r6
    mov r3, #0x1
    bl func_02001e74
.L_8c8:
    add r4, r4, #0x1
    cmp r4, #0x2
    add r6, r6, #0x1e
    add r7, r7, #0xb
    blt .L_82c
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_02102bb0
