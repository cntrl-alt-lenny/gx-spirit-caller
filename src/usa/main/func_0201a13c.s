; func_0201a13c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b58f8
        .extern data_020b5904
        .extern data_020b5910
        .extern data_020b591c
        .extern data_020b5928
        .extern data_020b5934
        .extern data_02104e6c
        .extern data_021058ec
        .global func_0201a13c
        .arm
func_0201a13c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x48
    mov r4, r0
    bl GetSystemWork
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xa64]
    mov r2, r4, lsl #0x3
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    sub r0, r0, #0x1
    cmp r0, r4
    ldrh r3, [r1, r2]
    beq .L_9c
    cmp r4, #0xf
    addls pc, pc, r4, lsl #0x2
    b .L_9c
    b .L_9c
    b .L_9c
    b .L_9c
    b .L_9c
    b .L_84
    b .L_90
    b .L_90
    b .L_9c
    b .L_84
    b .L_9c
    b .L_84
    b .L_84
    b .L_9c
    b .L_9c
    b .L_84
    b .L_84
.L_84:
    add sp, sp, #0x48
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_90:
    add sp, sp, #0x48
    mov r0, #0x1000
    ldmia sp!, {r4, pc}
.L_9c:
    cmp r4, #0xf
    addls pc, pc, r4, lsl #0x2
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_190
    b .L_e8
    b .L_104
    b .L_104
    b .L_190
    b .L_120
    b .L_190
    b .L_13c
    b .L_174
    b .L_190
    b .L_190
    b .L_158
    b .L_158
.L_e8:
    ldr r0, _LIT2
    add r4, sp, #0x3c
    ldmia r0, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    add sp, sp, #0x48
    ldr r0, [r4, r3, lsl #0x2]
    ldmia sp!, {r4, pc}
.L_104:
    ldr r0, _LIT3
    add r4, sp, #0x30
    ldmia r0, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    add sp, sp, #0x48
    ldr r0, [r4, r3, lsl #0x2]
    ldmia sp!, {r4, pc}
.L_120:
    ldr r0, _LIT4
    add r4, sp, #0x24
    ldmia r0, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    add sp, sp, #0x48
    ldr r0, [r4, r3, lsl #0x2]
    ldmia sp!, {r4, pc}
.L_13c:
    ldr r0, _LIT5
    add r4, sp, #0x18
    ldmia r0, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    add sp, sp, #0x48
    ldr r0, [r4, r3, lsl #0x2]
    ldmia sp!, {r4, pc}
.L_158:
    ldr r0, _LIT6
    add r4, sp, #0xc
    ldmia r0, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    add sp, sp, #0x48
    ldr r0, [r4, r3, lsl #0x2]
    ldmia sp!, {r4, pc}
.L_174:
    ldr r0, _LIT7
    add r4, sp, #0x0
    ldmia r0, {r0, r1, r2}
    stmia r4, {r0, r1, r2}
    add sp, sp, #0x48
    ldr r0, [r4, r3, lsl #0x2]
    ldmia sp!, {r4, pc}
.L_190:
    mov r0, #0x0
    add sp, sp, #0x48
    ldmia sp!, {r4, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_021058ec
_LIT2: .word data_020b58f8
_LIT3: .word data_020b5904
_LIT4: .word data_020b5910
_LIT5: .word data_020b591c
_LIT6: .word data_020b5928
_LIT7: .word data_020b5934
