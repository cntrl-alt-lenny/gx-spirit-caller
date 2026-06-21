; func_ov002_021fd74c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021fc3e8
        .global func_ov002_021fd74c
        .arm
func_ov002_021fd74c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov lr, r0, lsl #0x10
    and r4, r0, #0x1
    ldr r5, _LIT0
    ldr r0, _LIT1
    add ip, sp, #0x0
    mov r3, #0x0
    str r3, [ip]
    mla r0, r4, r0, r5
    ldrh r6, [sp, #0x2]
    mov lr, lr, lsr #0x10
    str r3, [ip, #0x4]
    bic r6, r6, #0x1
    and r4, lr, #0x1
    orr r4, r6, r4
    add r0, r0, #0x120
    strh r4, [sp, #0x2]
    ldr r4, [r0, r1, lsl #0x2]
    ldrh r1, [sp, #0x2]
    mov r0, r4, lsl #0x2
    mov r0, r0, lsr #0x18
    bic r1, r1, #0x3e
    orr r1, r1, #0x16
    strh r1, [sp, #0x2]
    ldrh r1, [sp, #0x2]
    mov r4, r4, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r4, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    bic lr, r1, #0xfc0
    ldrh r5, [sp, #0x4]
    ldr r0, _LIT2
    mov r1, r4, lsl #0x17
    and r0, r5, r0
    orr r4, r0, r1, lsr #0x11
    mov r0, ip
    mov r1, r3
    str r3, [ip, #0x8]
    str r3, [ip, #0xc]
    str r3, [ip, #0x10]
    str r3, [ip, #0x14]
    strh r2, [sp]
    strh r4, [sp, #0x4]
    strh lr, [sp, #0x2]
    bl func_ov002_021fc3e8
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0xffff803f
