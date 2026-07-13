; func_ov015_021b2b18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02104e6c
        .extern func_02001c78
        .extern func_02001cec
        .extern func_02001d48
        .extern func_0200506c
        .extern func_02005488
        .extern func_0202c06c
        .extern func_ov015_021b2a08
        .extern func_ov015_021b2ff0
        .global func_ov015_021b2b18
        .arm
func_ov015_021b2b18:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov r4, r0
    str r3, [sp, #0x10]
    mov r0, r1
    str r1, [sp, #0x8]
    str r2, [sp, #0xc]
    bl func_ov015_021b2a08
    ldr r1, [sp, #0x10]
    cmp r4, #0x1
    add r0, r0, r1, lsl #0x5
    str r0, [sp, #0x18]
    ldr r0, [sp, #0xc]
    mov r9, #0x10
    ldrsh r8, [r0, #0x4]
    ldrsh r0, [r0, #0x6]
    str r0, [sp, #0x14]
    beq .L_5c
    cmp r4, #0x2
    beq .L_6c
    cmp r4, #0x3
    beq .L_7c
    b .L_8c
.L_5c:
    ldr r0, _LIT0
    bl func_0202c06c
    mov r7, r0
    b .L_98
.L_6c:
    mov r0, #0x28c
    bl func_0202c06c
    mov r7, r0
    b .L_98
.L_7c:
    mov r0, #0x700
    bl func_0202c06c
    mov r7, r0
    b .L_98
.L_8c:
    ldr r0, _LIT0
    bl func_0202c06c
    mov r7, r0
.L_98:
    mov fp, #0x8
    mov sl, #0xa
    mov r5, #0xc
    mov r6, #0xe
.L_a8:
    sub r0, r9, #0x8
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_d4
    b .L_f4
    b .L_d4
    b .L_ec
    b .L_d4
    b .L_e4
    b .L_d4
    b .L_dc
.L_d4:
    mov r9, r6
    b .L_100
.L_dc:
    mov r9, r5
    b .L_100
.L_e4:
    mov r9, sl
    b .L_100
.L_ec:
    mov r9, fp
    b .L_100
.L_f4:
    add sp, sp, #0x1c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_100:
    mov r0, r7
    mov r1, r9
    bl func_02005488
    mov r4, r0
    add r0, r4, #0x2
    cmp r0, r8, lsl #0x3
    bgt .L_a8
    ldr r0, _LIT1
    ldr r2, [sp, #0x14]
    mov r1, r8
    bl func_02001cec
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c78
    ldr r0, [sp, #0x14]
    rsb r3, r4, r8, lsl #0x3
    rsb r0, r9, r0, lsl #0x3
    mov r0, r0, asr #0x1
    stmia sp, {r0, r9}
    ldr r2, [sp, #0x18]
    ldr r0, _LIT1
    mov r1, r7
    mov r3, r3, asr #0x1
    bl func_0200506c
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0xc]
    ldr r2, [sp, #0x10]
    ldr r3, [sp, #0x40]
    bl func_ov015_021b2ff0
    mov r0, #0x1
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000028b
_LIT1: .word data_02102bb0
_LIT2: .word data_02104e6c
