; func_0208ade0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021022e0
        .extern data_021022f8
        .extern func_0208a968
        .extern func_0208a9b0
        .extern func_0208aba8
        .extern func_0208ad48
        .extern func_02094398
        .extern func_02094bf8
        .global func_0208ade0
        .arm
func_0208ade0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1]
    cmp r5, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    cmp r0, #0x1
    bne .L_30
    mov r0, #0x0
    bl func_02094bf8
.L_30:
    bl OS_DisableIrq
    mov r4, r0
    ldr r1, _LIT1
    mov r0, #0x0
    mov r2, #0xc0
    bl func_02094398
    ldr r0, _LIT0
    cmp r5, #0x3
    str r5, [r0]
    addls pc, pc, r5, lsl #0x2
    b .L_9c
    b .L_90
    b .L_6c
    b .L_78
    b .L_84
.L_6c:
    ldr r1, _LIT2
    str r1, [r0, #0x4]
    b .L_a8
.L_78:
    ldr r1, _LIT3
    str r1, [r0, #0x4]
    b .L_a8
.L_84:
    ldr r1, _LIT4
    str r1, [r0, #0x4]
    b .L_a8
.L_90:
    ldr r1, _LIT5
    str r1, [r0, #0x4]
    b .L_a8
.L_9c:
    ldr r1, _LIT5
    ldr r0, _LIT0
    str r1, [r0, #0x4]
.L_a8:
    mov r0, r4
    bl OS_RestoreIrq
    cmp r5, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r0, #0x3000
    bl func_02094bf8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021022e0
_LIT1: .word data_021022f8
_LIT2: .word func_0208aba8
_LIT3: .word func_0208a9b0
_LIT4: .word func_0208a968
_LIT5: .word func_0208ad48
