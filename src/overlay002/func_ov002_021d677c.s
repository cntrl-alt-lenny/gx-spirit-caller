; func_ov002_021d677c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021d479c
        .global func_ov002_021d677c
        .arm
func_ov002_021d677c:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    and ip, r0, #0x1
    mul lr, ip, r3
    mov r2, #0x14
    mul ip, r1, r2
    ldr r3, _LIT1
    add r2, r3, lr
    add r2, r2, ip
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    ldmeqia sp!, {r3, pc}
    cmp r0, #0x0
    ldr r0, _LIT2
    movne r2, #0x8000
    add r0, r0, lr
    ldrh r0, [ip, r0]
    moveq r2, #0x0
    mov r1, r1, lsl #0x10
    cmp r0, #0x0
    moveq r3, #0x1
    orr r0, r2, #0x35
    movne r3, #0x0
    mov r2, r3, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x4
    bl func_ov002_021d479c
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
