; func_ov010_021b7028 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov010_021b9784
        .extern data_ov010_021b9790
        .global func_ov010_021b7028
        .arm
func_ov010_021b7028:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldrh r2, [r0, #0x54]
    ldr r0, [r1, #0xc]
    ldr r3, _LIT2
    tst r2, #0x2
    beq .L_508
    ldr r1, [r3, #0x358]
    orr r1, r1, #0x4
    str r1, [r3, #0x358]
    b .L_518
.L_508:
    tst r2, #0x1
    ldrne r1, [r3, #0x358]
    orrne r1, r1, #0x10
    strne r1, [r3, #0x358]
.L_518:
    ldr r1, [r3, #0x358]
    mov r2, r1, lsl #0x1c
    mov r2, r2, lsr #0x1f
    cmp r2, #0x1
    orreq r1, r1, #0x10
    streq r1, [r3, #0x358]
    bx lr
_LIT0: .word data_02104acc
_LIT1: .word data_ov010_021b9784
_LIT2: .word data_ov010_021b9790
