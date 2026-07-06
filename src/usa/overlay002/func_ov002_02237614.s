; func_ov002_02237614 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern func_ov002_021d6718
        .extern func_ov002_0220e68c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .global func_ov002_02237614
        .arm
func_ov002_02237614:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7f
    beq .L_1b0
    cmp r2, #0x80
    bne .L_1bc
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    bne .L_1a4
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_1a4
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    and r1, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov lr, r0, asr #0x8
    ldr r0, _LIT1
    and r2, r1, #0x1
    mul ip, r2, r0
    ldr r3, _LIT2
    and r2, lr, #0xff
    mov r0, #0x14
    smulbb lr, r2, r0
    add r0, r3, ip
    ldrh r0, [lr, r0]
    cmp r0, #0x0
    beq .L_1a4
    ldr r0, _LIT3
    add r0, r0, ip
    ldrh r0, [lr, r0]
    cmp r0, #0x0
    bne .L_1a4
    mov ip, #0x1
    mov r0, r4
    mov r3, #0x0
    str ip, [sp]
    bl func_ov002_021d6718
.L_1a4:
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, pc}
.L_1b0:
    bl func_ov002_0220e68c
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_1bc:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0c2
