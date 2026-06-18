; func_ov002_022817f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b8fcc
        .extern func_ov002_022815a4
        .global func_ov002_022817f4
        .arm
func_ov002_022817f4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r8, #0x1
    mla r7, r1, r0, r2
    mov r5, #0x0
    mov r4, r5
    add r6, r7, #0x30
    mov r9, #0x1
.L_28:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_8c
    cmp r4, #0x5
    bge .L_54
    mov r0, r8
    mov r1, r4
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    beq .L_8c
.L_54:
    ldrh r0, [r7, #0x38]
    cmp r0, #0x0
    bne .L_70
    ldr r0, [r7, #0x40]
    mov r0, r0, lsr #0x8
    tst r0, #0x1
    beq .L_8c
.L_70:
    ldr r0, [r6]
    mov r1, r9
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_022815a4
    cmp r0, #0x0
    addne r5, r5, #0x1
.L_8c:
    add r4, r4, #0x1
    cmp r4, #0xa
    add r6, r6, #0x14
    add r7, r7, #0x14
    ble .L_28
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
