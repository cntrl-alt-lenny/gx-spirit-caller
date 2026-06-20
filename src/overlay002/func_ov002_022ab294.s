; func_ov002_022ab294 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_ov002_022cd73c
        .extern func_02001d0c
        .extern func_02005188
        .extern func_0202b7cc
        .extern func_0208df40
        .extern func_0208e200
        .extern func_02094504
        .extern func_ov002_021b00e8
        .global func_ov002_022ab294
        .arm
func_ov002_022ab294:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov r6, r0
    ldr r0, [r2, #0x4]
    ldrh r1, [r1]
    mov r0, r0, lsl #0x1b
    mov r0, r0, lsr #0x1e
    add r0, r0, r0, lsr #0x1f
    movs r0, r0, asr #0x1
    ldr r0, _LIT1
    movne r5, #0x16
    ldr r0, [r0, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    eor r0, r0, #0x1
    moveq r5, #0x0
    cmp r0, r2, lsr #0x1f
    moveq r3, #0x1
    mov r1, r1, lsr #0x1b
    mov r0, r2, lsr #0x1f
    movne r3, #0x0
    sub r2, r1, #0xc
    add r4, r3, r2, lsl #0x1
    bl func_ov002_021b00e8
    add r1, r4, #0xa
    and r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, [r6]
    rsb r1, r1, #0x0
    cmp r0, r1
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    str r1, [r6]
    bl func_0208df40
    mov r7, r0
    ldr r0, _LIT2
    mov r1, #0x3e
    mov r2, #0x2
    bl func_02001d0c
    add r1, r7, #0x40
    mov r0, #0x0
    mov r2, #0x1f00
    bl func_02094504
    add r0, r4, #0x46
    add r0, r0, #0x200
    bl func_0202b7cc
    mov r1, r0
    mov r0, #0x3
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r2, r7, #0x40
    mov r3, #0x1
    bl func_02005188
    bl func_0208e200
    mov r1, #0x0
    add r4, r0, r5, lsl #0x6
    mov r3, #0x1
    mov r0, r1
.L_2f0:
    mov r2, r0
.L_2f4:
    add r2, r2, #0x1
    strh r3, [r4], #0x2
    cmp r2, #0x20
    add r3, r3, #0x1
    blt .L_2f4
    add r1, r1, #0x1
    cmp r1, #0x2
    add r3, r3, #0x1e
    blt .L_2f0
    mov r0, #0x0
    str r0, [r6, #0x10]
    str r0, [r6, #0x18]
    str r0, [r6, #0x14]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov002_022cd73c
_LIT2: .word data_02102c90
