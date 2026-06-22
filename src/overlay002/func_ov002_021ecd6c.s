; func_ov002_021ecd6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_0202b878
        .global func_ov002_021ecd6c
        .arm
func_ov002_021ecd6c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    cmp r2, #0x5
    blt .L_18
    cmp r2, #0xa
    ble .L_20
.L_18:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_20:
    ldr r3, _LIT0
    and r1, r1, #0x1
    mov r0, #0x14
    mul r5, r1, r3
    mul r4, r2, r0
    ldr r1, _LIT1
    add r0, r1, r5
    add r0, r0, r4
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT2
    add r1, r1, r5
    ldrh r1, [r4, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_0202b878
    cmp r0, #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT1
    ldrh r0, [r6, #0x4]
    add r1, r1, r5
    add r1, r1, #0x30
    ldr r1, [r1, r4]
    mov r2, r0, lsl #0x11
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsr #0x17
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
