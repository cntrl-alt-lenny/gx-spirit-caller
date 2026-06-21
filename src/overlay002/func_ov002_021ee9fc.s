; func_ov002_021ee9fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b8fcc
        .global func_ov002_021ee9fc
        .arm
func_ov002_021ee9fc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, _LIT0
    and ip, r1, #0x1
    mul r5, ip, r4
    mov r3, #0x14
    mul r4, r2, r3
    ldr ip, _LIT1
    add r3, ip, r5
    add r3, r3, r4
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r2, #0x5
    bge .L_6c
    mov r0, r1
    mov r1, r2
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_6c:
    ldr r0, _LIT2
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    movne r0, #0x0
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
