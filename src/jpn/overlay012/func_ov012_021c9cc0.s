; func_ov012_021c9cc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov012_021cc5c0
        .extern func_ov000_021aa940
        .global func_ov012_021c9cc0
        .arm
func_ov012_021c9cc0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    ldrh r2, [r4]
    ldr r1, _LIT0
    add r0, sp, #0x8
    ldr r1, [r1, #0x524]
    rsb r2, r2, #0x1000
    .word 0xebffa689
    add r0, sp, #0x8
    add lr, sp, #0x20
    ldmia r0, {r0, r1, r2}
    stmia lr, {r0, r1, r2}
    add ip, sp, #0x14
    mov r0, #0x0
    str r0, [ip]
    str r0, [ip, #0x4]
    str r0, [ip, #0x8]
    sub r3, sp, #0x4
    ldmia lr, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    ldr r3, [r3]
    ldmia ip, {r0, r1, r2}
    bl func_ov000_021aa940
    ldrh r1, [r4]
    mov r0, #0x1
    sub r1, r1, #0x1
    strh r1, [r4]
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov012_021cc5c0
