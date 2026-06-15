; func_0208aec8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021023c0
        .extern data_021023d8
        .extern func_0208aa50
        .extern func_0208aa98
        .extern func_0208ac90
        .extern func_0208ae30
        .extern func_0209448c
        .extern func_02094cec
        .global func_0208aec8
        .arm
func_0208aec8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1]
    cmp r5, r0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, pc}
    cmp r0, #0x1
    bne .L_c4
    mov r0, #0x0
    bl func_02094cec
.L_c4:
    bl OS_DisableIrq
    mov r4, r0
    ldr r1, _LIT1
    mov r0, #0x0
    mov r2, #0xc0
    bl func_0209448c
    ldr r0, _LIT0
    cmp r5, #0x3
    str r5, [r0]
    addls pc, pc, r5, lsl #0x2
    b .L_130
    b .L_124
    b .L_100
    b .L_10c
    b .L_118
.L_100:
    ldr r1, _LIT2
    str r1, [r0, #0x4]
    b .L_13c
.L_10c:
    ldr r1, _LIT3
    str r1, [r0, #0x4]
    b .L_13c
.L_118:
    ldr r1, _LIT4
    str r1, [r0, #0x4]
    b .L_13c
.L_124:
    ldr r1, _LIT5
    str r1, [r0, #0x4]
    b .L_13c
.L_130:
    ldr r1, _LIT5
    ldr r0, _LIT0
    str r1, [r0, #0x4]
.L_13c:
    mov r0, r4
    bl OS_RestoreIrq
    cmp r5, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
    mov r0, #0x3000
    bl func_02094cec
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021023c0
_LIT1: .word data_021023d8
_LIT2: .word func_0208ac90
_LIT3: .word func_0208aa98
_LIT4: .word func_0208aa50
_LIT5: .word func_0208ae30
