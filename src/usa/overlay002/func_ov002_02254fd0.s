; func_ov002_02254fd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c92ec
        .global func_ov002_02254fd0
        .arm
func_ov002_02254fd0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r6, r1, r0, r2
    add r5, r6, #0x30
    mov r4, #0x0
    mov r8, #0x1
.L_658:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r6, #0x38]
    cmpne r0, #0x0
    beq .L_6a0
    ldr r1, [r6, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_6a0
    mov r0, r7
    mov r1, r4
    mov r2, r8
    bl func_ov002_021c92ec
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_6a0:
    add r4, r4, #0x1
    cmp r4, #0x4
    add r5, r5, #0x14
    add r6, r6, #0x14
    ble .L_658
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
