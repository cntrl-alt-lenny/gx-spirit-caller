; func_ov002_02214aa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021d6808
        .global func_ov002_02214aa0
        .arm
func_ov002_02214aa0:
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r3, [r0, #0x2]
    ldr r2, _LIT0
    mov ip, #0x14
    mov r1, r3, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r4, r1, #0x1
    mov r5, r3, lsl #0x1a
    mul r3, r4, r2
    mov r2, r5, lsr #0x1b
    ldr r4, _LIT1
    ldrh lr, [r0, #0x4]
    add r4, r4, r3
    mul ip, r2, ip
    add r4, r4, #0x30
    mov r5, lr, lsl #0x11
    ldr r4, [r4, ip]
    mov r5, r5, lsr #0x17
    mov lr, r4, lsl #0x2
    mov lr, lr, lsr #0x18
    mov r4, r4, lsl #0x12
    mov lr, lr, lsl #0x1
    add r4, lr, r4, lsr #0x1f
    cmp r5, r4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr lr, _LIT2
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov ip, #0x1
    mov r3, #0x0
    str ip, [sp]
    bl func_ov002_021d6808
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
