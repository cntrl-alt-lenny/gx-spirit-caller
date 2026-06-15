; func_02046c88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff908
        .extern data_020ff918
        .extern data_020ff91c
        .extern data_0219daec
        .extern func_0204525c
        .extern func_02045280
        .extern func_02045b1c
        .extern func_02046254
        .extern func_020466f4
        .extern func_020467f4
        .extern func_02049038
        .extern func_0204918c
        .extern func_0205121c
        .extern func_020556c8
        .extern func_02055738
        .extern func_020557b8
        .extern func_020acca0
        .global func_02046c88
        .arm
func_02046c88:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x224
    mvn ip, #0x0
    mov r7, r0
    mov r6, r1
    mov r4, r2
    mov r5, r3
    str ip, [sp, #0x8]
    bl func_02045280
    cmp r0, #0x0
    bne .L_40
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x24]
    cmp r0, #0x3
    beq .L_4c
.L_40:
    add sp, sp, #0x224
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_4c:
    bl func_020467f4
    ldr r1, _LIT0
    mov r0, #0x5
    ldr r2, [r1]
    str r6, [r2, #0x88]
    ldr r1, [r1]
    str r4, [r1, #0x8c]
    bl func_020466f4
    mov r0, r7
    bl func_0204918c
    movs r4, r0
    beq .L_98
    ldr r0, _LIT0
    mov r1, r4
    ldr r0, [r0]
    add r0, r0, #0x1c
    bl func_020556c8
    cmp r0, #0x0
    bne .L_a0
.L_98:
    mov r5, #0xb
    b .L_16c
.L_a0:
    ldr r0, _LIT0
    add r2, sp, #0x8
    ldr r0, [r0]
    mov r1, r4
    add r0, r0, #0x1c
    bl func_02055738
    ldr r0, _LIT0
    ldr r1, [sp, #0x8]
    ldr r0, [r0]
    add r2, sp, #0x10
    add r0, r0, #0x1c
    bl func_020557b8
    ldr r0, [sp, #0x14]
    cmp r0, #0x6
    movne r5, #0xb
    bne .L_16c
    ldr r0, _LIT1
    mov r6, #0x30
    add r1, sp, #0xc
    add r2, sp, #0x18
    mov r3, #0x2f
    strb r6, [sp, #0xc]
    bl func_02045b1c
    add r0, sp, #0xc
    mov r1, #0x0
    mov r2, #0xa
    bl func_020acca0
    and r6, r0, #0xff
    ldr r0, _LIT2
    add r1, sp, #0xc
    add r2, sp, #0x18
    mov r3, #0x2f
    bl func_02045b1c
    add r0, sp, #0xc
    mov r1, #0x0
    mov r2, #0xa
    bl func_020acca0
    and r0, r0, #0xff
    cmp r0, r6
    moveq r5, #0xd
    beq .L_16c
    ldr r6, [sp, #0x238]
    ldr r1, _LIT3
    mov r0, r4
    mov r3, r5
    mov r2, #0x0
    str r6, [sp]
    bl func_0205121c
    add sp, sp, #0x224
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_16c:
    mov r0, r5
    mov r1, #0x0
    bl func_0204525c
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r4, [r0]
    mov r0, r5
    str r1, [sp]
    ldr r2, [r4, #0x8c]
    mov r3, r1
    str r2, [sp, #0x4]
    ldr r4, [r4, #0x88]
    mov r2, #0x1
    blx r4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_1d8
    ldr r0, [r0, #0x24]
    cmp r0, #0x5
    bne .L_1d8
    mov r0, #0x3
    bl func_020466f4
    ldr r1, _LIT4
    mov r0, #0x1
    mov r2, #0x0
    bl func_02049038
.L_1d8:
    mov r0, #0x1
    add sp, sp, #0x224
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219daec
_LIT1: .word data_020ff918
_LIT2: .word data_020ff91c
_LIT3: .word func_02046254
_LIT4: .word data_020ff908
