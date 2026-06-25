; func_ov002_0228dd9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c37e4
        .global func_ov002_0228dd9c
        .arm
func_ov002_0228dd9c:
    stmdb sp!, {r3, lr}
    ldr ip, _LIT0
    ldr r2, _LIT1
    and r3, r0, #0x1
    mla r2, r3, r2, ip
    add r2, r2, #0x120
    ldr r2, [r2, r1, lsl #0x2]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c37e4
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
