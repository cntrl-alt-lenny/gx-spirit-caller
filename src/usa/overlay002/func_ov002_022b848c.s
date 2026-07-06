; func_ov002_022b848c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccbcc
        .extern data_ov002_022d1330
        .extern data_ov002_022d1830
        .extern func_0202160c
        .extern func_02021668
        .extern func_0202582c
        .global func_ov002_022b848c
        .arm
func_ov002_022b848c:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r4, r0
    ldrh r3, [r1, #0x90]
    ldr r5, _LIT1
    mov r0, r3, lsl #0x1a
    mov r2, r0, lsr #0x1b
    strh r3, [sp]
    cmp r2, #0xb
    bne .L_64
    mov r0, r3, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, #0xcc
    mla r0, r1, r0, r5
    ldr r0, [r0, #0x488]
    mov r2, r3, lsl #0x12
    ldr r1, _LIT2
    rsb r3, r0, r2, lsr #0x18
    smull r0, r6, r1, r3
    add r6, r6, r3, lsr #0x1f
    mov r2, #0x3
    smull r0, r1, r2, r6
    sub r6, r3, r0
    b .L_74
.L_64:
    mov r0, #0x6
    mul r1, r2, r0
    ldr r0, _LIT3
    ldrsh r6, [r0, r1]
.L_74:
    ldr r0, [r4]
    add r2, r6, #0x2e
    mov r1, #0x3
    bl func_0202160c
    mov r5, r0
    ldr r0, [r4]
    add r2, r6, #0x2e
    mov r1, #0x3
    bl func_0202160c
    bl func_0202582c
    cmp r0, #0x0
    bne .L_b8
    mov r0, r5
    mov r1, #0x0
    bl func_02021668
    tst r0, #0x100
    beq .L_c4
.L_b8:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_c4:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022d1830
_LIT1: .word data_ov002_022d1330
_LIT2: .word 0x55555556
_LIT3: .word data_ov002_022ccbcc
