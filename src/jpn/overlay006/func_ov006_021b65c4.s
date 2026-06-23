; func_ov006_021b65c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02104e6c
        .extern data_ov006_021cbd98
        .extern data_ov006_021cbdac
        .extern data_ov006_0224f328
        .extern func_02011b68
        .extern func_0202c06c
        .extern func_020a9698
        .extern func_ov006_021b7ab0
        .extern func_ov006_021b7b94
        .extern func_ov006_021b7bc0
        .extern func_ov006_021b7d80
        .extern func_ov006_021b7e6c
        .extern func_ov006_021b8af4
        .extern func_ov006_021b8c30
        .global func_ov006_021b65c4
        .arm
func_ov006_021b65c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    mov sl, r0
    ldr r2, _LIT1
    mov r0, #0x0
    bl Fill32
    mov r0, sl
    add r1, sl, #0x6000
    mov r2, #0x1
    str r2, [r1, #0x298]
    bl func_ov006_021b8c30
    mov r0, sl
    bl func_ov006_021b8af4
    mov r1, sl
    mov r0, #0x0
    mov r2, #0x124
    bl Fill32
    ldr r1, _LIT2
    ldr r0, _LIT3
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    strb r1, [sl]
    bl func_0202c06c
    mov r1, r0
    add r0, sl, #0x1
    bl func_020a9698
    ldr r1, _LIT4
    add r0, sl, #0x1c
    bl func_02011b68
    mov r0, sl
    bl func_ov006_021b7e6c
    mov r0, sl
    bl func_ov006_021b7d80
    ldr r1, _LIT5
    add r0, sl, #0x1c
    bl func_02011b68
    mov r0, sl
    bl func_ov006_021b7e6c
    mov r9, #0x0
    mov r8, #0x1
    mov r7, r9
    mvn r6, #0x0
    mov r5, r8
    mov r4, #0x2
    mov fp, #0x3
.L_b8:
    mov r0, sl
    mov r1, r9
    mov r2, r8
    bl func_ov006_021b7b94
    mov r0, sl
    mov r1, r9
    mov r2, r7
    mov r3, r6
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, r5
    mov r3, r6
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, r4
    mov r3, r6
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, fp
    mov r3, r6
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x4
    mov r3, r6
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x5
    mov r3, r6
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    mov r2, #0x6
    mov r3, r6
    bl func_ov006_021b7bc0
    mov r0, sl
    mov r1, r9
    bl func_ov006_021b7ab0
    add r9, r9, #0x1
    cmp r9, #0x5
    blt .L_b8
    mov r2, #0x0
.L_170:
    add r0, sl, r2, lsl #0x1
    add r0, r0, #0x8100
    ldrh r1, [r0, #0x6a]
    add r2, r2, #0x1
    cmp r2, #0x5
    strh r1, [r0, #0x74]
    blt .L_170
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word 0x0000ca98
_LIT2: .word data_02104e6c
_LIT3: .word 0x00000486
_LIT4: .word data_ov006_021cbd98
_LIT5: .word data_ov006_021cbdac
