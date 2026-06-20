; func_ov002_0224de94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b878
        .extern func_0202b8a8
        .extern func_0202de9c
        .extern func_0202e234
        .extern func_ov002_021c33e4
        .extern func_ov002_02253458
        .global func_ov002_0224de94
        .arm
func_ov002_0224de94:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r3, sl, #0x1
    mul r2, r3, r0
    ldr r0, _LIT1
    mov r9, r1
    ldr r0, [r0, r2]
    mov r5, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    mov fp, #0xe
    add r8, r0, r2
    add r0, r8, #0x18
    add r7, r0, #0x400
.L_40:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202e234
    cmp r0, #0x0
    beq .L_c0
    mov r0, r6
    bl func_0202de9c
    cmp r0, #0x0
    bne .L_c0
    mov r0, r6
    bl func_0202b878
    mov r4, r0
    mov r0, r9
    bl func_0202b878
    cmp r4, r0
    bne .L_c0
    mov r0, r6
    bl func_0202b8a8
    cmp r0, #0x2
    bgt .L_c0
    mov r0, sl
    mov r1, sl
    mov r2, r5
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_c0
    mov r0, sl
    mov r1, fp
    mov r2, r5
    bl func_ov002_02253458
.L_c0:
    ldr r0, [r8, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r7, r7, #0x4
    bcc .L_40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
