; func_0203abe0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d068
        .extern data_0219d070
        .extern data_0219d07c
        .extern data_0219d088
        .extern data_0219d148
        .extern data_0219d388
        .extern data_0219d9a8
        .extern func_020385bc
        .extern func_0203c16c
        .extern func_0207d12c
        .extern func_0207d1b8
        .extern func_020885a0
        .extern func_0208904c
        .extern func_020919d8
        .extern func_02091d24
        .extern func_02097ff0
        .extern func_02098088
        .extern func_02098388
        .global func_0203abe0
        .arm
func_0203abe0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x58
    mov r6, r0
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r4, _LIT1
    bl func_0207d1b8
    ldr r0, _LIT2
    mov r1, #0x0
    bl func_0207d1b8
    ldr r8, _LIT3
    ldr r5, _LIT2
    mov r7, #0x0
.L_78:
    mov r0, r5
    mov r1, r8
    bl func_0207d12c
    add r7, r7, #0x1
    cmp r7, #0x18
    add r8, r8, #0x18
    blt .L_78
    add r0, sp, #0x8
    bl func_0208904c
    add r0, sp, #0x10
    bl func_02098388
    add r1, sp, #0x8
    add r0, sp, #0x10
    ldmia r1, {r1, r2}
    bl func_02098088
    mov r1, #0x0
    ldr r0, _LIT4
    mov r5, r1
.L_c0:
    add r1, r1, #0x1
    cmp r1, #0x10
    strb r5, [r0], #0x1
    blt .L_c0
    mov r9, #0x7f
    mov sl, #0x0
    mov r8, r9
    mov r7, #0x40
.L_e0:
    ldr r0, [sp, #0x34]
    strb r5, [r4, #0xbc]
    str r0, [r4, #0x64]
    str r0, [r4, #0x60]
    add r0, r4, #0x4
    bl func_020885a0
    strh sl, [r4, #0xb0]
    str sl, [r4, #0x74]
    str sl, [r4, #0x78]
    str sl, [r4, #0x7c]
    str sl, [r4, #0x80]
    str sl, [r4, #0x84]
    mov r1, r9
    add r0, r4, #0x88
    strb sl, [r4, #0xc1]
    bl func_020385bc
    mov r1, r8
    add r0, r4, #0x94
    bl func_020385bc
    mov r1, r7
    add r0, r4, #0xa0
    bl func_020385bc
    add r5, r5, #0x1
    cmp r5, #0x8
    add r4, r4, #0xc4
    blt .L_e0
    add r0, sp, #0x10
    bl func_02097ff0
    ldr r0, _LIT5
    mov r2, #0x0
    str r2, [r0]
    mov r1, #0x600
    stmia sp, {r1, r6}
    ldr r3, [r0, #0x4]
    ldr r0, _LIT6
    ldr r1, _LIT7
    add r3, r3, #0x600
    bl func_02091d24
    ldr r0, _LIT6
    bl func_020919d8
    add sp, sp, #0x58
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219d070
_LIT1: .word data_0219d388
_LIT2: .word data_0219d07c
_LIT3: .word data_0219d148
_LIT4: .word data_0219d9a8
_LIT5: .word data_0219d068
_LIT6: .word data_0219d088
_LIT7: .word func_0203c16c
