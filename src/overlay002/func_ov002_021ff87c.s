; func_ov002_021ff87c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_ov002_021bc8c8
        .extern func_ov002_022577dc
        .global func_ov002_021ff87c
        .arm
func_ov002_021ff87c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r3, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r3, lsl #0x1f
    ldr r2, [r1, #0xcec]
    mov r0, r0, lsr #0x1f
    cmp r0, r2
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r1, #0xcf8]
    cmp r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r2, r3, lsl #0x1a
    ldr r1, _LIT1
    ldr ip, _LIT2
    and lr, r0, #0x1
    mov r2, r2, lsr #0x1b
    mov r3, #0x14
    mul r3, r2, r3
    mla r1, lr, r1, ip
    ldrh r1, [r3, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r1, r0
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_022577dc
    cmp r0, #0x2
    movge r0, #0x2
    movlt r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
