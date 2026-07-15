; func_ov010_021b7118 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b9784
        .extern data_ov010_021b9790
        .extern func_020b377c
        .global func_ov010_021b7118
        .arm
func_ov010_021b7118:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r4, _LIT1
    ldr r2, [r1, #0x18]
    subs r0, r2, r0
    str r0, [r1, #0x18]
    movmi r0, #0x0
    strmi r0, [r4, #0xc]
    ldr r1, [r4, #0x8]
    ldr r2, [r4, #0xc]
    mov r0, #0x97
    sub r2, r1, r2
    mul r0, r2, r0
    bl func_020b377c
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
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT4
    strh r3, [r2]
    strh r0, [r2, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov010_021b9784
_LIT1: .word data_ov010_021b9790
_LIT2: .word 0x000004e4
_LIT3: .word 0x04001040
_LIT4: .word 0x000024bb
