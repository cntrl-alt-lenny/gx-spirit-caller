; func_ov002_02241bf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c2e34
        .extern func_ov002_0223de04
        .global func_ov002_02241bf8
        .arm
func_ov002_02241bf8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r8, r0
    ldrh r1, [r8]
    ldr r0, _LIT0
    cmp r1, r0
    beq .L_2c
    ldr r0, _LIT1
    cmp r1, r0
    beq .L_48
    b .L_60
.L_2c:
    ldr r2, _LIT2
    add r1, r2, #0x13
    add r0, r2, #0x30
    str r2, [sp]
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    b .L_60
.L_48:
    sub r2, r0, #0x6
    sub r1, r0, #0x4
    sub r0, r0, #0x5
    str r2, [sp]
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
.L_60:
    ldr r5, _LIT3
    ldr r9, _LIT4
    mov r7, #0x0
    mov r4, #0xe
    add r6, sp, #0x0
.L_74:
    ldrh r0, [r8, #0x2]
    ldr r1, [r6, r7, lsl #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c2e34
    movs r3, r0
    bmi .L_d4
    ldrh r1, [r8, #0x2]
    mov r0, r8
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and ip, r1, #0x1
    mla lr, ip, r9, r5
    add ip, lr, #0x18
    add ip, ip, #0x400
    ldr ip, [ip, r3, lsl #0x2]
    mov r3, ip, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_0223de04
    b .L_e0
.L_d4:
    add sp, sp, #0xc
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_e0:
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_74
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000138a
_LIT1: .word 0x000018a4
_LIT2: .word 0x00001288
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00000868
