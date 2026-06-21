; func_ov002_02226b4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b947c
        .extern func_ov002_021d59cc
        .extern func_ov002_02226268
        .global func_ov002_02226b4c
        .arm
func_ov002_02226b4c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r2, [r4, #0xc]
    cmp r2, #0x2
    bne .L_36c
    ldrh r0, [r4, #0xe]
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0x4
    bhi .L_360
    and r0, r0, #0xff
    mov r3, #0x14
    ldr r2, _LIT0
    ldr ip, _LIT1
    and lr, r0, #0x1
    mul r3, r1, r3
    mla r2, lr, r2, ip
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    beq .L_360
    mov r2, #0x0
    str r2, [sp]
    ldrh r2, [r4]
    mov r3, #0x2
    bl func_ov002_021d59cc
.L_360:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, pc}
.L_36c:
    bl func_ov002_02226268
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
