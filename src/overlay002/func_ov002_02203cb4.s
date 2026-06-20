; func_ov002_02203cb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd420
        .extern data_ov002_022d016c
        .extern func_ov002_021c1e44
        .global func_ov002_02203cb4
        .arm
func_ov002_02203cb4:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldrh r2, [r0, #0x2]
    ldr r1, [r1, #0xcec]
    ldr ip, _LIT1
    rsb lr, r1, #0x1
    mov r1, #0x38
    mov r3, r2, lsl #0x14
    mov r3, r3, lsr #0x1a
    mla ip, lr, r1, ip
    cmp r3, #0xd
    moveq r1, r2, lsl #0x1f
    cmpeq lr, r1, lsr #0x1f
    bne .L_70
    ldr r1, [ip, #0x8]
    cmp r1, #0x0
    beq .L_70
    ldrh r2, [r0, #0x14]
    ldrh r1, [r0, #0x16]
    cmp r2, r1
    bcs .L_70
    ldr r2, _LIT2
    ldr r1, [r2]
    ldr r2, [r2, #0x1c]
    bl func_ov002_021c1e44
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
.L_70:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd420
_LIT2: .word data_ov002_022cd3f4
