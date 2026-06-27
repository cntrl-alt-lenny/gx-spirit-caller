; func_ov002_021bc47c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021bc1a8
        .global func_ov002_021bc47c
        .arm
func_ov002_021bc47c:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r3, _LIT1
    and ip, r0, #0x1
    mla r3, ip, r2, r3
    mov r2, #0x14
    mla r2, r1, r2, r3
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r2, _LIT2
    ldr r2, [r2, #0xd0]
    tst r2, #0x1
    beq .L_36c
    ldr r2, _LIT3
    ldr r3, [r2]
    cmp r0, r3
    ldreq r3, [r2, #0x1c]
    cmpeq r1, r3
    bne .L_340
    ldr r2, [r2, #0xc4]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
.L_340:
    ldr r2, _LIT3
    ldr r3, [r2, #0x4]
    cmp r0, r3
    ldreq r3, [r2, #0x20]
    cmpeq r1, r3
    bne .L_36c
    ldr r2, [r2, #0xd8]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
.L_36c:
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022cd314
