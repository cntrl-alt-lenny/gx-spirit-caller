; func_ov002_0224ff28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_ov002_02253458
        .extern func_ov002_02257b48
        .global func_ov002_0224ff28
        .arm
func_ov002_0224ff28:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x50
    ldr r1, _LIT0
    mov sl, r0
    ldr r0, [r1, #0x484]
    and r2, sl, #0x1
    cmp r0, #0x0
    ldrne r0, [r1, #0x48c]
    mov r6, #0x0
    subne r9, r0, #0x18
    ldr r0, _LIT1
    moveq r9, r6
    mul r1, r2, r0
    ldr r0, _LIT2
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_c0
    ldr r0, _LIT3
    ldr fp, _LIT0
    add r8, r0, r1
    add r0, r8, #0x18
    add r7, r0, #0x400
.L_5c:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202b878
    cmp r0, #0x17
    bne .L_ac
    mov r0, r5
    bl func_0202b8c0
    cmp r0, #0x0
    bne .L_ac
    ldr r0, [fp, #0x48c]
    mov r1, r9
    strh r5, [r0]
    ldr r0, [fp, #0x48c]
    bl func_ov002_02257b48
    cmp r0, #0x0
    addne r0, sp, #0x0
    strneb r4, [r0, r6]
    addne r6, r6, #0x1
.L_ac:
    ldr r0, [r8, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r7, r7, #0x4
    bcc .L_5c
.L_c0:
    cmp r6, #0x0
    mov r7, #0x0
    ble .L_f0
    add r5, sp, #0x0
    mov r4, #0xe
.L_d4:
    ldrb r2, [r5], #0x1
    mov r0, sl
    mov r1, r4
    bl func_ov002_02253458
    add r7, r7, #0x1
    cmp r7, r6
    blt .L_d4
.L_f0:
    ldr r0, _LIT0
    ldr r1, _LIT4
    ldr r0, [r0, #0x48c]
    strh r1, [r0]
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf180
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00001935
