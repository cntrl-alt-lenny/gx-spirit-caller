; func_ov002_021d8750 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021d46ac
        .global func_ov002_021d8750
        .arm
func_ov002_021d8750:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r4, _LIT0
    ldr r2, _LIT1
    and r3, r0, #0x1
    mla r4, r3, r2, r4
    ldr r2, _LIT2
    mov r3, #0x0
    ldr ip, [r2, #0xce4]
    mov r2, r3
    add lr, r4, #0x30
    mov r5, #0x1
.L_2c:
    ldr r6, [lr]
    mov r6, r6, lsl #0x13
    movs r6, r6, lsr #0x13
    beq .L_58
    ldrh r6, [r4, #0x38]
    cmp r6, #0x0
    bne .L_58
    ldrh r6, [r4, #0x36]
    cmp r6, #0x0
    addne r3, r3, #0x1
    bne .L_60
.L_58:
    mvn r6, r5, lsl r2
    and r1, r1, r6
.L_60:
    add r2, r2, #0x1
    cmp r2, #0x5
    add lr, lr, #0x14
    add r4, r4, #0x14
    blt .L_2c
    cmp r3, #0x1
    ldmleia sp!, {r4, r5, r6, pc}
    cmp r0, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x49
    mov r3, ip, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, ip, lsl #0x10
    mov r4, r1, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r1, r2, lsr #0x10
    mov r2, r3, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r3, r4, lsr #0x10
    bl func_ov002_021d46ac
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d008c
