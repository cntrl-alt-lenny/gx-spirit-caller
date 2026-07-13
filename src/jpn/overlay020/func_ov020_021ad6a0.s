; func_ov020_021ad6a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021adfc8
        .extern data_ov020_021ae008
        .extern func_0207eb80
        .extern func_0207ecac
        .extern func_0207ef74
        .extern func_0208c79c
        .extern func_020b377c
        .extern func_ov020_021ab4e4
        .extern func_ov020_021ab73c
        .global func_ov020_021ad6a0
        .arm
func_ov020_021ad6a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r6, #0x0
    add r0, sp, #0x0
    ldr r5, _LIT0
    ldr r7, _LIT1
    mov r4, r6
    str r6, [r0]
    str r6, [r0, #0x4]
.L_1bbc:
    mov r0, r7
    bl func_0207ecac
    mov r0, r7
    bl func_0207eb80
    add r0, r7, #0x1c
    add r4, r4, #0x1
    cmp r4, #0x2
    add r7, r0, #0x400
    blt .L_1bbc
    add r0, r5, #0x78
    add r2, r0, #0x400
    add r3, r5, #0x5c
    add r1, sp, #0x8
    add r0, r5, #0x40
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    bl func_ov020_021ab73c
    ldr r2, [sp]
    add r1, r5, #0x5c
    add r3, r2, r0
    add r2, sp, #0xc
    add r1, r1, #0x400
    mov r0, #0x9
    str r3, [sp]
    bl func_ov020_021ab4e4
    ldr r1, [sp, #0x4]
    add r7, r5, #0x5c
    add r0, r1, r0
    str r0, [sp, #0x4]
    add r8, r5, #0x40
    mov r9, #0x0
    add r4, sp, #0x0
.L_1c3c:
    ldr r0, [r4, r9, lsl #0x2]
    cmp r0, #0x0
    ble .L_1c5c
    mov r2, r0, lsl #0x10
    mov r0, r8
    mov r1, r7
    mov r2, r2, lsr #0x10
    bl func_0207ef74
.L_1c5c:
    add r0, r7, #0x1c
    add r1, r8, #0x1c
    add r9, r9, #0x1
    cmp r9, #0x2
    add r7, r0, #0x400
    add r8, r1, #0x400
    blt .L_1c3c
    ldr r0, [r5, #0x87c]
    ldr r1, [r5, #0x878]
    subs r0, r0, #0x1000
    str r0, [r5, #0x87c]
    movmi r0, #0x0
    strmi r0, [r5, #0x87c]
    ldr r0, [r5, #0x87c]
    mov r0, r0, lsl #0x4
    rsb r0, r0, #0x0
    bl func_020b377c
    mvn r1, #0xf
    sub r4, r1, r0
    ldr r0, _LIT2
    mov r1, r4
    bl func_0208c79c
    ldr r0, _LIT3
    mov r1, r4
    bl func_0208c79c
    ldr r0, [r5, #0x87c]
    cmp r0, #0x0
    bne .L_1d08
    mov r2, #0x4000000
    ldr r1, [r2]
    add r0, r2, #0x6c
    bic r3, r1, #0x1f00
    mvn r1, #0xf
    str r3, [r2]
    bl func_0208c79c
    ldr r3, _LIT4
    mvn r1, #0xf
    ldr r2, [r3]
    add r0, r3, #0x6c
    bic r2, r2, #0x1f00
    str r2, [r3]
    bl func_0208c79c
    mov r6, #0x1
.L_1d08:
    mov r0, r6
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov020_021adfc8
_LIT1: .word data_ov020_021ae008
_LIT2: .word 0x0400006c
_LIT3: .word 0x0400106c
_LIT4: .word 0x04001000
