; func_02026f78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02186ae8
        .extern data_02186aee
        .extern data_0219a914
        .global func_02026f78
        .arm
func_02026f78:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, #0x0
    ldr r5, _LIT0
    ldr r2, _LIT1
    ldr r1, _LIT2
    mov lr, r4
.L_fac:
    strh r4, [r5]
    ldr r3, [r0, lr, lsl #0x2]
    cmp lr, #0x0
    strh r3, [r5, #0x2]
    ldrsh ip, [r5, #0x2]
    ldreqsh r3, [r5]
    add lr, lr, #0x1
    add r4, r4, ip
    streqh ip, [r1]
    streqh r3, [r2]
    cmp lr, #0x3
    add r5, r5, #0x4
    blt .L_fac
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_0219a914
_LIT1: .word data_02186ae8
_LIT2: .word data_02186aee
