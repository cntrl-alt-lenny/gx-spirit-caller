; func_ov002_0224b2e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b878
        .extern func_0202b8a8
        .extern func_ov002_021c33e4
        .extern func_ov002_02253458
        .global func_ov002_0224b2e0
        .arm
func_ov002_0224b2e0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r3, sl, #0x1
    mul r1, r3, r0
    ldr r0, _LIT1
    mov r9, r2
    ldr r0, [r0, r1]
    mov r5, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    mov r4, #0x6
    add r8, r0, r1
    add r0, r8, #0x18
    add r7, r0, #0x400
    mov fp, #0xe
.L_44:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202b878
    cmp r0, #0x11
    bne .L_ac
    mov r0, sl
    mov r1, sl
    mov r2, r5
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_ac
    mov r0, r6
    bl func_0202b8a8
    cmp r0, #0x6
    movge r0, r4
    bge .L_94
    mov r0, r6
    bl func_0202b8a8
.L_94:
    cmp r9, r0
    bne .L_ac
    mov r0, sl
    mov r1, fp
    mov r2, r5
    bl func_ov002_02253458
.L_ac:
    ldr r0, [r8, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r7, r7, #0x4
    bcc .L_44
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
