; func_02073738 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ef1c
        .extern data_0219ef2c
        .extern func_02073d30
        .extern func_020945f4
        .extern func_02094688
        .global func_02073738
        .arm
func_02073738:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r4, r0
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x2a
    bl func_020945f4
    add r0, sp, #0x0
    mov r1, #0xff
    mov r2, #0x6
    bl func_020945f4
    ldr r0, _LIT0
    add r1, sp, #0x6
    mov r2, #0x6
    bl func_02094688
    mov r0, #0x1
    ldr r1, _LIT1
    strb r0, [sp, #0xf]
    strh r1, [sp, #0xc]
    strb r0, [sp, #0x15]
    mov r0, #0x8
    ldr r1, _LIT2
    strb r0, [sp, #0x10]
    strh r1, [sp, #0x12]
    ldr r0, _LIT0
    add r1, sp, #0x16
    mov r2, #0x6
    bl func_02094688
    ldr r0, _LIT3
    mov r1, r4, lsr #0x10
    ldr r3, [r0]
    mov r0, r1, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r4, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r3, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    mov r0, r3, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r4, asr #0x8
    orr r0, r0, r4, lsl #0x8
    strh r0, [sp, #0x1c]
    mov r0, r3, asr #0x8
    orr r0, r0, r3, lsl #0x8
    strh r0, [sp, #0x1e]
    mov r0, r2, asr #0x8
    orr r0, r0, r2, lsl #0x8
    strh r0, [sp, #0x26]
    mov r0, r1, asr #0x8
    orr r0, r0, r1, lsl #0x8
    mov r2, #0x0
    strh r0, [sp, #0x28]
    add r0, sp, #0x0
    mov r1, #0x2a
    mov r3, r2
    bl func_02073d30
    add sp, sp, #0x30
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_0219ef2c
_LIT1: .word 0x00000608
_LIT2: .word 0x00000406
_LIT3: .word data_0219ef1c
