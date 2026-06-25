; func_0201c64c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020c5cb0
        .extern data_02104e6c
        .extern func_02013a30
        .extern func_020189f8
        .extern func_02018b00
        .extern func_020193f8
        .extern func_020195b8
        .extern func_02019630
        .extern func_02019648
        .extern func_0201967c
        .extern func_020196a4
        .extern func_0201bb64
        .extern func_0201bbfc
        .extern func_0201bd9c
        .extern func_0201bf74
        .extern func_0201c168
        .extern func_0201c254
        .extern func_0201c444
        .extern func_0201c50c
        .extern func_0201c560
        .extern func_0201c5f8
        .global func_0201c64c
        .arm
func_0201c64c:
    stmdb sp!, {r3, r4, r5, lr}
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8e8]
    bic r0, r0, #0x80000
    bic r0, r0, #0x100000
    str r0, [r4, #0x8e8]
    ldr r0, [r4, #0x918]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_1a4
    b .L_1a4
    b .L_c4
    b .L_104
    b .L_40
    b .L_6c
.L_40:
    ldr r0, [r4, #0x820]
    tst r0, #0x10000
    beq .L_58
    mov r0, #0x10000
    mov r1, #0x1
    bl func_0201bbfc
.L_58:
    mov r0, #0x0
    str r0, [r4, #0x814]
    str r0, [r4, #0x918]
    str r0, [r4, #0x820]
    b .L_2ec
.L_6c:
    ldr r0, [r4, #0x820]
    tst r0, #0x8000
    beq .L_94
    mov r0, #0x8000
    mov r1, #0x1
    bl func_0201bbfc
    mov r0, #0x0
    str r0, [r4, #0x918]
    str r0, [r4, #0x820]
    b .L_b8
.L_94:
    tst r0, #0x20000
    beq .L_b8
    mov r0, #0x20000
    mov r1, #0x1
    bl func_0201bbfc
    mov r0, #0x3
    str r0, [r4, #0x918]
    mov r0, #0x10000
    str r0, [r4, #0x820]
.L_b8:
    mov r0, #0x0
    str r0, [r4, #0x814]
    b .L_2ec
.L_c4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x938]
    cmp r0, #0x1
    bne .L_e8
    mov r0, #0x2
    str r0, [r4, #0x918]
    mov r0, #0x1
    str r0, [r4, #0x814]
    b .L_f8
.L_e8:
    mov r0, #0x0
    str r0, [r4, #0x814]
    str r0, [r4, #0x918]
    bl func_02019648
.L_f8:
    mov r0, #0x0
    str r0, [r4, #0x810]
    b .L_2ec
.L_104:
    bl func_020195b8
    ldr r1, [r4, #0x824]
    mov r5, r0
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_0201c444
    ldr r0, [r4, #0x824]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_0201c560
    bl func_0201c50c
    ldr r0, [r4, #0x824]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_0201c5f8
    add r0, r4, #0x810
    bl func_0201c254
    mov r0, #0x0
    str r0, [r4, #0x814]
    str r0, [r4, #0x918]
    str r0, [r4, #0x820]
    ldr r0, [r4, #0x824]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_020193f8
    cmp r0, #0x0
    ldr r0, [r4, #0x8e8]
    orrne r0, r0, #0x100000
    orreq r0, r0, #0x80000
    str r0, [r4, #0x8e8]
    mov r0, #0x0
    bl func_02019648
    cmp r5, #0x1
    bne .L_2ec
    bl func_020196a4
    cmp r0, #0x0
    beq .L_2ec
    mov r0, #0x7
    bl func_02018b00
    b .L_2ec
.L_1a4:
    bl func_02013a30
    ldr r0, [r4, #0x820]
    cmp r0, #0x0
    ldreq r0, [r4, #0x818]
    cmpeq r0, #0x0
    bne .L_1c4
    add r0, r4, #0x810
    bl func_0201bd9c
.L_1c4:
    ldr r0, [r4, #0x828]
    bic r0, r0, #0x2000000
    str r0, [r4, #0x828]
    ldr r0, [r4, #0x818]
    cmp r0, #0x0
    beq .L_200
    bl func_0201c168
    mov r0, #0x0
    str r0, [r4, #0x820]
    str r0, [r4, #0x818]
    ldr r1, [r4, #0x828]
    orr r1, r1, #0x2000000
    str r1, [r4, #0x828]
    bl func_02019648
    b .L_2d4
.L_200:
    bl func_020189f8
    mov r5, r0
    bl func_0201967c
    cmp r0, #0x0
    beq .L_228
    bl func_02019630
    cmp r0, #0x65
    beq .L_228
    bl func_0201bf74
    b .L_2b0
.L_228:
    ldr r0, [r4, #0x820]
    tst r0, #0x2000
    beq .L_244
    bl func_0201bb64
    mov r0, #0x0
    str r0, [r4, #0x820]
    b .L_2b0
.L_244:
    tst r0, #0x4000
    mov r1, #0x0
    beq .L_264
    mov r0, #0x4000
    bl func_0201bbfc
    mov r0, #0x0
    str r0, [r4, #0x820]
    b .L_2b0
.L_264:
    tst r0, #0x8000
    beq .L_278
    mov r0, #0x8000
    bl func_0201bbfc
    b .L_2b0
.L_278:
    tst r0, #0x10000
    beq .L_28c
    mov r0, #0x10000
    bl func_0201bbfc
    b .L_2b0
.L_28c:
    tst r0, #0x20000
    beq .L_2a0
    mov r0, #0x20000
    bl func_0201bbfc
    b .L_2b0
.L_2a0:
    ldr r0, _LIT1
    str r1, [r4, #0x820]
    str r1, [r4, #0x818]
    .word 0xeb065273
.L_2b0:
    mov r0, r5
    bl func_020193f8
    cmp r0, #0x0
    ldr r0, [r4, #0x8e8]
    orrne r0, r0, #0x100000
    orreq r0, r0, #0x80000
    str r0, [r4, #0x8e8]
    mov r0, #0x0
    bl func_02019648
.L_2d4:
    ldr r0, [r4, #0x81c]
    bic r0, r0, #0xf
    str r0, [r4, #0x81c]
    ldr r0, [r4, #0x828]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x828]
.L_2ec:
    add r0, r4, #0x810
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_020c5cb0
