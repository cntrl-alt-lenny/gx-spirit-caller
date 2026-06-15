; func_0209268c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a63d0
        .extern func_02092668
        .global func_0209268c
        .arm
func_0209268c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl OS_DisableIrq
    ldr r2, [r5, #0x8]
    ldr r1, _LIT0
    mov r4, r0
    cmp r2, #0x0
    ldr r0, [r1, #0x4]
    bne .L_44
    str r0, [r5, #0x8]
    ldr r2, [r5, #0xc]
    mov r1, r5
    add r2, r2, #0x1
    str r2, [r5, #0xc]
    bl func_02092668
    mov r6, #0x1
    b .L_5c
.L_44:
    cmp r2, r0
    ldreq r0, [r5, #0xc]
    moveq r6, #0x1
    addeq r0, r0, #0x1
    streq r0, [r5, #0xc]
    movne r6, #0x0
.L_5c:
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, r6
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a63d0
