; func_02033340 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032834
        .extern func_020329e0
        .extern func_02032bf0
        .extern func_02032c74
        .extern func_02032ca8
        .extern func_02032cd8
        .extern func_02046bf4
        .extern func_02047000
        .extern func_02047510
        .extern func_02052644
        .extern func_02052724
        .extern func_02052744
        .extern func_02052764
        .extern func_02052784
        .global func_02033340
        .arm
func_02033340:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r5, r0
    ldr r1, [r5, #0xe8c]
    add r0, r5, #0x1f4
    str r1, [sp]
    ldr r1, [r5, #0xe90]
    add r4, r0, #0xc00
    str r1, [sp, #0x4]
    ldr r1, [r5, #0xe94]
    add r0, r5, #0x4
    str r1, [sp, #0x8]
    ldr r2, [r4, #0x80]
    add r1, r4, #0x40
    str r2, [sp, #0xc]
    ldr r2, [r5, #0xea4]
    str r2, [sp, #0x10]
    ldr r2, [r5, #0xe84]
    ldr r3, [r5, #0xe88]
    bl func_02047510
    ldr r0, _LIT0
    mov r1, r5
    bl func_02046bf4
    ldr r0, _LIT1
    bl func_02052764
    ldr r0, _LIT2
    bl func_02052744
    ldr r0, [r5, #0xe98]
    mov r7, #0x0
    cmp r0, #0x0
    ble .L_d8
    mov r6, r7
.L_bc:
    mov r1, r6
    and r0, r7, #0xff
    bl func_02052644
    ldr r0, [r5, #0xe98]
    add r7, r7, #0x1
    cmp r7, r0
    blt .L_bc
.L_d8:
    ldr r0, _LIT3
    bl func_02052784
    ldr r0, _LIT4
    bl func_02052724
    ldr r0, [r5, #0xeac]
    ldr r2, _LIT5
    bic r0, r0, #0x100
    mov r3, r5
    str r0, [r5, #0xeac]
    add r0, r4, #0xc
    mov r1, #0x0
    bl func_02047000
    ldr r1, [r5, #0xeac]
    orr r1, r1, #0x1
    str r1, [r5, #0xeac]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word func_02032834
_LIT1: .word func_02032c74
_LIT2: .word func_02032ca8
_LIT3: .word func_02032cd8
_LIT4: .word func_02032bf0
_LIT5: .word func_020329e0
