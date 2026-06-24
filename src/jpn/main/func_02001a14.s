; func_02001a14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_020b45ec
        .extern data_020c3d44
        .extern data_020c3d54
        .extern data_02102b9c
        .extern data_02102c24
        .extern func_02001b84
        .extern func_02006bf0
        .extern func_02091554
        .extern func_0209445c
        .extern func_02098294
        .global func_02001a14
        .arm
func_02001a14:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x68
    mov sl, r0
    bl func_02001b84
    ldr r6, _LIT0
    ldr r5, _LIT1
    ldr r4, _LIT2
    mov r9, #0x0
    add r8, sp, #0x20
    add r7, sp, #0x0
    mov fp, #0x4
.L_2c:
    mov r0, sl, asr r9
    tst r0, #0x1
    beq .L_64
    mov r0, r8
    bl func_02098294
    ldr r2, [r5, r9, lsl #0x3]
    mov r0, r7
    mov r1, r6
    bl func_02091554
    mov r0, r7
    mov r1, fp
    mov r2, #0x2
    bl func_02006bf0
    str r0, [r4, r9, lsl #0x3]
.L_64:
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_2c
    ldr r0, _LIT3
    ldr r0, [r0, #0xb4]
    cmp r0, #0x0
    addne sp, sp, #0x68
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x1000
    mov r1, #0x4
    mov r2, #0x2
    bl Task_PostLocked
    ldr r2, _LIT3
    mov r1, #0x4
    str r0, [r2, #0xb4]
    ldr r0, _LIT4
    mov r2, #0x2
    bl func_02006bf0
    ldr r1, _LIT3
    mov r4, r0
    ldr r1, [r1, #0xb4]
    mov r2, #0x1000
    bl func_0209445c
    mov r0, r4
    bl Task_InvokeLocked
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020c3d44
_LIT1: .word data_020b45ec
_LIT2: .word data_02102c24
_LIT3: .word data_02102b9c
_LIT4: .word data_020c3d54
