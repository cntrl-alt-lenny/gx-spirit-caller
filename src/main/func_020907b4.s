; func_020907b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OSi_IrqCallbackTable
        .extern data_021a6354
        .global func_020907b4
        .arm
func_020907b4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, #0x0
    ldr lr, _LIT0
    ldr r5, _LIT1
    mov r6, r8
    mov ip, r8
    mov r3, #0x1
    mov r2, #0xc
.L_260:
    ands r4, r0, #0x1
    beq .L_2b0
    mov r7, r6
    cmp r8, #0x8
    blt .L_284
    cmp r8, #0xb
    suble r4, r8, #0x8
    mlale r7, r4, r2, r5
    ble .L_2a0
.L_284:
    cmp r8, #0x3
    blt .L_29c
    cmp r8, #0x6
    addle r4, r8, #0x1
    mlale r7, r4, r2, r5
    ble .L_2a0
.L_29c:
    str r1, [lr, r8, lsl #0x2]
.L_2a0:
    cmp r7, #0x0
    strne r1, [r7]
    strne ip, [r7, #0x8]
    strne r3, [r7, #0x4]
.L_2b0:
    add r8, r8, #0x1
    cmp r8, #0x16
    mov r0, r0, lsr #0x1
    blt .L_260
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word OSi_IrqCallbackTable
_LIT1: .word data_021a6354
