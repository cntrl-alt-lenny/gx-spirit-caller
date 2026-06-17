; func_ov002_02253304 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202b8a8
        .extern func_0202e234
        .extern func_0202e258
        .extern func_ov002_021ca440
        .extern func_ov002_02253458
        .global func_ov002_02253304
        .arm
func_ov002_02253304:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r3, r4, #0x1
    mla r0, r3, r0, r1
    mov r6, r2
    add r0, r0, r6, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202e234
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    bl func_0202b8a8
    cmp r0, #0x5
    ldmltia sp!, {r4, r5, r6, pc}
    mov r0, r5
    bl func_0202e258
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r1, r5
    bl func_ov002_021ca440
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r2, r6
    mov r1, #0xb
    bl func_ov002_02253458
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
