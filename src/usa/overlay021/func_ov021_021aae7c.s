; func_ov021_021aae7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .extern data_020b4674
        .extern data_02103fcc
        .extern data_ov021_0222ce64
        .extern func_0202b08c
        .extern func_0202bacc
        .extern func_0202e2a4
        .global func_ov021_021aae7c
        .arm
func_ov021_021aae7c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    mov sl, r0
    mov r0, #0x0
    mov r2, #0x19c
    bl Fill32
    mov r2, #0x0
    str r2, [sl, #0x38]
    str r2, [sl, #0x40]
    str r2, [sl, #0x44]
    str r2, [sl, #0x48]
    ldr r0, _LIT1
    str r2, [sl, #0x4c]
    ldr r1, [r0, #0x38]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    mov r1, #0x4
    str r3, [sl, #0x54]
    bl Task_PostLocked
    ldr r4, _LIT3
    ldr r1, _LIT4
    str r0, [sl, #0x58]
    ldr r0, [r1]
    mov r8, #0x0
    ldr fp, _LIT5
    str r8, [sl, #0x5c]
    sub r9, r0, #0x1
    sub r5, r4, #0x1
    sub r6, r4, #0x2
.L_80:
    add r0, r8, #0x1
    bl func_0202b08c
    mov r7, r0
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_dc
    cmp r7, r6
    cmpne r7, r5
    cmpne r7, r4
    beq .L_dc
    mov r0, r7
    bl func_0202bacc
    cmp r0, #0x0
    beq .L_dc
    ldr r0, [sl, #0x5c]
    mov r1, r0
    add r0, r0, #0x1
    str r0, [sl, #0x5c]
    ldr r0, [sl, #0x58]
    str r7, [r0, r1, lsl #0x2]
    ldr r0, [sl, #0x5c]
    cmp r0, fp
    bge .L_e8
.L_dc:
    add r8, r8, #0x1
    cmp r8, r9
    blt .L_80
.L_e8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov021_0222ce64
_LIT1: .word data_02103fcc
_LIT2: .word 0x00001130
_LIT3: .word 0x00001388
_LIT4: .word data_020b4674
_LIT5: .word 0x0000044c
