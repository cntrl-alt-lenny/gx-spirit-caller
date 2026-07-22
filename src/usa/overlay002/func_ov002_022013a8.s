; func_ov002_022013a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202e1e0
        .extern IsValue12D3Or147E
        .global func_ov002_022013a8
        .arm
func_ov002_022013a8:
    stmdb sp!, {r4, lr}
    movs r4, r1
    beq .L_60
    ldrh r0, [r4]
    bl func_0202e1e0
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    movhi r0, #0x0
    ldmhiia sp!, {r4, pc}
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4]
    bl IsValue12D3Or147E
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_60:
    ldrh r1, [r0, #0x2]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x1f
    cmpne r1, #0x20
    cmpne r1, #0x21
    bne .L_bc
    ldr r3, [r0, #0x14]
    ldr r0, _LIT0
    mov r1, r3, lsl #0x16
    mov r2, r1, lsr #0x1f
    ldr r1, _LIT1
    and ip, r2, #0x1
    mla r2, ip, r0, r1
    mov r0, r3, lsl #0x12
    mov r1, r0, lsr #0x1c
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_bc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
