; func_02037f94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern func_02037b08
        .extern func_0203c554
        .extern func_02087440
        .extern func_02087cbc
        .global func_02037f94
        .arm
func_02037f94:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r2
    bl func_02037b08
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    strb r5, [r4, #0x24]
    ldrh r0, [r4, #0x68]
    tst r0, #0x6000
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r2, [r4, #0x34]
    mov r0, r2, lsr #0x14
    and r0, r0, #0xf
    cmp r0, #0x4
    beq .L_274
    cmp r0, #0x5
    beq .L_288
    b .L_298
.L_274:
    ldr r0, [r4, #0x4]
    mov r1, r5
    mov r2, r6
    bl func_0203c554
    b .L_304
.L_288:
    ldr r0, [r4, #0x4]
    mov r1, r5
    bl func_02087440
    b .L_304
.L_298:
    ldr r1, _LIT0
    mov r0, r2, lsl #0x10
    ldr r2, [r1, #0x34]
    mov r1, r0, lsr #0x10
    mov r0, #0xc
    mla r0, r1, r0, r2
    ldrb r0, [r0, #0x7]
    tst r0, #0x40
    beq .L_2f4
    sub r0, r5, #0x40
    movs r2, r0, lsl #0x1
    movmi r2, #0x0
    add r0, r4, #0x4
    mov r1, #0x1
    bl func_02087cbc
    mov r1, r5, lsl #0x1
    cmp r1, #0x7f
    movgt r1, #0x7f
    sub r2, r1, #0x7f
    add r0, r4, #0x4
    mov r1, #0x2
    bl func_02087cbc
    b .L_304
.L_2f4:
    ldr r1, _LIT1
    add r0, r4, #0x4
    sub r2, r5, #0x40
    bl func_02087cbc
.L_304:
    ldrsb r1, [r4, #0x24]
    mov r0, #0x1
    strb r1, [r4, #0x25]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219b200
_LIT1: .word 0x0000ffff
