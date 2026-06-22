; func_ov002_022076a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0250
        .extern func_0202e234
        .extern func_ov002_0223de94
        .extern func_ov002_0223def4
        .global func_ov002_022076a0
        .arm
func_ov002_022076a0:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r2, [r0, #0x2]
    ldrh r1, [r5, #0x2]
    mov r2, r2, lsl #0x1f
    mov r0, r1, lsl #0x11
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r2, r2, #0x1
    eor r0, r0, r1, lsr #0x1f
    cmp r2, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x6]
    mov r4, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_c0
    ldr r6, _LIT0
.L_5c:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223de94
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xe
    bne .L_ac
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223def4
    mov r0, r0, lsl #0x2
    ldrh r0, [r6, r0]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
.L_ac:
    ldrh r0, [r5, #0x6]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x18
    cmp r4, r0, lsr #0x18
    blt .L_5c
.L_c0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d0250
