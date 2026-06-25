; func_ov002_0224e96c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c37e4
        .extern func_ov002_02253370
        .global func_ov002_0224e96c
        .arm
func_ov002_0224e96c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, _LIT0
    ldr r1, _LIT1
    and r3, r5, #0x1
    mla r1, r3, r1, r4
    mov r4, r2
    add r1, r1, #0x120
    ldr r2, [r1, r4, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c37e4
    cmp r0, #0x7
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r2, r4
    mov r1, #0xb
    bl func_ov002_02253370
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
