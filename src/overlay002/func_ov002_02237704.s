; func_ov002_02237704 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_021d6808
        .extern func_ov002_0220e77c
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .global func_ov002_02237704
        .arm
func_ov002_02237704:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7f
    beq .L_c4
    cmp r2, #0x80
    bne .L_d0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    bne .L_b8
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_b8
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
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
    beq .L_b8
    ldr r0, _LIT3
    add r0, r0, ip
    ldrh r0, [lr, r0]
    cmp r0, #0x0
    bne .L_b8
    mov ip, #0x1
    mov r0, r4
    mov r3, #0x0
    str ip, [sp]
    bl func_ov002_021d6808
.L_b8:
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, pc}
.L_c4:
    bl func_ov002_0220e77c
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_d0:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1a2
