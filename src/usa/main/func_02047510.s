; func_02047510 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern data_0219e448
        .extern data_0219e548
        .extern func_0204524c
        .extern func_02045c58
        .extern func_02045c64
        .extern func_02045fe0
        .extern func_02046384
        .extern func_02046788
        .extern func_02048208
        .extern func_020494e0
        .extern func_02050158
        .extern func_0205172c
        .extern func_02052600
        .extern func_02094688
        .extern func_020aace8
        .global func_02047510
        .arm
func_02047510:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr ip, _LIT0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    str r0, [ip]
    bl func_0204524c
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r1, [r0]
    ldr r3, _LIT1
    str r2, [r1]
    ldr r1, [r0]
    ldr r2, _LIT2
    str r3, [r1, #0x4]
    ldr r1, [r0]
    ldr ip, [sp, #0x24]
    str r2, [r1, #0x8]
    cmp ip, #0x0
    ldr r2, [r0]
    ldr r3, _LIT3
    ldr r1, _LIT4
    str r3, [r2, #0xc]
    ldr r0, [r0]
    ldr r3, [sp, #0x28]
    str r1, [r0, #0x10]
    ldr r0, _LIT0
    moveq ip, #0x2000
    ldr r0, [r0]
    cmp r3, #0x0
    str ip, [r0, #0x14]
    moveq r3, #0x2000
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1]
    ldr ip, _LIT5
    str r3, [r2, #0x18]
    ldr r2, [r1]
    ldr r3, _LIT6
    str r0, [r2, #0x1c]
    ldr r2, [r1]
    str r6, [r2, #0x20]
    ldr r2, [r1]
    str r0, [r2, #0x24]
    ldr r2, [r1]
    str r0, [r2, #0x28]
    ldr r2, [r1]
    strb r0, [r2, #0x2c]
    ldr r2, [r1]
    strb r0, [r2, #0x2d]
    ldr r2, [r1]
    str r0, [r2, #0x64]
    ldr r2, [r1]
    str ip, [r2, #0x68]
    ldr r2, [r1]
    str r3, [r2, #0x6c]
    ldr r2, [r1]
    str r0, [r2, #0x70]
    ldr r2, [r1]
    str r0, [r2, #0x74]
    ldr r2, [r1]
    str r0, [r2, #0x78]
    ldr r2, [r1]
    str r0, [r2, #0x7c]
    ldr r2, [r1]
    str r0, [r2, #0x80]
    ldr r2, [r1]
    str r0, [r2, #0x84]
    ldr r2, [r1]
    str r0, [r2, #0x88]
    ldr r2, [r1]
    str r0, [r2, #0x8c]
    ldr r2, [r1]
    str r0, [r2, #0x90]
    ldr r1, [r1]
    str r0, [r1, #0x94]
    bl func_02046788
    ldr r0, _LIT0
    mov r3, r5
    ldr r2, [r0]
    ldr r1, [r6, #0x24]
    ldr r0, _LIT7
    str r1, [sp]
    add r1, r2, #0x2e
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r5, #0x0
    add r0, r2, #0x98
    mov r1, r6
    add r2, r2, #0x1c
    str r5, [sp, #0xc]
    bl func_02048208
    ldr r0, _LIT0
    ldr r2, [sp, #0x30]
    ldr r5, [r0]
    ldr r3, [sp, #0x2c]
    str r2, [sp]
    add r0, r5, #0x2f8
    add r1, r5, #0x1c
    add r2, r5, #0x2e
    bl func_020494e0
    ldr r0, _LIT0
    ldr r1, _LIT5
    ldr r2, [r0]
    ldr r0, _LIT6
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [sp, #0x2c]
    ldr r0, [sp, #0x30]
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    add r0, r2, #0x354
    add r1, r2, #0x1c
    add r3, r2, #0x4
    bl func_0205172c
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x7d0
    bl func_02052600
    mov r0, r4
    bl func_020aace8
    cmp r0, #0x100
    movcs r5, #0xff
    bcs .L_200
    mov r0, r4
    bl func_020aace8
    mov r5, r0
.L_200:
    ldr r1, _LIT5
    mov r0, r4
    mov r2, r5
    bl func_02094688
    ldr r0, [sp, #0x20]
    ldr r1, _LIT5
    mov r2, #0x0
    strb r2, [r1, r5]
    bl func_020aace8
    cmp r0, #0x100
    movcs r4, #0xff
    bcs .L_23c
    ldr r0, [sp, #0x20]
    bl func_020aace8
    mov r4, r0
.L_23c:
    ldr r0, [sp, #0x20]
    ldr r1, _LIT6
    mov r2, r4
    bl func_02094688
    ldr r0, _LIT6
    mov r1, #0x0
    strb r1, [r0, r4]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219da0c
_LIT1: .word func_02050158
_LIT2: .word func_02045fe0
_LIT3: .word func_02045c64
_LIT4: .word func_02045c58
_LIT5: .word data_0219e448
_LIT6: .word data_0219e548
_LIT7: .word func_02046384
