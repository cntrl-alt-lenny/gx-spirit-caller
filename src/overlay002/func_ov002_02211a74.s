; func_ov002_02211a74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021d59cc
        .global func_ov002_02211a74
        .arm
func_ov002_02211a74:
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r4, [r0, #0x2]
    ldr r1, _LIT0
    ldrh lr, [r0, #0x4]
    mov r2, r4, lsl #0x1f
    mov ip, r2, lsr #0x1f
    and r3, ip, #0x1
    mov r5, r4, lsl #0x1a
    mul r2, r3, r1
    mov r1, r5, lsr #0x1b
    mov r3, #0x14
    ldr r4, _LIT1
    mov r5, lr, lsl #0x11
    add r4, r4, r2
    mul r3, r1, r3
    add r4, r4, #0x30
    ldr r4, [r4, r3]
    mov r5, r5, lsr #0x17
    mov lr, r4, lsl #0x2
    mov lr, lr, lsr #0x18
    mov r4, r4, lsl #0x12
    mov lr, lr, lsl #0x1
    add r4, lr, r4, lsr #0x1f
    cmp r5, r4
    mov r4, #0x0
    movne r0, r4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr lr, _LIT2
    add r2, lr, r2
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, r4
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r0]
    ldr r3, _LIT3
    cmp r2, r3
    ldreqh r4, [r0, #0x8]
    mov r3, #0x2
    mov r0, r4, lsl #0x10
    mov lr, r0, lsr #0x10
    mov r0, ip
    str lr, [sp]
    bl func_ov002_021d59cc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x000019a5
