; func_ov002_021cff18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern func_ov002_021b1f20
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021cff18
        .arm
func_ov002_021cff18:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r3, _LIT0
    ldrh r0, [r3, #0x2]
    ldrh r2, [r3, #0x4]
    ldr lr, [r3, #0x810]
    and r1, r0, #0x1
    cmp lr, #0x0
    mov r0, r0, asr #0x8
    and r4, r2, #0x1
    mov r5, r2, asr #0x8
    ldrh r6, [r3, #0x6]
    bne .L_42c
    ldr ip, _LIT1
    ldr r2, _LIT2
    and r6, r1, #0x1
    mla ip, r6, r2, ip
    mov r2, #0x14
    add r6, lr, #0x1
    str r6, [r3, #0x810]
    mul r2, r0, r2
    add r3, ip, #0x30
    ldr r3, [r3, r2]
    and r2, r1, #0xff
    and r1, r0, #0xff
    mov r0, r3, lsl #0x2
    orr r2, r2, r1, lsl #0x8
    mov r1, r0, lsr #0x18
    mov r0, r2, lsl #0x10
    and r4, r4, #0xff
    and r2, r5, #0xff
    orr r2, r4, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r4, r3, lsl #0x12
    mov r3, r1, lsl #0x1
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    add r3, r3, r4, lsr #0x1f
    mov r0, #0x22
    bl func_ov002_0229ade0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_42c:
    mov r0, #0x22
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r3, r4, r5, r6, pc}
    mov r1, #0x0
    ldr r0, _LIT0
    str r1, [sp]
    ldrh r3, [r0, #0x2]
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021b1f20
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
