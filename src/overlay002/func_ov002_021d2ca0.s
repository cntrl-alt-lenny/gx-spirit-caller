; func_ov002_021d2ca0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern func_ov002_0229ade0
        .global func_ov002_021d2ca0
        .arm
func_ov002_021d2ca0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr ip, _LIT1
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r1, #0x1
    moveq r1, #0x0
    ldrh r2, [r0, #0x2]
    ldr r0, _LIT2
    and r3, r1, #0x1
    mla ip, r3, r0, ip
    mov r0, #0x14
    mul r0, r2, r0
    add r3, ip, #0x30
    ldr ip, [r3, r0]
    mov r0, #0x28
    mov r3, ip, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
