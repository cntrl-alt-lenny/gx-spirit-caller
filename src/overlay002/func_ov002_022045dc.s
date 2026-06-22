; func_ov002_022045dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern func_0202e2f8
        .extern func_0203058c
        .global func_ov002_022045dc
        .arm
func_ov002_022045dc:
    stmdb sp!, {r4, lr}
    ldrh r2, [r0, #0x2]
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x12
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r3, [r1]
    rsb r0, r0, #0x1
    cmp r3, r0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT1
    ldr r2, _LIT2
    and r3, r3, #0x1
    mla r2, r3, r0, r2
    ldr r1, [r1, #0x1c]
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r4, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_0203058c
    cmp r0, #0x0
    bne .L_d4
    mov r0, r4
    bl func_0202e2f8
    cmp r0, #0x0
    bne .L_d4
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r3, [r1]
    ldr r2, _LIT2
    and r3, r3, #0x1
    mla r2, r3, r0, r2
    ldr r1, [r1, #0x1c]
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_d4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
