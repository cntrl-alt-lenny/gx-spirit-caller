; func_0205142c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff9c4
        .extern data_020ffa90
        .extern data_0219dc90
        .extern func_0204548c
        .extern func_020454cc
        .extern func_02049038
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204a4f0
        .extern func_0204aaf4
        .extern func_0204b034
        .extern func_0204f040
        .extern func_0204f0a8
        .extern func_0204f310
        .extern func_02050054
        .extern func_02051618
        .extern func_02068f78
        .extern func_02094688
        .extern func_020aaddc
        .global func_0205142c
        .arm
func_0205142c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x118
    ldr r4, _LIT0
    mov r7, r1
    ldr r1, [r4]
    mov r8, r0
    mov r6, r2
    mov r5, r3
    cmp r1, #0x0
    beq .L_132c
    mov r0, #0x4
    mov r2, #0x0
    bl func_0204548c
    mov r0, r4
    mov r1, #0x0
    str r1, [r0]
.L_132c:
    cmp r7, #0x0
    beq .L_13ac
    add r0, sp, #0x14
    mvn r1, #0x0
    mov r2, #0x20
    mov r3, #0x3
    bl func_0204f040
    mov r4, r0
    ldr r0, _LIT1
    bl func_020aaddc
    rsb r1, r4, #0x100
    sub r4, r1, r0
    mov r1, r4
    mov r0, #0x4
    bl func_020454cc
    movs r1, r0
    ldr r0, _LIT0
    str r1, [r0]
    bne .L_138c
    ldr r1, _LIT2
    mov r0, #0x9
    bl func_02050054
    add sp, sp, #0x118
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_138c:
    mov r0, r7
    mov r2, r4
    bl func_02094688
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, r4
    strb r1, [r0, #-1]
.L_13ac:
    mov r1, r8
    mov r2, r6
    mov r3, r5
    mov r0, #0x0
    bl func_0204f310
    bl func_020498f0
    ldr r1, [sp, #0x130]
    str r1, [r0, #0x474]
    bl func_020498f0
    ldr r1, [sp, #0x134]
    str r1, [r0, #0x478]
    mov r0, #0x2
    bl func_020498dc
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    bne .L_1448
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    mov r2, r0
    mov r0, #0x14
    str r0, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    mov r3, #0x0
    str r3, [sp, #0x8]
    ldr r0, _LIT3
    str r0, [sp, #0xc]
    str r3, [sp, #0x10]
    ldr r0, [r5, #0x2f4]
    ldr r1, [r4, #0x2f4]
    ldr r2, [r2, #0x2f8]
    bl func_02068f78
    str r0, [r6, #0xe4]
.L_1448:
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    bne .L_146c
    mov r0, #0x5
    bl func_0204aaf4
    cmp r0, #0x0
    addne sp, sp, #0x118
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_146c:
    ldr r1, _LIT4
    mov r0, #0x3
    mov r2, #0x0
    bl func_02049038
    bl func_020498f0
    ldr r0, [r0, #0x200]
    bl func_0204f0a8
    bl func_0204aaf4
    cmp r0, #0x0
    addne sp, sp, #0x118
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_020498f0
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    bne .L_14b4
    bl func_020498f0
    ldr r0, [r0, #0x200]
    bl func_02051618
.L_14b4:
    mov r0, #0x0
    bl func_0204b034
    add sp, sp, #0x118
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219dc90
_LIT1: .word data_020ffa90
_LIT2: .word 0xfffec77f
_LIT3: .word func_0204a4f0
_LIT4: .word data_020ff9c4
