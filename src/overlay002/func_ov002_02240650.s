; func_ov002_02240650 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_0223f684
        .global func_ov002_02240650
        .arm
func_ov002_02240650:
    stmdb sp!, {r4, lr}
    ldrh r2, [r0, #0x2]
    ldrh ip, [r0, #0x4]
    ldr r4, _LIT0
    mov r3, r2, lsl #0x1f
    mov lr, r3, lsr #0x1f
    mov r3, r2, lsl #0x1a
    ldr r2, _LIT1
    and lr, lr, #0x1
    mla r4, lr, r2, r4
    mov r3, r3, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    add r3, r4, #0x30
    ldr r3, [r3, r2]
    mov ip, ip, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov ip, ip, lsr #0x17
    add r2, r2, r3, lsr #0x1f
    cmp ip, r2
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    bl func_ov002_0223f684
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
