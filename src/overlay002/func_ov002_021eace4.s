; func_ov002_021eace4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b9000
        .global func_ov002_021eace4
        .arm
func_ov002_021eace4:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    and ip, r1, #0x1
    mul lr, ip, r3
    mov r0, #0x14
    mul ip, r2, r0
    ldr r3, _LIT1
    add r0, r3, lr
    add r0, r0, ip
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    cmp r2, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, pc}
    ldr r0, _LIT2
    add r0, r0, lr
    ldrh r0, [ip, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r0, r1
    mov r1, r2
    bl func_ov002_021b9000
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
