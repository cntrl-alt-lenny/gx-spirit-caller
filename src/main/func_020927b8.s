; func_020927b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a63d0
        .extern func_02091a8c
        .extern OSi_EnqueueTail
        .global func_020927b8
        .arm
func_020927b8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldr r7, [r1, #0x4]
    mov r6, #0x0
.L_14c:
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    bne .L_178
    str r7, [r5, #0x8]
    ldr r1, [r5, #0xc]
    mov r0, r7
    add r2, r1, #0x1
    mov r1, r5
    str r2, [r5, #0xc]
    bl OSi_EnqueueTail
    b .L_1a0
.L_178:
    cmp r0, r7
    ldreq r0, [r5, #0xc]
    addeq r0, r0, #0x1
    streq r0, [r5, #0xc]
    beq .L_1a0
    mov r0, r5
    str r5, [r7, #0x84]
    bl func_02091a8c
    str r6, [r7, #0x84]
    b .L_14c
.L_1a0:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a63d0
