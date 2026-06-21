; func_ov002_02201564 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021bcd80
        .global func_ov002_02201564
        .arm
func_ov002_02201564:
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x1f
    cmpne r1, #0x20
    cmpne r1, #0x21
    bne .L_16c
    ldr lr, [r0, #0x14]
    ldr r1, _LIT0
    mov r2, lr, lsl #0x16
    mov ip, r2, lsr #0x1f
    ldr r2, _LIT1
    and r3, ip, #0x1
    mla r2, r3, r1, r2
    mov r1, lr, lsl #0x12
    mov r3, r1, lsr #0x1c
    mov r1, #0x14
    mla r1, r3, r1, r2
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r2, [r0, #0x2]
    and r1, ip, #0xff
    and r0, r3, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r0, lsl #0x10
    mov r2, r2, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x10
    bl func_ov002_021bcd80
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
.L_16c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
