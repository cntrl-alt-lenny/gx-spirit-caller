; func_ov015_021b3c14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02102bb0
        .extern data_ov015_021b5974
        .extern func_02001c78
        .extern func_02001cec
        .extern func_0200506c
        .extern func_02005488
        .extern func_0202c06c
        .extern func_0208de58
        .extern func_ov015_021b2ff0
        .global func_ov015_021b3c14
        .arm
func_ov015_021b3c14:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr r0, _LIT0
    bl func_0202c06c
    mov r1, #0xe
    mov r5, r0
    bl func_02005488
    ldr r1, _LIT1
    mov r4, r0
    ldrh r2, [r1, #0x4]
    ldrh r0, [r1, #0x6]
    strh r2, [sp, #0x8]
    strh r0, [sp, #0xa]
    ldrh r2, [r1, #0x8]
    ldrh r0, [r1, #0xa]
    strh r2, [sp, #0xc]
    strh r0, [sp, #0xe]
    bl func_0208de58
    mov r6, r0
    ldrsh r1, [sp, #0xc]
    ldrsh r2, [sp, #0xe]
    ldr r0, _LIT2
    bl func_02001cec
    ldrsh r3, [sp, #0xc]
    ldrsh r2, [sp, #0xe]
    mov r0, #0x0
    mov r1, r6
    smulbb r2, r3, r2
    add r2, r2, #0x1
    mov r2, r2, lsl #0x5
    bl Fill32
    cmp r4, #0xce
    movge r4, #0x10
    rsblt r0, r4, #0xd0
    movlt r0, r0, asr #0x1
    addlt r4, r0, #0xc
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c78
    mov r2, #0x68
    mov r3, r4
    str r2, [sp]
    mov r4, #0xe
    ldr r0, _LIT2
    mov r1, r5
    add r2, r6, #0x20
    str r4, [sp, #0x4]
    bl func_0200506c
    add r1, sp, #0x8
    mov r0, #0x4
    mov r2, #0x1
    mov r3, #0xf
    bl func_ov015_021b2ff0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000006ff
_LIT1: .word data_ov015_021b5974
_LIT2: .word data_02102bb0
