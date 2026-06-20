; func_ov002_022848e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022cf16c
        .extern func_ov002_021bae7c
        .extern func_ov002_021bf294
        .extern func_ov002_021c031c
        .extern func_ov002_021c034c
        .extern func_ov002_02283c70
        .extern func_ov002_02284324
        .extern func_ov002_0229cd70
        .global func_ov002_022848e0
        .arm
func_ov002_022848e0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov sl, r0
    mov r9, r1
    str r2, [sp, #0x4]
    mov r8, r3
    ldr r7, [sp, #0x50]
    bl func_ov002_021c031c
    cmp r0, #0x0
    bne .L_cc8
    mov r0, sl
    mov r1, r9
    mov r2, #0x1
    bl func_ov002_021c034c
    cmp r0, #0x0
    beq .L_d3c
    ldr r1, _LIT0
    rsb r0, sl, #0x1
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    bne .L_d3c
.L_cc8:
    cmp r7, #0x0
    bne .L_cec
    ldr r3, [sp, #0x4]
    mov r0, sl
    mov r1, r9
    mov r2, #0x5
    bl func_ov002_02284324
    cmp r0, #0x0
    beq .L_d30
.L_cec:
    mov r0, sl
    mov r1, r9
    mov r3, r7
    mov r2, #0x5
    str r8, [sp]
    bl func_ov002_02283c70
    cmp r7, #0x0
    bne .L_d18
    ldr r0, [r8, #0x1c]
    cmp r0, #0x0
    ble .L_d24
.L_d18:
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d24:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d30:
    add sp, sp, #0x2c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d3c:
    rsb fp, sl, #0x1
    ldr r5, _LIT1
    ldr r0, _LIT2
    and r3, fp, #0x1
    mla r0, r3, r0, r5
    mov r4, #0x0
    str r4, [r8, #0x4]
    str r4, [r8]
    str r0, [sp, #0x8]
    ldr r2, _LIT3
    mov r1, #0xdc
    mla r6, fp, r1, r2
    str r4, [r8, #0x18]
    sub r0, r4, #0x10000
    str r0, [r8, #0x1c]
.L_d78:
    mov r0, #0x1
    str r0, [sp]
    mov r0, sl
    mov r1, r9
    mov r2, fp
    mov r3, r4
    bl func_ov002_021bf294
    cmp r0, #0x0
    beq .L_e94
    cmp r7, #0x0
    bne .L_dc0
    ldr r3, [sp, #0x4]
    mov r0, sl
    mov r1, r9
    mov r2, r4
    bl func_ov002_02284324
    cmp r0, #0x0
    beq .L_e94
.L_dc0:
    add r0, sp, #0xc
    str r0, [sp]
    mov r0, sl
    mov r1, r9
    mov r2, r4
    mov r3, r7
    mov r5, #0x0
    bl func_ov002_02283c70
    cmp r7, #0x0
    beq .L_df4
    ldr r0, [r8, #0x4]
    cmp r0, #0x0
    moveq r5, #0x1
.L_df4:
    ldr r0, [r8, #0x4]
    ldr r1, [sp, #0x10]
    cmp r1, r0
    movgt r5, #0x1
    cmp r1, r0
    bne .L_e7c
    ldr r1, [r8, #0x1c]
    ldr r0, [sp, #0x28]
    cmp r0, r1
    movgt r5, #0x1
    bgt .L_e7c
    bne .L_e7c
    ldr r1, [sp, #0x20]
    ldr r0, [r8, #0x14]
    cmp r1, r0
    movgt r5, #0x1
    bgt .L_e7c
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x8]
    mov r2, #0x14
    mla r1, r0, r2, r1
    ldrh r1, [r1, #0x38]
    cmp r1, #0x0
    moveq r5, #0x1
    beq .L_e7c
    mov r1, #0x2c
    mla r1, r0, r1, r6
    ldr r2, [r1, #0x2c]
    ldr r1, [r8, #0xc]
    mov r0, #0x2c
    mla r0, r1, r0, r6
    ldr r0, [r0, #0x2c]
    cmp r2, r0
    movgt r5, #0x1
.L_e7c:
    cmp r5, #0x0
    beq .L_e94
    mov r0, r8
    add r1, sp, #0xc
    mov r2, #0x20
    bl func_ov002_0229cd70
.L_e94:
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_d78
    cmp r7, #0x0
    ldreq r0, [r8, #0x4]
    cmpeq r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000017fe
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cd524
