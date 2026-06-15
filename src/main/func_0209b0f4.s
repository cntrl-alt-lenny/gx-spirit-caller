; func_0209b0f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83e4
        .extern data_021a840c
        .extern data_021a8410
        .extern func_0209adb4
        .extern func_0209b4e4
        .global func_0209b0f4
        .arm
func_0209b0f4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0209b4e4
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr ip, _LIT0
    ldr r1, _LIT1
    ldr r0, _LIT2
    and r2, r7, #0xff
    mov lr, r7, lsl #0x3
    mov r8, #0x0
    ldr r3, _LIT3
    strh r8, [ip, lr]
    orr r0, r2, r0
    str r5, [r1, #0x4]
    str r4, [r1, #0x8]
    str r6, [r3, r7, lsl #0x3]
    bl func_0209adb4
    mov r0, r8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a840c
_LIT1: .word data_021a83e4
_LIT2: .word 0x03006500
_LIT3: .word data_021a8410
