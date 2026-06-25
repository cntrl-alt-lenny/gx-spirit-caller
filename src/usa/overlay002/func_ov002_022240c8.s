; func_ov002_022240c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern func_ov002_021d630c
        .extern func_ov002_021d6718
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .global func_ov002_022240c8
        .arm
func_ov002_022240c8:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_220
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    and r1, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov lr, r0, asr #0x8
    ldr r0, _LIT0
    and r2, r1, #0x1
    mul ip, r2, r0
    ldr r3, _LIT1
    and r2, lr, #0xff
    mov r0, #0x14
    smulbb lr, r2, r0
    add r0, r3, ip
    ldrh r0, [lr, r0]
    cmp r0, #0x0
    bne .L_220
    ldr r0, _LIT2
    mov r3, #0x1
    add r0, r0, ip
    ldrh r0, [lr, r0]
    cmp r0, #0x0
    mov r0, r4
    beq .L_21c
    str r3, [sp]
    bl func_ov002_021d6718
    b .L_220
.L_21c:
    bl func_ov002_021d630c
.L_220:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word data_ov002_022cf0c2
