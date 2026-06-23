; func_ov006_021b5b2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern data_0210596c
        .extern data_ov006_0224f328
        .extern func_ov006_021b7a78
        .extern func_ov006_021b7b94
        .extern func_ov006_021b7bc0
        .extern func_ov006_021b8988
        .extern func_ov006_021b8af4
        .extern func_ov006_021b8c30
        .extern func_ov006_021b8ce0
        .global func_ov006_021b5b2c
        .arm
func_ov006_021b5b2c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    mov sl, r0
    ldr r2, _LIT1
    mov r0, #0x0
    bl Fill32
    mov r0, sl
    bl func_ov006_021b8c30
    mov r0, sl
    bl func_ov006_021b8ce0
    mov r0, sl
    bl func_ov006_021b8988
    mov r0, sl
    bl func_ov006_021b8af4
    ldr r0, _LIT2
    mov r1, sl
    mov r2, #0x124
    bl Copy32
    mov r1, #0x0
    mov r0, sl
    mov r2, r1
    bl func_ov006_021b7b94
    mov r1, #0x1
    mov r0, sl
    mov r2, r1
    bl func_ov006_021b7b94
    mov r0, sl
    mov r1, #0x2
    mov r2, #0x1
    bl func_ov006_021b7b94
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_ov006_021b7b94
    mov r0, sl
    mov r1, #0x4
    mov r2, #0x1
    bl func_ov006_021b7b94
    mov r9, #0x0
    mov r8, r9
    mvn r7, #0x0
    mov r6, #0x1
    mov r5, #0x2
    mov r4, #0x3
    mov fp, #0x4
.L_b4:
    mov r0, sl
    mov r1, r9
    mov r2, r8
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, r6
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, r5
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, r4
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, fp
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x5
    mov r3, r7
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x6
    mov r3, r7
    bl func_ov006_021b7bc0
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_b4
    mov r0, sl
    bl func_ov006_021b7a78
    mov r2, #0x0
.L_158:
    add r0, sl, r2, lsl #0x1
    add r0, r0, #0x8100
    ldrh r1, [r0, #0x6a]
    add r2, r2, #0x1
    cmp r2, #0x5
    strh r1, [r0, #0x74]
    blt .L_158
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word 0x0000ca98
_LIT2: .word data_0210596c
