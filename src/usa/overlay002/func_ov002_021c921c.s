; func_ov002_021c921c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_ov002_021b9dec
        .extern func_ov002_021c8d58
        .global func_ov002_021c921c
        .arm
func_ov002_021c921c:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    add r2, sp, #0x0
    mov r6, r0
    mov r5, r1
    bl func_ov002_021c8d58
    ldr r1, [sp]
    mov r4, r0
    cmp r1, #0x0
    bne .L_b0
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9dec
    ldr r1, _LIT0
    cmp r0, r1
    addne r1, r1, #0x128
    cmpne r0, r1
    bne .L_b0
    ldr r1, _LIT1
    and r2, r6, #0x1
    mov r0, #0x14
    mul ip, r2, r1
    ldr r2, _LIT2
    ldr r1, _LIT3
    mul lr, r5, r0
    add r0, r2, ip
    ldr r3, [lr, r0]
    add r2, r1, ip
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    and r0, r0, #0x1
    ldrh r2, [lr, r2]
    mvn r1, r1
    mvn r0, r0
    and r1, r2, r1
    tst r1, r0
    beq .L_b0
    mov r0, #0x1
    mov r0, r0, lsl r4
    add sp, sp, #0x4
    orr r0, r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_b0:
    mov r0, #0x1
    mov r0, r0, lsl r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x000018c7
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf0cc
_LIT3: .word data_ov002_022cf0c4
