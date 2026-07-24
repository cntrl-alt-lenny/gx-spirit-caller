; func_0204f0a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff980
        .extern data_020ffa44
        .extern data_020ffa50
        .extern data_0219dc90
        .extern data_0219dcb4
        .extern func_020498f0
        .extern func_0204f040
        .extern func_02068cd8
        .extern func_02068df0
        .extern OS_SNPrintf
        .global func_0204f0a8
        .arm
func_0204f0a8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x1b0
    mov r7, #0x8
    mov r6, #0xa
    mov r5, #0x32
    mov r4, #0x33
    mov r3, #0x34
    mov r2, #0x35
    mov r1, #0x36
    strb r7, [sp, #0x10c]
    strb r6, [sp, #0x10d]
    strb r5, [sp, #0x10e]
    strb r4, [sp, #0x10f]
    strb r3, [sp, #0x110]
    strb r2, [sp, #0x111]
    strb r1, [sp, #0x112]
    mov r5, r0
    mov r4, #0x7
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_1ca8
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_1cd8
.L_1ca8:
    add r1, sp, #0x100
    ldr r2, _LIT0
    add r1, r1, #0x13
    mov r3, #0x0
.L_1cb8:
    ldrb r0, [r2]
    add r3, r3, #0x1
    add r2, r2, #0xc
    cmp r0, #0x0
    strneb r0, [r1], #0x1
    addne r4, r4, #0x1
    cmp r3, #0x9a
    blt .L_1cb8
.L_1cd8:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_1d90
    b .L_1d90
    b .L_1d90
    b .L_1d70
    b .L_1d04
    b .L_1d70
    b .L_1d70
.L_1d04:
    bl func_020498f0
    ldr r0, [r0, #0x208]
    cmp r0, #0x0
    bne .L_1d68
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldr r1, [r6, #0x200]
    ldrb r2, [r5, #0x16]
    ldrb r3, [r0, #0x15]
    add r0, sp, #0xc
    bl func_0204f040
    ldr r0, _LIT1
    ldr r5, [r0]
    cmp r5, #0x0
    beq .L_1d90
    add r0, sp, #0xc
    ldr r2, _LIT2
    mov r3, r0
    mov r1, #0x100
    str r5, [sp]
    bl OS_SNPrintf
    b .L_1d90
.L_1d68:
    bl func_020498f0
    ldr r5, [r0, #0x208]
.L_1d70:
    ldr r2, _LIT3
    ldr r3, _LIT4
    add r0, sp, #0xc
    mov r1, #0x100
    str r5, [sp]
    bl OS_SNPrintf
    bl func_020498f0
    str r5, [r0, #0x204]
.L_1d90:
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    bl func_02068cd8
    mov sl, #0x0
    add r9, sp, #0xc
    add r5, sp, #0x10c
    mov r6, sl
    mov r8, #0x6
    mov r7, #0x1
.L_1db4:
    bl func_020498f0
    str r4, [sp]
    str r9, [sp, #0x4]
    str r8, [sp, #0x8]
    ldr r0, [r0, #0xe4]
    mov r1, r7
    mov r2, r6
    mov r3, r5
    bl func_02068df0
    cmp r0, #0x0
    addeq sp, sp, #0x1b0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r0, #0x2
    addne sp, sp, #0x1b0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add sl, sl, #0x1
    cmp sl, #0x5
    blt .L_1db4
    add sp, sp, #0x1b0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219dcb4
_LIT1: .word data_0219dc90
_LIT2: .word data_020ffa44
_LIT3: .word data_020ffa50
_LIT4: .word data_020ff980
