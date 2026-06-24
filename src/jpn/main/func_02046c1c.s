; func_02046c1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff828
        .extern data_020ff838
        .extern data_020ff83c
        .extern data_0219da0c
        .extern func_0204520c
        .extern func_02045230
        .extern func_02045a74
        .extern func_020461ac
        .extern func_0204664c
        .extern func_02046788
        .extern func_02048fc4
        .extern func_02049118
        .extern func_020511a8
        .extern func_02055654
        .extern func_020556c4
        .extern func_02055744
        .extern func_020acbac
        .global func_02046c1c
        .arm
func_02046c1c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x224
    mvn ip, #0x0
    mov r7, r0
    mov r6, r1
    mov r4, r2
    mov r5, r3
    str ip, [sp, #0x8]
    bl func_02045230
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
    bl func_02046788
    ldr r1, _LIT0
    mov r0, #0x5
    ldr r2, [r1]
    str r6, [r2, #0x88]
    ldr r1, [r1]
    str r4, [r1, #0x8c]
    bl func_0204664c
    mov r0, r7
    bl func_02049118
    movs r4, r0
    beq .L_98
    ldr r0, _LIT0
    mov r1, r4
    ldr r0, [r0]
    add r0, r0, #0x1c
    bl func_02055654
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
    bl func_020556c4
    ldr r0, _LIT0
    ldr r1, [sp, #0x8]
    ldr r0, [r0]
    add r2, sp, #0x10
    add r0, r0, #0x1c
    bl func_02055744
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
    bl func_02045a74
    add r0, sp, #0xc
    mov r1, #0x0
    mov r2, #0xa
    bl func_020acbac
    and r6, r0, #0xff
    ldr r0, _LIT2
    add r1, sp, #0xc
    add r2, sp, #0x18
    mov r3, #0x2f
    bl func_02045a74
    add r0, sp, #0xc
    mov r1, #0x0
    mov r2, #0xa
    bl func_020acbac
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
    bl func_020511a8
    add sp, sp, #0x224
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_16c:
    mov r0, r5
    mov r1, #0x0
    bl func_0204520c
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
    bl func_0204664c
    ldr r1, _LIT4
    mov r0, #0x1
    mov r2, #0x0
    bl func_02048fc4
.L_1d8:
    mov r0, #0x1
    add sp, sp, #0x224
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_0219da0c
_LIT1: .word data_020ff838
_LIT2: .word data_020ff83c
_LIT3: .word func_020461ac
_LIT4: .word data_020ff828
