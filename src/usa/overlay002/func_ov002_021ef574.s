; func_ov002_021ef574 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_0202e2d4
        .global func_ov002_021ef574
        .arm
func_ov002_021ef574:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    cmp r2, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, pc}
    ldr r3, _LIT0
    and r1, r1, #0x1
    mov r0, #0x14
    mul r3, r1, r3
    mul ip, r2, r0
    ldr r1, _LIT1
    add r0, r1, r3
    add r0, r0, ip
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, _LIT2
    add r1, r1, r3
    ldrh r1, [ip, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_0202e2d4
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
