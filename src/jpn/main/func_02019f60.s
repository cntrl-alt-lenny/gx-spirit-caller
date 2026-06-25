; func_02019f60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b5a8c
        .extern func_020195d0
        .extern func_02019cac
        .extern func_02019e70
        .extern func_0201a13c
        .global func_02019f60
        .arm
func_02019f60:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    add r1, sp, #0x0
    mov r0, r5
    mov r4, #0x0
    bl func_02019cac
    mov r0, r5
    bl func_02019e70
    mov r2, #0x1
    mov r1, r4
.L_4cc:
    tst r0, r2
    beq .L_504
    add r0, sp, #0x0
    ldrb r0, [r0, r1]
    cmp r0, #0x11
    bcc .L_4f4
    mov r0, #0xe
    bl func_0201a13c
    mov r4, r0
    b .L_514
.L_4f4:
    mov r0, #0xf
    bl func_0201a13c
    mov r4, r0
    b .L_514
.L_504:
    add r1, r1, #0x1
    cmp r1, #0x2
    mov r2, r2, lsl #0x1
    blt .L_4cc
.L_514:
    mov r0, r5
    bl func_020195d0
    ldr r2, _LIT0
    ldr r1, _LIT1
    rsb r3, r5, r5, lsl #0x3
    add r3, r1, r3
    smull r1, r5, r2, r0
    mov r0, r0, lsr #0x1f
    ldrsb r1, [r3, #0x6]
    add r5, r0, r5, asr #0x2
    add r0, r5, r1
    add r0, r4, r0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_020b5a8c
