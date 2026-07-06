; func_ov002_021fbfd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021fc2f8
        .global func_ov002_021fbfd8
        .arm
func_ov002_021fbfd8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r3, r0, lsl #0x10
    and ip, r0, #0x1
    ldr r6, _LIT0
    ldr r0, _LIT1
    add r4, sp, #0x0
    mov lr, #0x0
    str lr, [r4]
    ldrh r5, [sp, #0x2]
    mla r6, ip, r0, r6
    mov r3, r3, lsr #0x10
    bic r5, r5, #0x1
    and r0, r3, #0x1
    orr r0, r5, r0
    strh r0, [sp, #0x2]
    add r0, r6, #0x120
    ldr r5, [r0, r1, lsl #0x2]
    ldrh r1, [sp, #0x2]
    mov r0, r5, lsl #0x2
    mov r0, r0, lsr #0x18
    bic r1, r1, #0x3e
    orr r1, r1, #0x16
    strh r1, [sp, #0x2]
    mov r3, r5, lsl #0x13
    mov ip, r3, lsr #0x13
    ldrh r1, [sp, #0x2]
    mov r0, r0, lsl #0x1
    str lr, [r4, #0x4]
    bic r3, r1, #0x4000
    mov r1, r5, lsl #0x12
    add r0, r0, r1, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldrh r5, [sp, #0x4]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x17
    and r0, r5, r0
    orr r5, r0, r1, lsr #0x11
    mov r0, r4
    mov r1, r2
    str lr, [r4, #0x8]
    str lr, [r4, #0xc]
    str lr, [r4, #0x10]
    str lr, [r4, #0x14]
    strh ip, [sp]
    strh r3, [sp, #0x2]
    strh r5, [sp, #0x4]
    bl func_ov002_021fc2f8
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0xffff803f
