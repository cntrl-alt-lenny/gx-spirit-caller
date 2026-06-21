; func_ov002_021ebddc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202e2f8
        .extern func_ov002_021b3ecc
        .extern func_ov002_021c1ef0
        .global func_ov002_021ebddc
        .arm
func_ov002_021ebddc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r1
    ldr r3, _LIT0
    ldr r4, _LIT1
    and ip, r5, #0x1
    mla r6, ip, r3, r4
    mov r4, r2
    mov r3, #0x14
    mla r3, r4, r3, r6
    ldr r3, [r3, #0x30]
    mov r6, r0
    mov r3, r3, lsl #0x13
    mov r7, r3, lsr #0x13
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r7, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    bl func_0202e2f8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r2, [r6]
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
