; func_ov008_021afc2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2de4
        .extern func_020b3870
        .extern func_ov008_021abb08
        .extern func_ov008_021abba0
        .global func_ov008_021afc2c
        .arm
func_ov008_021afc2c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldrh r0, [r1, #0xa8]
    cmp r0, #0x3
    movhi r0, #0x3
    mov r1, r0, lsl #0x1
    mov r0, #0x8a
    bl func_020b3870
    ldr r1, _LIT0
    mov r2, r0, lsl #0x1
    mov r3, #0x15
    ldrh r1, [r1, #0x4]
    mla ip, r4, r2, r3
    cmp r1, #0x0
    bne .L_6f8
    add r0, ip, r0
    sub r1, r0, #0x16
    mov r0, #0x24
    bl func_ov008_021abb08
    ldmia sp!, {r4, pc}
.L_6f8:
    sub r2, r1, #0x1
    mov r1, #0x1a
    mul r3, r2, r1
    add r1, ip, r0
    add r0, r3, #0x47
    sub r1, r1, #0xe
    bl func_ov008_021abba0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b2de4
