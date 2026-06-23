; func_ov004_021d855c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4634
        .extern data_ov004_02209eb0
        .extern data_ov004_02209ecc
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0209445c
        .global func_ov004_021d855c
        .arm
func_ov004_021d855c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    ldr ip, _LIT0
    ldr r1, _LIT1
    ldrh r2, [ip]
    mov r4, r0
    sub r3, ip, #0x2
    and r0, r2, #0x43
    orr r0, r0, #0x218
    orr r0, r0, #0x8000
    strh r0, [ip]
    ldrh r2, [ip]
    sub r1, r1, #0x200
    add r0, sp, #0x0
    bic r2, r2, #0x3
    orr r2, r2, #0x1
    strh r2, [ip]
    ldrh r2, [r3]
    and r2, r2, #0x43
    orr r1, r2, r1
    strh r1, [r3]
    ldrh r1, [r3]
    bic r1, r1, #0x3
    strh r1, [r3]
    bl func_0201d428
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r2, #0x40
    ldr ip, _LIT3
    ldrh r1, [sp, #0x14]
    str r0, [sp]
    str ip, [sp, #0xc]
    bic r0, r1, #0xf
    orr r0, r0, #0x6
    strh r0, [sp, #0x14]
    ldrh r3, [sp, #0x14]
    sub r1, r2, #0x41
    add r0, sp, #0x0
    bic r3, r3, #0x10
    strh r3, [sp, #0x14]
    strh r2, [sp, #0x10]
    str r1, [sp, #0x8]
    bl func_0201e564
    ldr r0, [sp]
    bl func_02006e00
    add r0, sp, #0x0
    bl func_0201d428
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp]
    mov r0, #0x0
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0xc]
    strh r0, [sp, #0x10]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    ldrh r1, [sp, #0x14]
    add r0, sp, #0x0
    bic r1, r1, #0x10
    strh r1, [sp, #0x14]
    bl func_0201e564
    ldr r0, [sp]
    bl func_02006e00
    ldr r0, _LIT5
    ldr r1, _LIT6
    mov r2, #0x20
    bl func_0209445c
    mov r0, #0x0
    str r0, [r4, #0x18]
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0400100a
_LIT1: .word 0x00008218
_LIT2: .word data_ov004_02209eb0
_LIT3: .word 0x00004020
_LIT4: .word data_ov004_02209ecc
_LIT5: .word data_020b4634
_LIT6: .word 0x05000460
