; func_ov002_02287be4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_02267d0c
        .global func_ov002_02287be4
        .arm
func_ov002_02287be4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldr r0, _LIT0
    ldrh r1, [r7, #0x2]
    ldr r2, [r0, #0xcec]
    mov r0, r1, lsl #0x1f
    cmp r2, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r5, #0x0
    ldr r4, _LIT1
    ldr r8, _LIT2
    mov r6, r5
.L_34:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    mla r1, r0, r8, r4
    add r1, r1, r6
    ldr r0, [r1, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_7c
    ldr r1, [r1, #0x40]
    mov r1, r1, lsr #0x6
    tst r1, #0x1
    bne .L_7c
    bl func_ov002_02267d0c
    cmp r0, #0x0
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
.L_7c:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r6, r6, #0x14
    ble .L_34
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
