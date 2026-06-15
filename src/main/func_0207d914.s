; func_0207d914 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d1e8
        .extern func_0207d994
        .global func_0207d914
        .arm
func_0207d914:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r3, r1
    add r4, r5, #0x24
    str r2, [sp]
    ldr r1, _LIT0
    add r2, r4, #0x14
    bl func_0207d1e8
    mov r0, #0x0
    strh r0, [r4, #0x10]
    strh r0, [r4, #0x12]
    ldrh r2, [r4, #0x12]
    ldr r1, _LIT1
    add r0, sp, #0x4
    bic r2, r2, #0x1
    strh r2, [r4, #0x12]
    ldr r2, [r5, #0x18]
    str r2, [sp, #0x4]
    ldr r2, [r5, #0x1c]
    str r2, [sp, #0x8]
    bl func_0207d994
    str r0, [r5, #0x24]
    str r0, [r4, #0x4]
    mov r1, #0x0
    str r1, [r4, #0x8]
    mov r0, r5
    str r1, [r4, #0xc]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x45585048
_LIT1: .word 0x00004652
