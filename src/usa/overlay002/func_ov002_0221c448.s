; func_ov002_0221c448 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern func_ov002_021d5918
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .global func_ov002_0221c448
        .arm
func_ov002_0221c448:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r1, #0x0
    mov r2, r1
    mov r4, r0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_7b8
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    and r1, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov lr, r0, asr #0x8
    ldr r0, _LIT0
    ldr r2, _LIT1
    and ip, r1, #0x1
    mla r3, ip, r0, r2
    and r2, lr, #0xff
    mov r0, #0x14
    smulbb r0, r2, r0
    ldrh r0, [r0, r3]
    cmp r0, #0x0
    beq .L_7b8
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0x2bc
    str r0, [sp, #0x4]
    ldrh r3, [r4]
    mov r0, r4
    bl func_ov002_021d5918
.L_7b8:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
