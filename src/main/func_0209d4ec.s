; func_0209d4ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_0209d5e4
        .global func_0209d4ec
        .arm
func_0209d4ec:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    ldrh r1, [r1]
    cmp r1, #0x0
    ldreq r1, _LIT1
    ldrne r1, _LIT2
    ldr r1, [r1]
    str r1, [sp]
    ldr r1, [sp]
    cmp r0, r1
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, lr}
    bxeq lr
    bl OS_DisableIrq
    mov r4, r0
    mov r0, #0xe
    mov r1, #0x11
    mov r2, #0x0
    bl func_0209d5e4
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x8
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x027ffc10
_LIT1: .word 0x027ff800
_LIT2: .word 0x027ffc00
