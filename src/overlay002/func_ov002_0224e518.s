; func_ov002_0224e518 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .extern func_0202b878
        .extern func_0202b890
        .extern func_ov002_02253458
        .global func_ov002_0224e518
        .arm
func_ov002_0224e518:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul fp, r1, r0
    ldr r0, _LIT1
    str r2, [sp]
    ldr r0, [r0, fp]
    mov r4, #0x0
    cmp r0, #0x0
    bls .L_a4
    mov r0, r2
    mov r0, r0, lsl #0x10
    ldr r1, _LIT2
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    add r9, r1, fp
    and r7, r0, #0xff
    mov r0, r2
    add r6, r9, #0x120
    and r8, r0, #0xff
.L_54:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202b878
    cmp r7, r0
    bne .L_90
    mov r0, r5
    bl func_0202b890
    cmp r8, r0
    bne .L_90
    mov r0, sl
    mov r1, #0xb
    mov r2, r4
    bl func_ov002_02253458
.L_90:
    ldr r0, [r9, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_54
.L_a4:
    ldr r0, _LIT3
    mov r4, #0x0
    ldr r0, [r0, fp]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r7, r0, #0xff
    add r9, r1, fp
    ldr r0, [sp]
    add r6, r9, #0x260
    and r8, r0, #0xff
    mov fp, #0xd
.L_e4:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202b878
    cmp r7, r0
    bne .L_120
    mov r0, r5
    bl func_0202b890
    cmp r8, r0
    bne .L_120
    mov r0, sl
    mov r1, fp
    mov r2, r4
    bl func_ov002_02253458
.L_120:
    ldr r0, [r9, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_e4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf17c
