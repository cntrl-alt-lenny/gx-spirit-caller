; func_ov002_0224edc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202df24
        .extern func_ov002_021c3304
        .extern func_ov002_0223b378
        .extern func_ov002_0223b3d4
        .extern func_ov002_02253370
        .global func_ov002_0224edc4
        .arm
func_ov002_0224edc4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r2
    mov sl, r0
    mov r0, r9
    bl func_ov002_0223b378
    ldr r1, _LIT0
    and r3, sl, #0x1
    mul r2, r3, r1
    ldr r1, _LIT1
    mov r6, r0
    ldr r0, [r1, r2]
    mov r4, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    add fp, r0, r2
    add r0, fp, #0x18
    add r8, r0, #0x400
.L_48:
    ldr r0, [r8]
    mov r5, #0x0
    mov r0, r0, lsl #0x13
    cmp r6, #0x0
    mov r7, r0, lsr #0x13
    ble .L_b4
.L_60:
    mov r0, r9
    mov r1, r5
    bl func_ov002_0223b3d4
    mov r1, r7
    bl func_0202df24
    cmp r0, #0x0
    beq .L_a8
    mov r0, sl
    mov r1, sl
    mov r2, r4
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_a8
    mov r0, sl
    mov r1, #0xe
    mov r2, r4
    bl func_ov002_02253370
    b .L_b4
.L_a8:
    add r5, r5, #0x1
    cmp r5, r6
    blt .L_60
.L_b4:
    ldr r0, [fp, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r8, r8, #0x4
    bcc .L_48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
