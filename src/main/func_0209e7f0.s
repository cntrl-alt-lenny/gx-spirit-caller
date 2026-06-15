; func_0209e7f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02093a20
        .extern func_020945f4
        .extern func_0209d6f0
        .extern func_0209d724
        .extern func_0209dc8c
        .extern func_0209dca8
        .global func_0209e7f0
        .arm
func_0209e7f0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x48
    movs r5, r1
    mov r6, r0
    mov r4, r2
    beq .L_334
    add r0, sp, #0x0
    mov r1, #0x0
    mov r2, #0x44
    bl func_020945f4
    mov r3, #0x0
    ldr r1, _LIT0
    mov r7, #0x82
    mov r2, #0x19
    add r0, sp, #0x14
    strh r7, [sp]
    strh r3, [sp, #0x2]
    strh r2, [sp, #0x4]
    strh r6, [sp, #0x6]
    str r3, [sp, #0x8]
    str r3, [sp, #0xc]
    strh r3, [sp, #0x10]
    strh r1, [sp, #0x1a]
    str r4, [sp, #0x1c]
    strh r3, [sp, #0x12]
    bl func_02093a20
.L_334:
    bl OS_DisableIrq
    mov r8, r0
    bl func_0209dc8c
    movs r7, r0
    beq .L_360
    mov r0, r8
    bl OS_RestoreIrq
    add sp, sp, #0x48
    mov r0, r7
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_360:
    bl func_0209dca8
    add r0, r0, r6, lsl #0x2
    str r5, [r0, #0xcc]
    str r4, [r0, #0x10c]
    cmp r5, #0x0
    beq .L_390
    bl func_0209d6f0
    strh r0, [sp, #0x22]
    bl func_0209d724
    strh r0, [sp, #0x20]
    add r0, sp, #0x0
    blx r5
.L_390:
    mov r0, r8
    bl OS_RestoreIrq
    mov r0, #0x0
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word 0x0000ffff
