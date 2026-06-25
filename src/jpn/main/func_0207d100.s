; func_0207d100 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07f0
        .extern data_021a07f4
        .extern func_0207d044
        .extern func_0207d0d0
        .extern func_0207d18c
        .global func_0207d100
        .arm
func_0207d100:
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4]
    str r2, [r4, #0x18]
    str r3, [r4, #0x1c]
    mov r0, #0x0
    str r0, [r4, #0x20]
    ldr r1, [r4, #0x20]
    ldrh r0, [sp, #0x8]
    bic r1, r1, #0xff
    str r1, [r4, #0x20]
    ldr r1, [r4, #0x20]
    and r0, r0, #0xff
    orr r2, r1, r0
    add r0, r4, #0xc
    mov r1, #0x4
    str r2, [r4, #0x20]
    bl func_0207d0d0
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_70
    ldr r0, _LIT1
    mov r1, #0x4
    bl func_0207d0d0
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0]
.L_70:
    mov r0, r4
    bl func_0207d18c
    mov r1, r4
    bl func_0207d044
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a07f0
_LIT1: .word data_021a07f4
