; func_ov011_021d17f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3284
        .extern data_ov011_021d3286
        .extern data_ov011_021d34bc
        .global func_ov011_021d17f0
        .arm
func_ov011_021d17f0:
    stmdb sp!, {r3, lr}
    sub r0, r0, #0x1
    ldr ip, _LIT0
    mov r3, r0, lsl #0x1
    ldrsb r3, [ip, r3]
    add ip, ip, r0, lsl #0x1
    mov r0, #0x72
    sub r3, r3, #0x1
    mul lr, r3, r0
    ldrsb ip, [ip, #0x1]
    ldr r3, _LIT1
    ldr r0, _LIT2
    sub ip, ip, #0x1
    mov ip, ip, lsl #0x2
    add r3, r3, lr
    add r0, r0, lr
    ldrh r3, [ip, r3]
    ldrh r0, [ip, r0]
    mov r3, r3, lsl #0xc
    str r3, [r1]
    mov r0, r0, lsl #0xc
    str r0, [r2]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov011_021d34bc
_LIT1: .word data_ov011_021d3284
_LIT2: .word data_ov011_021d3286
