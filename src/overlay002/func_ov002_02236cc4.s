; func_ov002_02236cc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_02210104
        .global func_ov002_02236cc4
        .arm
func_ov002_02236cc4:
    stmdb sp!, {r4, lr}
    ldrh r4, [r0, #0x2]
    ldr r2, _LIT0
    ldrh ip, [r0, #0x4]
    mov r3, r4, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mov lr, r4, lsl #0x1a
    mul r2, r3, r2
    ldr r4, _LIT1
    mov lr, lr, lsr #0x1b
    mov r3, #0x14
    add r4, r4, r2
    mul r3, lr, r3
    add r4, r4, #0x30
    ldr lr, [r4, r3]
    mov r4, ip, lsl #0x11
    mov ip, lr, lsl #0x2
    mov ip, ip, lsr #0x18
    mov lr, lr, lsl #0x12
    mov ip, ip, lsl #0x1
    mov r4, r4, lsr #0x17
    add ip, ip, lr, lsr #0x1f
    cmp r4, ip
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr ip, _LIT2
    add r2, ip, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_02210104
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
