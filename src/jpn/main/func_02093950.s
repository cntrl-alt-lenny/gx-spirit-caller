; func_02093950 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a6618
        .extern data_021a661c
        .extern func_02093948
        .global func_02093950
        .arm
func_02093950:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, r0
    mov sl, r1
    bl OS_DisableIrq
    ldr r4, _LIT0
    ldr r1, _LIT1
    ldr r2, [r4]
    mov r8, r0
    and r0, r5, r2
    and r9, r0, r1
    ldr r6, _LIT2
    mov r7, #0x1
    mov r5, #0x0
.L_34:
    mov r0, r9
    bl func_02093948
    rsbs r2, r0, #0x1f
    bmi .L_6c
    mov r1, r2, lsl #0x1
    ldrh r0, [r6, r1]
    mvn r2, r7, lsl r2
    cmp sl, r0
    ldreq r0, [r4]
    and r9, r9, r2
    andeq r0, r0, r2
    streqh r5, [r6, r1]
    streq r0, [r4]
    b .L_34
.L_6c:
    mov r0, r8
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    bx lr
_LIT0: .word data_021a6618
_LIT1: .word 0x000001ff
_LIT2: .word data_021a661c
