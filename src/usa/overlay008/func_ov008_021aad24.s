; func_ov008_021aad24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_0210666c
        .extern data_ov008_021b2660
        .extern data_ov008_021b2670
        .extern data_ov008_021b2c14
        .extern func_02001b84
        .extern func_020068fc
        .extern func_0200973c
        .extern func_02009dd0
        .extern func_02009e80
        .extern func_0202aeec
        .extern func_0202c158
        .extern func_0202c374
        .extern func_0208c79c
        .extern func_0208e2f4
        .extern func_ov008_021ab040
        .extern func_ov008_021b2078
        .global func_ov008_021aad24
        .arm
func_ov008_021aad24:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r2, #0x4000000
    ldr r0, [r2]
    add r1, r2, #0x1000
    bic r0, r0, #0x1f00
    str r0, [r2]
    ldr r0, [r1]
    mov r4, #0x1
    bic r0, r0, #0x1f00
    str r0, [r1]
    bl func_ov008_021b2078
    ldr r0, _LIT0
    bl func_ov008_021ab040
    bl func_0202c158
    bl func_0202aeec
    bl func_0202c374
    mov r5, #0x0
    ldr r0, _LIT1
    ldr r2, _LIT2
    ldr lr, [r0, #0xc]
    ldr ip, _LIT3
    mov r3, r5
    mov r7, r5
    mov r1, r4
.L_518:
    tst lr, r1, lsl r3
    beq .L_574
    ldrh r0, [r2, #0xc]
    add r6, ip, #0x1000
    ldr r9, [r2, #0x18]
    strb r0, [r6, #0x56d]
    str r9, [r6, #0x570]
    ldr r8, [r2, #0x1c]
    ldr r9, [r2, #0x20]
    str r8, [r6, #0x574]
    cmp r0, #0x0
    str r9, [r6, #0x578]
    ldr r8, [r2, #0x24]
    ldr r9, [r2, #0x28]
    str r8, [r6, #0x57c]
    ldr r8, [r2, #0x4]
    ldr r0, [r2, #0x4]
    strb r9, [r6, #0x56f]
    movne r4, r7
    cmp r0, #0x64
    strb r8, [r6, #0x584]
    addge r5, r5, #0x1
    add r2, r2, #0x34
.L_574:
    add r3, r3, #0x1
    cmp r3, #0x1a
    add ip, ip, #0x1c
    blt .L_518
    cmp r4, #0x0
    ldrne r0, _LIT1
    ldrne r0, [r0, #0x564]
    cmpne r0, #0x0
    beq .L_5c4
    ldr r0, _LIT4
    ldrh r1, [r0, #0x50]
    add r1, r1, #0x1
    strh r1, [r0, #0x50]
    ldrh r0, [r0, #0x50]
    cmp r0, #0xa
    bcc .L_5bc
    mov r0, #0x0
    bl func_0200973c
.L_5bc:
    bl func_02009dd0
    bl func_02009e80
.L_5c4:
    cmp r5, #0xd
    blt .L_5d4
    mov r0, #0x1
    bl func_0200973c
.L_5d4:
    mov r1, #0x0
    ldr r0, _LIT5
    mov r2, r1
    bl func_0208e2f4
    ldr r4, _LIT6
    ldr r0, _LIT7
    ldrh r2, [r4]
    sub r3, r4, #0x4a
    mov r1, #0x0
    bic r2, r2, #0x3f00
    strh r2, [r4]
    ldrh r2, [r4]
    bic r2, r2, #0x3f
    strh r2, [r4]
    ldr r2, [r3]
    bic r2, r2, #0xe000
    str r2, [r3]
    bl func_0208c79c
    add r0, r4, #0x22
    mov r1, #0x0
    bl func_0208c79c
    bl func_02001b84
    bl func_020068fc
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov008_021b2c14
_LIT1: .word data_ov008_021b2660
_LIT2: .word data_ov008_021b2670
_LIT3: .word data_02104e6c
_LIT4: .word data_0210666c
_LIT5: .word 0x04001050
_LIT6: .word 0x0400104a
_LIT7: .word 0x0400006c
