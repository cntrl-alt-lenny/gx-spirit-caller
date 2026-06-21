; func_ov002_021fb640 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_0202e234
        .extern func_ov002_021b947c
        .extern func_ov002_021c33e4
        .extern func_ov002_021f4a4c
        .extern func_ov002_021f4a84
        .extern func_ov002_021ff3bc
        .global func_ov002_021fb640
        .arm
func_ov002_021fb640:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r7, #0x14]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r0, lsr #0x10
    mov r2, r1, asr #0x8
    mov r1, r3, lsl #0x10
    and r2, r2, #0xff
    cmp r2, #0xe
    and r4, r0, #0xff
    mov r5, r1, lsr #0x10
    bne .L_c8
    ldr r1, [r7, #0x14]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    beq .L_c8
    ldrh r0, [r7, #0x2]
    mov r1, r4
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_c8
    mov r0, r7
    mov r1, r6
    bl func_ov002_021f4a84
    mov r4, r0
    cmp r4, #0x1
    bne .L_c0
    mov r0, r7
    mov r1, r6
    bl func_ov002_021f4a4c
.L_c0:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_c8:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d0250
