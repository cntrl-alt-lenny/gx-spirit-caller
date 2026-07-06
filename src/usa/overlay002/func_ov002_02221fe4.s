; func_ov002_02221fe4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021de820
        .extern func_ov002_0220e66c
        .extern func_ov002_02257564
        .extern func_ov002_022576f4
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .global func_ov002_02221fe4
        .arm
func_ov002_02221fe4:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7e
    beq .L_ac
    cmp r2, #0x7f
    beq .L_6c
    cmp r2, #0x80
    bne .L_c0
    bl func_ov002_022576f4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x6e
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_6c:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_a4
    ldr r1, _LIT2
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_021de820
    cmp r0, #0x0
    movne r0, #0x7e
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_a4:
    mov r0, #0x80
    ldmia sp!, {r4, pc}
.L_ac:
    mov r2, #0x1
    strh r2, [r4, #0xa]
    bl func_ov002_0220e66c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_c0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word func_ov002_02257564
_LIT2: .word data_ov002_022d008c
