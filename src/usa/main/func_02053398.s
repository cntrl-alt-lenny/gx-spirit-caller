; func_02053398 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff9cc
        .global func_02053398
        .arm
func_02053398:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr lr, _LIT0
    add r4, r2, #0x4
    smull ip, r2, lr, r4
    mov r2, r2, asr #0x1
    mov ip, r4, lsr #0x1f
    add r2, ip, r2
    cmp r2, #0x0
    ldr r6, _LIT1
    mov r7, #0x0
    ble .L_240
    add r4, r3, r2
    sub r4, r4, #0x1
    mov ip, #0x1f
.L_218:
    and r5, r0, ip
    ldrsb r5, [r6, r5]
    mov r0, r0, lsr #0x5
    mov lr, r1, lsr #0x5
    strb r5, [r4, -r7]
    add r7, r7, #0x1
    orr r0, r0, r1, lsl #0x1b
    mov r1, lr
    cmp r7, r2
    blt .L_218
.L_240:
    mov r0, #0x0
    strb r0, [r3, r2]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_020ff9cc
