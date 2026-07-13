; func_ov020_021abab4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021ae948
        .extern func_ov020_021aa810
        .global func_ov020_021abab4
        .arm
func_ov020_021abab4:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    ldr r2, _LIT0
    mov ip, #0x0
    ldrsh lr, [r2, #0x44]
    ldrsh r3, [r2, #0x46]
    ldr r2, [r2, #0x2c]
    add lr, lr, #0x77
    add r3, r3, #0xae
    mov lr, lr, lsl #0xc
    mov r3, r3, lsl #0xc
    str r3, [sp, #0xc]
    str lr, [sp, #0x8]
    str ip, [sp]
    sub ip, ip, #0x1
    add r3, sp, #0x8
    str ip, [sp, #0x4]
    bl func_ov020_021aa810
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov020_021ae948
