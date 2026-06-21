; func_ov002_021f103c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1ef0
        .global func_ov002_021f103c
        .arm
func_ov002_021f103c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldrh r3, [r0, #0x2]
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    cmp r3, r5
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r3, _LIT0
    mov ip, #0x14
    ldr lr, _LIT1
    and r6, r5, #0x1
    mul ip, r4, ip
    mla r3, r6, r3, lr
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    ldr r1, [r0, #0x4]
    cmp r1, r5
    ldreq r0, [r0, #0x20]
    cmpeq r0, r4
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
_LIT2: .word data_ov002_022cd3f4
