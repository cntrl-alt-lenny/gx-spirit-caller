; func_0203c46c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219b328
        .extern data_0219b36c
        .extern data_0219b384
        .extern data_0219d070
        .extern data_0219d07c
        .extern func_0203baa0
        .extern func_0203bbac
        .extern func_0203c638
        .extern func_0207cfdc
        .extern func_0207cff4
        .extern func_0207d12c
        .extern func_020882d4
        .extern func_02088518
        .extern func_02092748
        .extern func_020927b8
        .global func_0203c46c
        .arm
func_0203c46c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r4, r0
    mov r2, r1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r2, #0x0
    beq .L_330
    ldrh r3, [r4, #0xb0]
    mov r1, #0x0
    orr r3, r3, #0x1000
    strh r3, [r4, #0xb0]
    bl func_0203c638
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_330:
    ldr r1, _LIT0
    mov r2, #0x1
    ldr r0, _LIT1
    str r2, [r1]
    bl func_020927b8
    ldr r0, _LIT2
    bl func_020927b8
    ldrh r1, [r4, #0xb0]
    add r0, r4, #0x4
    orr r1, r1, #0x1
    strh r1, [r4, #0xb0]
    bl func_020882d4
    ldrh r0, [r4, #0xb0]
    tst r0, #0x2000
    bne .L_37c
    add r0, r4, #0x4
    bl func_02088518
    mov r0, r4
    bl func_0203baa0
.L_37c:
    bl OS_DisableIrq
    ldr r6, _LIT3
    ldr r5, _LIT4
    mov r7, r0
    mov r8, #0x0
.L_390:
    mov r0, r6
    mov r1, r8
    bl func_0207cfdc
    movs r8, r0
    beq .L_3cc
    ldr r0, [r8, #0x8]
    cmp r0, r4
    bne .L_390
    mov r0, r6
    mov r1, r8
    bl func_0207cff4
    mov r0, r5
    mov r1, r8
    bl func_0207d12c
    b .L_390
.L_3cc:
    mov r0, r7
    bl OS_RestoreIrq
    mov r0, r4
    bl func_0203bbac
    mov r2, #0x0
    strh r2, [r4, #0xb0]
    ldr r1, [r4]
    ldr r0, _LIT2
    str r2, [r1]
    bl func_02092748
    ldr r0, _LIT1
    bl func_02092748
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219b328
_LIT1: .word data_0219b384
_LIT2: .word data_0219b36c
_LIT3: .word data_0219d070
_LIT4: .word data_0219d07c
