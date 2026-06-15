; func_ov010_021b6514 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b8d44
        .extern data_ov010_021b9260
        .extern data_ov010_021b9270
        .extern data_ov010_021b9294
        .extern data_ov010_021b9484
        .extern func_0207ec68
        .extern func_0207ed94
        .extern func_0207f05c
        .extern func_0208c844
        .extern func_0208c884
        .extern func_ov010_021b2924
        .extern func_ov010_021b4884
        .global func_ov010_021b6514
        .arm
func_ov010_021b6514:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r1, [sp]
    ldr r4, _LIT2
    bl func_0208c844
    mov r6, r0
    ldr r0, _LIT3
    bl func_0207ed94
    ldr r0, _LIT3
    bl func_0207ec68
    add r0, sp, #0x0
    bl func_ov010_021b4884
    add r5, r0, #0x0
    ldr r0, _LIT4
    ldr r1, _LIT3
    add r2, sp, #0x0
    bl func_ov010_021b2924
    add r0, r5, r0
    cmp r0, #0x0
    ble .L_1e14
    mov r2, r0, lsl #0x10
    ldr r1, _LIT0
    add r0, r4, #0x10
    mov r2, r2, lsr #0x10
    bl func_0207f05c
.L_1e14:
    ldr r0, _LIT5
    mov r1, r6
    bl func_0208c884
    ldr r0, _LIT6
    ldr r0, [r0, #0x64]
    cmp r0, #0x0
    bne .L_1e4c
    ldr r3, _LIT7
    mvn r1, #0xf
    ldr r2, [r3]
    add r0, r3, #0x6c
    bic r2, r2, #0x1f00
    str r2, [r3]
    bl func_0208c884
.L_1e4c:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov010_021b9484
_LIT1: .word 0x0400006c
_LIT2: .word data_ov010_021b9260
_LIT3: .word data_ov010_021b9270
_LIT4: .word data_ov010_021b9294
_LIT5: .word 0x0400106c
_LIT6: .word data_ov010_021b8d44
_LIT7: .word 0x04001000
