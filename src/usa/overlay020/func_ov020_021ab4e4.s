; func_ov020_021ab4e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021adfc8
        .extern func_0207e550
        .extern func_ov020_021aa810
        .global func_ov020_021ab4e4
        .arm
func_ov020_021ab4e4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    movs sl, r0
    mov r6, #0x0
    mov r9, r1
    mov fp, r2
    ldr r5, _LIT0
    movmi sl, r6
    bmi .L_150
    cmp sl, #0xa
    movge sl, #0x9
.L_150:
    cmp sl, #0x0
    mov r7, #0x0
    blt .L_250
    ldr r0, _LIT1
    mov r8, r7
    sub r4, r0, #0x10000
.L_168:
    add r0, r5, r7, lsl #0x1
    add r0, r0, #0xa00
    ldrh r1, [r0, #0x38]
    ldr r0, _LIT1
    cmp r1, r0
    beq .L_190
    add r0, r5, r7, lsl #0x3
    add r0, r0, r1, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xe8]
.L_190:
    cmp r0, #0x1
    ldr r0, _LIT2
    smull r1, r2, r0, r8
    mov r0, r8, lsr #0x1f
    add r2, r0, r2, asr #0x2
    mov r0, #0x6c
    mul r0, r2, r0
    add r0, r0, #0x48
    mov r0, r0, lsl #0xc
    ldr r1, _LIT2
    str r0, [sp, #0x8]
    smull r2, r0, r1, r7
    mov r1, r7, lsr #0x1f
    add r0, r1, r0, asr #0x1
    mov r1, #0x5
    smull r0, r2, r1, r0
    sub r0, r7, r0
    mov r1, #0x1c
    mul r1, r0, r1
    add r0, r1, #0x24
    mov r0, r0, lsl #0xc
    str r0, [sp, #0xc]
    ldr r0, [r5, #0x924]
    bgt .L_200
    mov r1, #0x2
    bl func_0207e550
    mov r2, r0
    b .L_224
.L_200:
    mov r1, #0x3
    bl func_0207e550
    mov r2, r0
    ldr r1, [sp, #0x8]
    ldr r0, [sp, #0xc]
    add r1, r1, #0x1000
    add r0, r0, #0x1000
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
.L_224:
    mov r0, #0x0
    stmia sp, {r0, r4}
    mov r0, r9
    mov r1, fp
    add r3, sp, #0x8
    bl func_ov020_021aa810
    add r7, r7, #0x1
    add r6, r6, r0
    add r8, r8, #0x2
    cmp r7, sl
    ble .L_168
.L_250:
    mov r0, r6
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov020_021adfc8
_LIT1: .word 0x0000ffff
_LIT2: .word 0x66666667
