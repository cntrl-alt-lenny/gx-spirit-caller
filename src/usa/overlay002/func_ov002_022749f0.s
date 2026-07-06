; func_ov002_022749f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022ce1a8
        .extern func_ov002_021b9dec
        .extern func_ov002_021bc1a8
        .extern func_ov002_021bc538
        .extern func_ov002_021bd630
        .global func_ov002_022749f0
        .arm
func_ov002_022749f0:
    stmdb sp!, {r4, r5, r6, lr}
    add r5, r1, r2
    mov r6, r0
    cmp r5, #0xa
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    ldr r1, [r1]
    mov r1, r1, lsl #0x1f
    cmp r6, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r1, r5
    bl func_ov002_021b9dec
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    bl func_ov002_021bd630
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldrb r1, [r0, #0x8]
    cmp r1, #0x0
    bne .L_e08
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    bne .L_e08
    mov r0, r6
    mov r1, r5
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_e08:
    ldr r1, _LIT1
    mov r2, #0x0
    ldr r3, [r1, #0x6a4]
    cmp r3, #0x0
    ble .L_e3c
.L_e1c:
    add r0, r1, r2, lsl #0x2
    ldr r0, [r0, #0x6b4]
    cmp r4, r0
    moveq r0, #0x800
    ldmeqia sp!, {r4, r5, r6, pc}
    add r2, r2, #0x1
    cmp r2, r3
    blt .L_e1c
.L_e3c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022ce1a8
