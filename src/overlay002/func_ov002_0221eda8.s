; func_ov002_0221eda8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_02210104
        .extern func_ov002_02257b48
        .global func_ov002_0221eda8
        .arm
func_ov002_0221eda8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh ip, [r5, #0x2]
    ldr r2, _LIT0
    ldrh r4, [r5, #0x4]
    mov r3, ip, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mov lr, ip, lsl #0x1a
    mul r2, r3, r2
    ldr ip, _LIT1
    mov lr, lr, lsr #0x1b
    mov r3, #0x14
    mul r3, lr, r3
    add ip, ip, r2
    add ip, ip, #0x30
    mov lr, r4, lsl #0x11
    ldr ip, [ip, r3]
    mov lr, lr, lsr #0x17
    mov r4, ip, lsl #0x2
    mov r4, r4, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r4, r4, lsl #0x1
    add ip, r4, ip, lsr #0x1f
    cmp lr, ip
    mov r4, r1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr ip, _LIT2
    add r2, ip, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_02257b48
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_02210104
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
