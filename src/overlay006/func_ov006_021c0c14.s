; func_ov006_021c0c14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_ov006_021cc118
        .extern data_ov006_021cc20c
        .extern data_ov006_0224f448
        .extern data_ov006_0225e138
        .extern func_0208dd9c
        .extern func_02094504
        .extern func_020b3870
        .extern func_ov006_021cb0d8
        .extern func_ov006_021cb158
        .global func_ov006_021c0c14
        .arm
func_ov006_021c0c14:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    str r0, [sp, #0x4]
    ldr r4, _LIT0
    bl func_0208dd9c
    mov r5, r0
    add r1, r5, #0x1040
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    mov r9, #0x0
    mov sl, r9
    add r7, r5, #0x1440
    mov r8, r9
    mov r6, #0x4
.L_1754:
    mov r0, r8
    mov r2, r6
    add r1, r7, sl
    bl Fill32
    add r9, r9, #0x1
    cmp r9, #0x20
    add sl, sl, #0x20
    blt .L_1754
    ldr r0, [sp, #0x4]
    ldr r0, [r0, #0x50]
    cmp r0, #0x4
    addeq sp, sp, #0x8
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sp, #0x4]
    mov r0, r4
    add r1, r1, #0x4
    add r2, r5, #0x40
    bl func_ov006_021cb0d8
    ldr r9, _LIT1
    mov fp, #0x0
.L_17a8:
    ldr r0, [sp, #0x4]
    ldrsh r3, [r9, #0x2]
    ldr r1, [r0, #0x50]
    mov r0, #0x12
    mul r0, r1, r0
    ldr r1, _LIT2
    mov r2, fp, lsl #0x1
    add r1, r1, r0
    ldrsh r1, [r2, r1]
    add r6, r3, #0x3
    ldrsh r3, [r9]
    cmp r1, #0x0
    ldrne r1, [sp, #0x4]
    ldrne r1, [r1, #0x40]
    cmpne r1, #0x5
    bne .L_1888
    ldr r1, _LIT3
    mov r5, #0x3e8
    add r0, r1, r0
    add r0, r0, fp, lsl #0x1
    add r0, r0, #0x8100
    ldrh r8, [r0, #0x7e]
    mov r7, #0x0
    cmp r8, #0x3e8
    movge r0, #0x1
    movlt r0, #0x0
    rsb r0, r0, #0x0
    add sl, r3, r0
.L_1818:
    cmp r8, r5
    bge .L_182c
    cmp r8, #0x0
    cmpeq r5, #0x1
    bne .L_1864
.L_182c:
    mov r0, #0xa
    mul r1, r5, r0
    mov r0, r8
    bl func_020b3870
    mov r0, r1
    mov r1, r5
    bl func_020b3870
    mov r2, r0
    mov r0, r4
    mov r1, #0x2
    mov r3, sl
    str r6, [sp]
    bl func_ov006_021cb158
    add sl, sl, #0x4
.L_1864:
    ldr r0, _LIT4
    mov r2, r5
    smull r1, r5, r0, r2
    mov r0, r2, lsr #0x1f
    add r7, r7, #0x1
    add r5, r0, r5, asr #0x2
    cmp r7, #0x4
    blt .L_1818
    b .L_189c
.L_1888:
    mov r0, r4
    mov r1, #0x2
    mov r2, #0xf
    str r6, [sp]
    bl func_ov006_021cb158
.L_189c:
    add fp, fp, #0x1
    cmp fp, #0x9
    add r9, r9, #0x4
    blt .L_17a8
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0225e138
_LIT1: .word data_ov006_021cc118
_LIT2: .word data_ov006_021cc20c
_LIT3: .word data_ov006_0224f448
_LIT4: .word 0x66666667
