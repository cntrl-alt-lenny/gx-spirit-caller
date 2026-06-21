; func_ov002_02228418 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021de5d4
        .global func_ov002_02228418
        .arm
func_ov002_02228418:
    stmdb sp!, {r4, lr}
    ldrh r2, [r0, #0x2]
    ldrh ip, [r0, #0x4]
    ldr r1, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mov lr, r2, lsl #0x1a
    mul r2, r3, r1
    ldr r4, _LIT1
    mov r1, lr, lsr #0x1b
    mov r3, #0x14
    add r4, r4, r2
    mul r3, r1, r3
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
    mov r2, #0x0
    bl func_ov002_021de5d4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
