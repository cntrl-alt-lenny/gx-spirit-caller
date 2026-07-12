; func_ov016_021b6088 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_ov016_021b95e0
        .extern data_ov016_021bab04
        .extern data_ov016_021bb164
        .extern data_ov016_021bb264
        .extern func_02001cec
        .extern func_0200506c
        .extern func_02005488
        .extern func_0202c06c
        .extern func_0208de78
        .extern func_02094410
        .extern func_ov016_021b745c
        .extern func_ov016_021b7660
        .global func_ov016_021b6088
        .arm
func_ov016_021b6088:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r5, r0
    mov r0, #0x0
    mov r2, #0x28
    ldr r4, _LIT1
    bl func_02094410
    mov r0, #0x0
    str r0, [r5, #0x10]
    str r0, [r5, #0x24]
    bl func_0208de78
    add r1, r0, #0x40
    mov r0, #0x0
    mov r2, #0x580
    bl func_02094410
    ldr r0, _LIT2
    mov r1, #0x16
    mov r2, #0x2
    bl func_02001cec
    ldr r0, _LIT3
    bl func_0202c06c
    mov r7, r0
    bl func_0208de78
    mov r6, r0
    ldr r0, _LIT3
    bl func_0202c06c
    mov r1, #0xc
    bl func_02005488
    rsb r0, r0, #0xb0
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x1
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    mov r1, r7
    add r2, r6, #0x40
    bl func_0200506c
    mov r2, #0x0
    str r2, [r5, #0x8]
    cmp r2, #0x3c
    bge .L_1ec
    mov r0, #0x54
.L_1c8:
    mla r1, r2, r0, r4
    ldr r1, [r1, #0x8c]
    cmp r1, #0x0
    beq .L_1ec
    ldr r1, [r5, #0x8]
    add r2, r1, #0x1
    str r2, [r5, #0x8]
    cmp r2, #0x3c
    blt .L_1c8
.L_1ec:
    mov r0, r5
    bl func_ov016_021b745c
    ldr r1, _LIT4
    mov r2, #0x1
    mov r3, #0x160
    str r3, [r1]
    ldr r0, _LIT5
    str r3, [r1, #0x4]
    mov r3, #0x0
    ldr r1, _LIT6
    str r3, [r0, #0x1dc]
    strh r2, [r1, #0xd8]
    sub r1, r2, #0x81
    str r1, [r0, #0x1e0]
    sub r1, r2, #0xb9
    str r1, [r0, #0x1e8]
    bl func_ov016_021b7660
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov016_021bab04
_LIT1: .word data_ov016_021b95e0
_LIT2: .word data_02102bb0
_LIT3: .word 0x000006b9
_LIT4: .word 0x04000014
_LIT5: .word data_ov016_021bb164
_LIT6: .word data_ov016_021bb264
