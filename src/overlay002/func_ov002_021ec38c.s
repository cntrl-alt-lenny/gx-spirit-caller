; func_ov002_021ec38c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b4054
        .global func_ov002_021ec38c
        .arm
func_ov002_021ec38c:
    stmdb sp!, {r4, lr}
    mov r3, r0
    cmp r2, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    ldr ip, _LIT0
    and lr, r1, #0x1
    mul r4, lr, ip
    mov r0, #0x14
    mul lr, r2, r0
    ldr ip, _LIT1
    add r0, ip, r4
    add r0, r0, lr
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT2
    add r0, r0, r4
    ldrh r0, [lr, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r1
    mov r1, r2
    ldrh r2, [r3]
    mov r3, #0x4
    bl func_ov002_021b4054
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
