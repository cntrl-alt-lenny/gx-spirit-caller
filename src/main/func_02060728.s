; func_02060728 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101358
        .extern data_0210135c
        .extern func_020607b0
        .extern func_02060c10
        .extern func_02060d8c
        .global func_02060728
        .arm
func_02060728:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r9, r1
    mov sl, r0
    mov r7, r9
    bl func_02060c10
    mov r8, r0
    ldr r5, _LIT0
    ldr r4, _LIT1
    b .L_2e0
.L_29c:
    sub r6, r8, sl
    mov r0, sl
    mov r1, r6
    str r5, [r4]
    bl func_02060d8c
    mov r0, sl
    mov r1, r6
    bl func_020607b0
    add r0, r6, #0x7
    sub r9, r9, r0
    cmp r9, #0x0
    add sl, r8, #0x7
    ble .L_2e0
    mov r0, sl
    mov r1, r9
    bl func_02060c10
    mov r8, r0
.L_2e0:
    cmp r9, #0x0
    ble .L_2f0
    cmp r8, #0x0
    bne .L_29c
.L_2f0:
    sub r0, r7, r9
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0210135c
_LIT1: .word data_02101358
