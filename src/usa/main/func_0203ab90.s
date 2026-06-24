; func_0203ab90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219cf88
        .extern data_0219cf90
        .extern data_0219cf9c
        .extern data_0219cfa8
        .extern data_0219d068
        .extern data_0219d2a8
        .extern data_0219d8c8
        .extern func_0203856c
        .extern func_0203c11c
        .extern func_0207d044
        .extern func_0207d0d0
        .extern func_020884b8
        .extern func_02088f64
        .extern func_020918f0
        .extern func_02091c3c
        .extern func_02097efc
        .extern func_02097f94
        .extern func_02098294
        .global func_0203ab90
        .arm
func_0203ab90:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x58
    mov r6, r0
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r4, _LIT1
    bl func_0207d0d0
    ldr r0, _LIT2
    mov r1, #0x0
    bl func_0207d0d0
    ldr r8, _LIT3
    ldr r5, _LIT2
    mov r7, #0x0
.L_34:
    mov r0, r5
    mov r1, r8
    bl func_0207d044
    add r7, r7, #0x1
    cmp r7, #0x18
    add r8, r8, #0x18
    blt .L_34
    add r0, sp, #0x8
    bl func_02088f64
    add r0, sp, #0x10
    bl func_02098294
    add r1, sp, #0x8
    add r0, sp, #0x10
    ldmia r1, {r1, r2}
    bl func_02097f94
    mov r1, #0x0
    ldr r0, _LIT4
    mov r5, r1
.L_7c:
    add r1, r1, #0x1
    cmp r1, #0x10
    strb r5, [r0], #0x1
    blt .L_7c
    mov r9, #0x7f
    mov sl, #0x0
    mov r8, r9
    mov r7, #0x40
.L_9c:
    ldr r0, [sp, #0x34]
    strb r5, [r4, #0xbc]
    str r0, [r4, #0x64]
    str r0, [r4, #0x60]
    add r0, r4, #0x4
    bl func_020884b8
    strh sl, [r4, #0xb0]
    str sl, [r4, #0x74]
    str sl, [r4, #0x78]
    str sl, [r4, #0x7c]
    str sl, [r4, #0x80]
    str sl, [r4, #0x84]
    mov r1, r9
    add r0, r4, #0x88
    strb sl, [r4, #0xc1]
    bl func_0203856c
    mov r1, r8
    add r0, r4, #0x94
    bl func_0203856c
    mov r1, r7
    add r0, r4, #0xa0
    bl func_0203856c
    add r5, r5, #0x1
    cmp r5, #0x8
    add r4, r4, #0xc4
    blt .L_9c
    add r0, sp, #0x10
    bl func_02097efc
    ldr r0, _LIT5
    mov r2, #0x0
    str r2, [r0]
    mov r1, #0x600
    stmia sp, {r1, r6}
    ldr r3, [r0, #0x4]
    ldr r0, _LIT6
    ldr r1, _LIT7
    add r3, r3, #0x600
    bl func_02091c3c
    ldr r0, _LIT6
    bl func_020918f0
    add sp, sp, #0x58
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219cf90
_LIT1: .word data_0219d2a8
_LIT2: .word data_0219cf9c
_LIT3: .word data_0219d068
_LIT4: .word data_0219d8c8
_LIT5: .word data_0219cf88
_LIT6: .word data_0219cfa8
_LIT7: .word func_0203c11c
