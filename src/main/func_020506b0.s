; func_020506b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02101598
        .extern func_020498f0
        .extern func_0206504c
        .extern func_0206627c
        .extern func_020a7440
        .global func_020506b0
        .arm
func_020506b0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    ldr r0, [sp, #0x18]
    mov r5, r1
    mov r6, r2
    mov r4, r3
    cmp r0, #0x0
    beq .L_598
    cmp r4, #0x0
    bne .L_5a4
.L_598:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_5a4:
    add r1, sp, #0x0
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    mov r1, r6, asr #0x8
    mov r0, r6, lsl #0x8
    mov r2, #0x2
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    strb r2, [sp, #0x1]
    strh r0, [sp, #0x2]
    str r5, [sp, #0x4]
    ldrb r5, [r4]
    cmp r5, #0xfe
    bne .L_5f0
    ldrb r0, [r4, #0x1]
    cmp r0, #0xfd
    beq .L_5f8
.L_5f0:
    cmp r5, #0x5c
    bne .L_624
.L_5f8:
    bl func_020498f0
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    beq .L_664
    bl func_020498f0
    ldr r0, [r0, #0x10]
    ldr r2, [sp, #0x18]
    add r3, sp, #0x0
    mov r1, r4
    bl func_0206627c
    b .L_664
.L_624:
    ldr r1, _LIT0
    mov r0, r4
    mov r2, #0x6
    bl func_020a7440
    cmp r0, #0x0
    bne .L_650
    ldr r1, [sp, #0x18]
    add r2, sp, #0x0
    mov r0, r4
    bl func_0206504c
    b .L_664
.L_650:
    cmp r5, #0xfe
    moveq r0, #0x0
    add sp, sp, #0x8
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_664:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02101598
