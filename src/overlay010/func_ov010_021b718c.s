; func_ov010_021b718c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b9884
        .extern data_ov010_021b9890
        .extern func_020b3870
        .global func_ov010_021b718c
        .arm
func_ov010_021b718c:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r4, _LIT1
    ldr r2, [r1, #0x18]
    subs r0, r2, r0
    str r0, [r1, #0x18]
    movmi r0, #0x0
    strmi r0, [r4, #0xc]
    ldr r1, [r4, #0xc]
    mov r0, #0x97
    mul r0, r1, r0
    ldr r1, [r4, #0x8]
    bl func_020b3870
    add r0, r0, r0, lsr #0x1f
    mov r2, r0, asr #0x1
    rsb r0, r2, #0x6f
    mov r1, r0, lsl #0x8
    add r0, r2, #0x6f
    ldr r3, _LIT2
    ldr r2, _LIT3
    and r1, r1, #0xff00
    and r0, r0, #0xff
    strh r3, [r2]
    orr r0, r1, r0
    strh r0, [r2, #0x4]
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    mov r0, #0x0
    streq r0, [r4, #0x8]
    moveq r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov010_021b9884
_LIT1: .word data_ov010_021b9890
_LIT2: .word 0x000004e4
_LIT3: .word 0x04001040
