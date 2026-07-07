; func_ov002_021b9174 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern data_ov002_022d0170
        .extern func_ov002_021b90e4
        .extern func_ov002_021c9aa0
        .extern func_ov002_0229cc4c
        .global func_ov002_021b9174
        .arm
func_ov002_021b9174:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r4, sl, #0x1
    mul r6, r4, r0
    mov r9, r1
    mov r1, #0x14
    ldr r0, _LIT1
    mul r5, r9, r1
    add r0, r0, r6
    add r0, r0, #0x30
    add r4, r0, r5
    mov r8, r2
    mov r0, r4
    mov r7, r3
    bl func_ov002_0229cc4c
    mov r0, r4
    mov r1, r8
    bl func_ov002_021b90e4
    ldr r0, _LIT2
    ldr r3, [sp, #0x20]
    ldr r1, [r0, #0xce8]
    ldr r2, _LIT3
    add r1, r1, #0x1
    str r1, [r0, #0xce8]
    strh r1, [r4, #0x4]
    strh r7, [r4, #0x6]
    strh r3, [r4, #0x8]
    ldr r7, [r8]
    ldr r1, _LIT4
    mov r0, r7, lsl #0x12
    add r4, r1, r6
    mov r1, r7, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r0, r1, r0, lsr #0x1f
    mov r7, r0, lsl #0x2
    ldrh ip, [r2, r7]
    mov r0, sl
    mov r1, r9
    bic r6, ip, #0x6000
    mov ip, ip, lsl #0x11
    mov ip, ip, lsr #0x1e
    add ip, ip, #0x1
    mov ip, ip, lsl #0x10
    mov ip, ip, lsr #0x10
    mov ip, ip, lsl #0x1e
    orr r6, r6, ip, lsr #0x11
    strh r6, [r2, r7]
    ldr r6, [r4, r5]
    mov r2, #0x8
    orr r6, r6, #0x200000
    str r6, [r4, r5]
    bl func_ov002_021c9aa0
    ldr r0, [r8]
    mov r1, r9
    mov r0, r0, lsl #0x12
    cmp sl, r0, lsr #0x1f
    movne r3, #0x1
    moveq r3, #0x0
    mov r0, sl
    mov r2, #0x0
    bl func_ov002_021c9aa0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022d0170
_LIT4: .word data_ov002_022cf0cc
