; func_ov004_021d0450 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02104e6c
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001e74
        .extern func_02004f3c
        .extern func_02005488
        .extern func_0202c06c
        .extern func_0208de04
        .extern func_0208e0c4
        .extern func_02094410
        .global func_ov004_021d0450
        .arm
func_ov004_021d0450:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, _LIT0
    mov r1, #0x20
    mov r2, #0x2
    bl func_02001cec
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    bl func_0208de04
    add r1, r0, #0xda0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    cmp r4, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_0202c06c
    mov r5, r0
    bl func_0208de04
    mov r4, r0
    mov r0, r5
    mov r1, #0xc
    bl func_02005488
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x80
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r5
    add r2, r4, #0xda0
    bl func_02004f3c
    bl func_0208e0c4
    add r1, r0, #0x280
    ldr r0, _LIT0
    mov r2, #0x6d
    mov r3, #0x1
    bl func_02001e74
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02102bb0
_LIT1: .word data_02104e6c
