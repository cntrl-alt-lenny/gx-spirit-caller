; func_020a5e90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern WaitByLoop
        .extern func_020908f0
        .extern func_02090990
        .global func_020a5e90
        .arm
func_020a5e90:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    ldr r5, _LIT0
    mov r4, #0x1
.L_18:
    bl OS_DisableIrq
    str r0, [r6, #0x4]
    mov r0, r5
    bl func_020908f0
    and r0, r0, #0x40
    str r0, [r6]
    ldr r0, [r6]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, lr}
    bxne lr
    mov r0, r7
    bl func_02090990
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldr r0, [r6, #0x4]
    bl OS_RestoreIrq
    mov r0, r4
    bl WaitByLoop
    b .L_18
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word 0x027fffe8
