; func_ov004_021cdd38 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02102c90
        .extern func_02001d0c
        .extern func_02004f58
        .extern func_020054a4
        .extern func_0208fd90
        .extern func_02092904
        .extern func_02094504
        .global func_ov004_021cdd38
        .arm
func_ov004_021cdd38:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r6, r0
    mov r5, r1
    mov r0, #0x400
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov fp, r0
    mov r1, fp
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    ldr r0, _LIT0
    mov r1, #0x10
    mov r2, #0x2
    bl func_02001d0c
    mov r0, r5
    mov r1, #0xc
    bl func_020054a4
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsbs r3, r0, #0x40
    mov r4, #0x1
    str r4, [sp]
    mov r4, #0xc
    ldr r0, _LIT0
    movmi r3, #0x0
    mov r1, r5
    mov r2, fp
    str r4, [sp, #0x4]
    bl func_02004f58
    mov r0, fp
    mov r1, #0x400
    bl func_02092904
    mov r0, r6, lsl #0xb
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r7, r0, #0x400
    mov r5, #0x80
    mov r8, fp
    mov sl, r7
    mov r6, #0x0
    mov r9, #0x1
    mov r4, r5
.L_b4:
    mov r0, r8
    mov r1, r7
    mov r2, r5
    bl func_0208fd90
    mov r2, r4
    add r0, r8, #0x200
    add r1, sl, r9, lsl #0x7
    bl func_0208fd90
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x100
    add r8, r8, #0x80
    add r9, r9, #0x2
    blt .L_b4
    mov r0, fp
    bl Task_InvokeLocked
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102c90
