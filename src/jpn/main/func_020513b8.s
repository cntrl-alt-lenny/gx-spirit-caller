; func_020513b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff8e4
        .extern data_020ff9b0
        .extern data_0219dbb0
        .extern func_0204543c
        .extern func_0204547c
        .extern func_02048fc4
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204a47c
        .extern func_0204aa80
        .extern func_0204afc0
        .extern func_0204efcc
        .extern func_0204f034
        .extern func_0204f29c
        .extern func_0204ffe0
        .extern func_020515a4
        .extern func_02068f04
        .extern func_02094688
        .extern func_020aace8
        .global func_020513b8
        .arm
func_020513b8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x118
    ldr r4, _LIT0
    mov r7, r1
    ldr r1, [r4]
    mov r8, r0
    mov r6, r2
    mov r5, r3
    cmp r1, #0x0
    beq .L_40
    mov r0, #0x4
    mov r2, #0x0
    bl func_0204543c
    mov r0, r4
    mov r1, #0x0
    str r1, [r0]
.L_40:
    cmp r7, #0x0
    beq .L_c0
    add r0, sp, #0x14
    mvn r1, #0x0
    mov r2, #0x20
    mov r3, #0x3
    bl func_0204efcc
    mov r4, r0
    ldr r0, _LIT1
    bl func_020aace8
    rsb r1, r4, #0x100
    sub r4, r1, r0
    mov r1, r4
    mov r0, #0x4
    bl func_0204547c
    movs r1, r0
    ldr r0, _LIT0
    str r1, [r0]
    bne .L_a0
    ldr r1, _LIT2
    mov r0, #0x9
    bl func_0204ffe0
    add sp, sp, #0x118
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a0:
    mov r0, r7
    mov r2, r4
    bl func_02094688
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, r4
    strb r1, [r0, #-1]
.L_c0:
    mov r1, r8
    mov r2, r6
    mov r3, r5
    mov r0, #0x0
    bl func_0204f29c
    bl func_0204987c
    ldr r1, [sp, #0x130]
    str r1, [r0, #0x46c]
    bl func_0204987c
    ldr r1, [sp, #0x134]
    str r1, [r0, #0x470]
    mov r0, #0x2
    bl func_02049868
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    bne .L_15c
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    mov r5, r0
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
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
    ldr r0, [r5, #0x2ec]
    ldr r1, [r4, #0x2ec]
    ldr r2, [r2, #0x2f0]
    bl func_02068f04
    str r0, [r6, #0xe4]
.L_15c:
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    cmp r0, #0x0
    bne .L_180
    mov r0, #0x5
    bl func_0204aa80
    cmp r0, #0x0
    addne sp, sp, #0x118
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_180:
    ldr r1, _LIT4
    mov r0, #0x3
    mov r2, #0x0
    bl func_02048fc4
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    bl func_0204f034
    bl func_0204aa80
    cmp r0, #0x0
    addne sp, sp, #0x118
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_0204987c
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    bne .L_1c8
    bl func_0204987c
    ldr r0, [r0, #0x1f8]
    bl func_020515a4
.L_1c8:
    mov r0, #0x0
    bl func_0204afc0
    add sp, sp, #0x118
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219dbb0
_LIT1: .word data_020ff9b0
_LIT2: .word 0xfffec77f
_LIT3: .word func_0204a47c
_LIT4: .word data_020ff8e4
