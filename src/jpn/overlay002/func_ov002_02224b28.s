; func_ov002_02224b28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021d5918
        .extern func_ov002_022574ac
        .global func_ov002_02224b28
        .arm
func_ov002_02224b28:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0xd0]
    tst r2, #0x1
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r2, r2, lsr #0x1
    tst r2, #0x1
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_022574ac
    cmp r0, #0x2
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT1
    ldr r0, _LIT2
    ldr r1, [r2]
    ldr r3, _LIT3
    and ip, r1, #0x1
    mla r3, ip, r0, r3
    ldr r2, [r2, #0x1c]
    mov r0, #0x14
    mla r0, r2, r0, r3
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_c0
    mov r0, #0x8
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldrh r3, [r4, #0x2]
    mov r0, r4
    mov r4, r3, lsl #0x1f
    mov r3, r3, lsl #0x1a
    mov r4, r4, lsr #0x1f
    mov r3, r3, lsr #0x1b
    and r4, r4, #0xff
    and r3, r3, #0xff
    orr r3, r4, r3, lsl #0x8
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d5918
.L_c0:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd314
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf08c
