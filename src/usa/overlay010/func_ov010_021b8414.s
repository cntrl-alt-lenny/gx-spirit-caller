; func_ov010_021b8414 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b8c44
        .extern data_ov010_021b9784
        .extern data_ov010_021b9790
        .extern data_ov010_021b97a8
        .extern data_ov010_021b9aec
        .extern func_0207eb80
        .extern func_0207ecac
        .extern func_0207ef74
        .extern func_0208c75c
        .extern func_0208c79c
        .extern func_ov010_021b2824
        .extern func_ov010_021b6b4c
        .extern func_ov010_021b7004
        .global func_ov010_021b8414
        .arm
func_ov010_021b8414:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r5, _LIT1
    bl func_0208c75c
    mov r4, r0
    ldr r1, _LIT2
    ldr r0, _LIT3
    str r1, [sp]
    mov r6, #0x0
    bl func_0207ecac
    ldr r0, _LIT3
    bl func_0207eb80
    ldr r0, _LIT4
    ldr r0, [r0, #0xc]
    cmp r0, #0x3
    beq .L_13d8
    cmp r0, #0x7
    beq .L_13e8
    b .L_13f4
.L_13d8:
    add r0, sp, #0x0
    bl func_ov010_021b6b4c
    add r6, r6, r0
    b .L_13f4
.L_13e8:
    add r0, sp, #0x0
    bl func_ov010_021b7004
    add r6, r6, r0
.L_13f4:
    add r2, sp, #0x0
    add r0, r5, #0x3c
    add r1, r5, #0x18
    bl func_ov010_021b2824
    add r0, r6, r0
    cmp r0, #0x0
    ble .L_1424
    mov r2, r0, lsl #0x10
    ldr r1, _LIT2
    add r0, r5, #0x18
    mov r2, r2, lsr #0x10
    bl func_0207ef74
.L_1424:
    ldr r0, _LIT5
    mov r1, r4
    bl func_0208c79c
    ldr r0, _LIT6
    ldr r0, [r0, #0x64]
    cmp r0, #0x0
    bne .L_1450
    ldr r1, _LIT7
    ldr r0, [r1]
    bic r0, r0, #0x1f00
    str r0, [r1]
.L_1450:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word 0x0400006c
_LIT1: .word data_ov010_021b9790
_LIT2: .word data_ov010_021b9aec
_LIT3: .word data_ov010_021b97a8
_LIT4: .word data_ov010_021b9784
_LIT5: .word 0x0400106c
_LIT6: .word data_ov010_021b8c44
_LIT7: .word 0x04001000
