; func_020033e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b9c
        .extern data_02102c4c
        .extern data_02102c54
        .extern data_02102c5c
        .extern data_02102c64
        .extern func_02002c1c
        .global func_020033e0
        .arm
func_020033e0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    cmp r1, #0x80
    ldr r5, [r4]
    ldr r4, [sp, #0x24]
    movlt r5, #0x1
    sub r4, r4, #0x8
    cmp r4, #0x8
    addls pc, pc, r4, lsl #0x2
    b .L_16ac
    b .L_1538
    b .L_16ac
    b .L_1550
    b .L_16ac
    b .L_1570
    b .L_16ac
    b .L_16ac
    b .L_16ac
    b .L_1590
.L_1538:
    ldr r4, _LIT1
    rsb r6, r5, #0x1
    ldr ip, [r4, r6, lsl #0x2]
    mov r4, #0x8
    mov lr, #0x1
    b .L_15ac
.L_1550:
    ldr r7, _LIT2
    rsb ip, r5, #0x1
    mov r4, #0x14
    mov r6, #0x2
    mov r4, r4, asr r5
    mov lr, r6, asr r5
    ldr ip, [r7, ip, lsl #0x2]
    b .L_15ac
.L_1570:
    ldr r7, _LIT3
    rsb ip, r5, #0x1
    mov r4, #0x18
    mov r6, #0x2
    mov r4, r4, asr r5
    mov lr, r6, asr r5
    ldr ip, [r7, ip, lsl #0x2]
    b .L_15ac
.L_1590:
    ldr r7, _LIT4
    rsb ip, r5, #0x1
    mov r4, #0x20
    mov r6, #0x2
    mov r4, r4, asr r5
    mov lr, r6, asr r5
    ldr ip, [r7, ip, lsl #0x2]
.L_15ac:
    cmp r5, #0x0
    mlane ip, r4, r1, ip
    bne .L_1690
    ldr r6, _LIT5
    cmp r1, r6
    bge .L_15f0
    mov r5, r1, lsl #0x10
    mov r5, r5, lsr #0x10
    mov r5, r5, asr #0x8
    and r7, r1, #0xff
    and r1, r5, #0xff
    sub r6, r7, #0x40
    sub r5, r1, #0x81
    mov r1, #0xbc
    mla r1, r5, r1, r6
    sub r1, r1, r7, asr #0x7
    b .L_168c
.L_15f0:
    ldr r5, _LIT6
    cmp r1, r5
    bge .L_162c
    mov r5, r1, lsl #0x10
    mov r5, r5, lsr #0x10
    and r1, r1, #0xff
    mov r6, r5, asr #0x8
    add r5, r1, #0x52
    and r6, r6, #0xff
    add r7, r5, #0x200
    sub r6, r6, #0x88
    mov r5, #0xbc
    mla r5, r6, r5, r7
    sub r1, r5, r1, asr #0x7
    b .L_168c
.L_162c:
    add r5, r6, #0x5800
    cmp r1, r5
    mov r5, r1, lsl #0x10
    mov r5, r5, lsr #0x10
    bge .L_1668
    mov r6, r5, asr #0x8
    and r1, r1, #0xff
    add r5, r1, #0xe7
    and r6, r6, #0xff
    add r7, r5, #0xd00
    sub r6, r6, #0x98
    mov r5, #0xbc
    mla r5, r6, r5, r7
    sub r1, r5, r1, asr #0x7
    b .L_168c
.L_1668:
    mov r6, r5, asr #0x8
    and r1, r1, #0xff
    add r5, r1, #0xc7
    and r6, r6, #0xff
    add r7, r5, #0x1300
    sub r6, r6, #0xe0
    mov r5, #0xbc
    mla r5, r6, r5, r7
    sub r1, r5, r1, asr #0x7
.L_168c:
    mla ip, r4, r1, ip
.L_1690:
    ldr r0, [r0]
    mov r1, r3
    stmia sp, {r0, r2, lr}
    ldr r2, [sp, #0x20]
    ldr r3, [sp, #0x24]
    mov r0, ip
    bl func_02002c1c
.L_16ac:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02102b9c
_LIT1: .word data_02102c4c
_LIT2: .word data_02102c54
_LIT3: .word data_02102c5c
_LIT4: .word data_02102c64
_LIT5: .word 0x00008840
_LIT6: .word 0x0000989f
