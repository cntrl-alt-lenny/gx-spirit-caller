; func_ov015_021b5700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov015_021b5d24
        .extern data_ov015_021b5d34
        .extern func_0207eb80
        .extern func_0207ecac
        .extern func_0207ef74
        .extern func_0208c79c
        .extern func_020b377c
        .extern func_ov015_021b2824
        .extern func_ov015_021b3f44
        .global func_ov015_021b5700
        .arm
func_ov015_021b5700:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r6, #0x0
    add r0, sp, #0x0
    ldr r5, _LIT0
    ldr r7, _LIT1
    mov r4, r6
    str r6, [r0]
    str r6, [r0, #0x4]
.L_1070:
    mov r0, r7
    bl func_0207ecac
    mov r0, r7
    bl func_0207eb80
    add r0, r7, #0x1c
    add r4, r4, #0x1
    cmp r4, #0x2
    add r7, r0, #0x400
    blt .L_1070
    add r0, r5, #0x48
    add r2, r0, #0x400
    add r3, r5, #0x2c
    add r1, sp, #0x8
    add r0, r3, #0x400
    str r2, [sp, #0x8]
    bl func_ov015_021b3f44
    ldr r2, [sp, #0x4]
    add r1, r5, #0x2c
    add r0, r2, r0
    str r0, [sp, #0x4]
    add r2, sp, #0x8
    add r0, r5, #0x850
    add r1, r1, #0x400
    bl func_ov015_021b2824
    ldr r1, [sp, #0x4]
    add r7, r5, #0x2c
    add r0, r1, r0
    str r0, [sp, #0x4]
    add r8, r5, #0x10
    mov r9, #0x0
    add r4, sp, #0x0
.L_10ec:
    ldr r0, [r4, r9, lsl #0x2]
    cmp r0, #0x0
    ble .L_110c
    mov r2, r0, lsl #0x10
    mov r0, r8
    mov r1, r7
    mov r2, r2, lsr #0x10
    bl func_0207ef74
.L_110c:
    add r0, r7, #0x1c
    add r1, r8, #0x1c
    add r9, r9, #0x1
    cmp r9, #0x2
    add r7, r0, #0x400
    add r8, r1, #0x400
    blt .L_10ec
    ldr r0, [r5, #0xc]
    ldr r1, [r5, #0x8]
    subs r0, r0, #0x1000
    str r0, [r5, #0xc]
    movmi r0, #0x0
    strmi r0, [r5, #0xc]
    ldr r0, [r5, #0xc]
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
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    bne .L_11b8
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
.L_11b8:
    mov r0, r6
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov015_021b5d24
_LIT1: .word data_ov015_021b5d34
_LIT2: .word 0x0400006c
_LIT3: .word 0x0400106c
_LIT4: .word 0x04001000
