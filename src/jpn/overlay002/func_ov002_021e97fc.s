; func_ov002_021e97fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c194c
        .extern func_ov002_021c1e10
        .extern func_ov002_021c1fa4
        .global func_ov002_021e97fc
        .arm
func_ov002_021e97fc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r6, r0
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr r3, _LIT0
    ldr ip, _LIT1
    and lr, r5, #0x1
    mla ip, lr, r3, ip
    mov r3, #0x14
    mla r3, r4, r3, ip
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    bne .L_88
    ldrh r2, [r6]
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c194c
    cmp r0, #0x0
    bne .L_a8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_88:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, #0x1
    bl func_ov002_021c1fa4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_a8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
