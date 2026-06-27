; func_ov002_021f7f38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c8
        .extern func_ov002_021d8fd0
        .extern func_ov002_021e2ca4
        .global func_ov002_021f7f38
        .arm
func_ov002_021f7f38:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    ldr r3, _LIT1
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1a
    and ip, r2, #0x1
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, ip, r0, r3
    ldr r0, [r1, r0]
    mov r2, #0x5
    strh r0, [r4, #0x8]
    ldrh r0, [r4, #0x2]
    mov r3, #0x0
    mov ip, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, ip, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021e2ca4
    ldrh r0, [r4, #0x2]
    mov r2, #0x0
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8fd0
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c8
