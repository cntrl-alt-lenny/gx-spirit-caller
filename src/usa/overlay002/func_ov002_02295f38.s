; func_ov002_02295f38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021b3414
        .extern func_ov002_021b3538
        .global func_ov002_02295f38
        .arm
func_ov002_02295f38:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0x5
    bcc .L_44
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3538
    ldrh r1, [r4, #0x2]
    and r0, r0, #0xff
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_94
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_44:
    ldr r0, _LIT0
    ldr r0, [r0, #0x5d4]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r5, #0x0
.L_5c:
    ldrh r1, [r4, #0x2]
    mov r3, r5
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r0
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3414
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    add r5, r5, #0x1
    cmp r5, #0xa
    ble .L_5c
.L_94:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
