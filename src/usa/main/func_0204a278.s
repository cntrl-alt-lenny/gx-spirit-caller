; func_0204a278 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff894
        .extern data_020ff8a0
        .extern func_02045948
        .extern func_0204987c
        .extern func_020689ac
        .extern func_02068aa8
        .extern func_02068c34
        .extern func_02068c44
        .extern func_02068c54
        .extern func_02068cb0
        .global func_0204a278
        .arm
func_0204a278:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r0, [sp]
    mov r8, r1
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c44
    cmp r0, #0x0
    ble .L_188
    mov r0, #0x80
    mov r4, #0x1
    mov r5, r8
    str r0, [sp, #0x8]
    mov fp, #0x100
.L_40:
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    mov r1, r8
    bl func_02068c54
    mov r6, r0
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_dc
    ldr r1, _LIT0
    mov r0, r6
    mov r2, r5
    bl func_020689ac
    mov r9, r0
    mov sl, r5
    mov r7, r4
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_d4
.L_90:
    bl func_0204987c
    add r0, r0, r7, lsl #0x2
    ldr r0, [r0, #0xf4]
    cmp r9, r0
    bne .L_c0
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    mov r1, r6
    bl func_02068cb0
    mov sl, r4
    sub r8, r8, #0x1
    b .L_d4
.L_c0:
    add r7, r7, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r7, r0
    ble .L_90
.L_d4:
    cmp sl, #0x0
    bne .L_170
.L_dc:
    bl func_0204987c
    ldr r0, [r0, #0x46c]
    cmp r0, #0x0
    beq .L_158
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    ldr r1, [r0, #0x470]
    ldr r2, [r7, #0x46c]
    mov r0, r8
    blx r2
    mov r7, r0
    cmp r7, #0x0
    ble .L_13c
    ldr r0, _LIT1
    cmp r7, r0
    movgt r7, r0
    mov r0, fp
    bl func_02045948
    orr r2, r0, r7, lsl #0x8
    ldr r1, _LIT2
    mov r0, r6
    bl func_02068aa8
    b .L_170
.L_13c:
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    mov r1, r6
    bl func_02068cb0
    str r4, [sp, #0x4]
    sub r8, r8, #0x1
    b .L_170
.L_158:
    ldr r0, [sp, #0x8]
    bl func_02045948
    mov r2, r0
    ldr r1, _LIT2
    mov r0, r6
    bl func_02068aa8
.L_170:
    add r8, r8, #0x1
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c44
    cmp r8, r0
    blt .L_40
.L_188:
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_1c0
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c44
    cmp r0, #0x0
    beq .L_1c0
    bl func_0204987c
    mov r1, #0x0
    ldr r0, [r0, #0xe4]
    ldr r2, _LIT2
    mov r3, r1
    bl func_02068c34
.L_1c0:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_1e8
    bl func_0204987c
    ldr r0, [r0, #0xe4]
    bl func_02068c44
    cmp r0, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e8:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020ff8a0
_LIT1: .word 0x007fffff
_LIT2: .word data_020ff894
