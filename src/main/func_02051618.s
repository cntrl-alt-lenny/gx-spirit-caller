; func_02051618 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_02049d70
        .extern func_02049e84
        .extern func_02049f38
        .extern func_02049f60
        .extern func_02049f6c
        .extern func_02049f74
        .extern func_0204a01c
        .extern func_0204a020
        .extern func_0204a024
        .extern func_0204aa0c
        .extern func_02062510
        .extern func_02062528
        .extern func_020673dc
        .extern func_0206763c
        .extern func_02067654
        .extern func_0206766c
        .extern func_02067684
        .global func_02051618
        .arm
func_02051618:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov r4, r0
    bl func_020498f0
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    addne sp, sp, #0x2c
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_020498f0
    str r4, [r0, #0x200]
    mov sl, #0x0
    ldr fp, _LIT0
    mov r4, sl
    mov r5, #0x1
.L_1514:
    bl func_020498f0
    mov r9, r0
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062510
    mov r8, r0
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062528
    mov r7, r0
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldr r3, [r0, #0x2f8]
    mov r1, r8
    str r3, [sp]
    str r5, [sp, #0x4]
    str r5, [sp, #0x8]
    ldr r3, _LIT1
    str fp, [sp, #0xc]
    str r3, [sp, #0x10]
    ldr r3, _LIT2
    mov r2, r7
    str r3, [sp, #0x14]
    ldr r3, _LIT3
    add r0, r9, #0x10
    str r3, [sp, #0x18]
    ldr r3, _LIT4
    str r3, [sp, #0x1c]
    ldr r3, _LIT5
    str r3, [sp, #0x20]
    str r4, [sp, #0x24]
    ldr r3, [r6, #0x2f4]
    bl func_02067684
    movs r6, r0
    beq .L_15dc
    cmp r6, #0x3
    bne .L_15bc
    cmp sl, #0x4
    bne .L_15d0
.L_15bc:
    mov r0, r6
    bl func_0204aa0c
    add sp, sp, #0x2c
    mov r0, r6
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_15d0:
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_1514
.L_15dc:
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1c]
    bl func_020498f0
    mov r1, #0x0
    strh r1, [r0, #0x1a]
    bl func_020498f0
    ldr r0, [r0, #0x10]
    ldr r1, _LIT6
    bl func_0206763c
    bl func_020498f0
    ldr r0, [r0, #0x10]
    ldr r1, _LIT7
    bl func_0206766c
    bl func_020498f0
    ldr r0, [r0, #0x10]
    ldr r1, _LIT8
    bl func_02067654
    bl func_020498f0
    ldr r0, [r0, #0x10]
    bl func_020673dc
    mov r0, r6
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word func_0204a024
_LIT1: .word func_0204a020
_LIT2: .word func_0204a01c
_LIT3: .word func_02049f74
_LIT4: .word func_02049f6c
_LIT5: .word func_02049f60
_LIT6: .word func_02049f38
_LIT7: .word func_02049e84
_LIT8: .word func_02049d70
