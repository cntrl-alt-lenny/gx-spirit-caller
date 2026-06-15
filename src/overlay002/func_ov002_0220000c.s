; func_ov002_0220000c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1ac
        .extern func_ov002_021bc8c8
        .global func_ov002_0220000c
        .arm
func_ov002_0220000c:
    stmdb sp!, {r3, lr}
    ldrh r1, [r0, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x2
    bne .L_6b0
    mov r0, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT0
    ldr ip, _LIT1
    and lr, r0, #0x1
    mov r2, r2, lsr #0x1b
    mov r3, #0x14
    mul r3, r2, r3
    mla r1, lr, r1, ip
    ldr r1, [r3, r1]
    mov r1, r1, lsr #0x5
    tst r1, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r1, r0
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
.L_6b0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
