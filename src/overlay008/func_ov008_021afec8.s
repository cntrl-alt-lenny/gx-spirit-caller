; func_ov008_021afec8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2780
        .extern data_ov008_021b2de4
        .extern func_02005dac
        .extern func_02006164
        .extern func_02006194
        .extern func_02037208
        .extern func_0207fd28
        .extern func_020944a4
        .extern func_020b3870
        .extern func_ov008_021aa578
        .extern func_ov008_021aedfc
        .extern func_ov008_021aee54
        .extern func_ov008_021aeeac
        .extern func_ov008_021afa34
        .extern func_ov008_021afca4
        .global func_ov008_021afec8
        .arm
func_ov008_021afec8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    ldr r0, _LIT0
    mov r6, #0x15
    ldrh r0, [r0, #0xa8]
    str r0, [sp]
    cmp r0, #0x3
    movhi r0, #0x3
    strhi r0, [sp]
    ldr r0, [sp]
    mov r1, r0, lsl #0x1
    mov r0, #0x8a
    bl func_020b3870
    mov r7, r0
    ldr r0, [sp]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_c10
    ldr r0, _LIT1
    ldr r4, _LIT0
    add r0, r0, #0x4000
    str r0, [sp, #0xc]
    mvn fp, #0x0
.L_99c:
    ldrh r3, [r4]
    ldr r0, _LIT2
    add sl, r6, r7
    smull r1, r2, r0, r3
    mov r0, r3, lsr #0x1f
    add r2, r0, r2, asr #0x1
    mov r0, #0x5
    smull r1, r2, r0, r2
    sub r2, r3, r1
    add r1, r2, r5
    cmp r1, #0x4
    subgt r1, r1, #0x5
    mov r0, #0xc
    mul r8, r1, r0
    sub r9, sl, #0x14
    ldr r0, _LIT1
    and r1, r9, #0xff
    orr r0, r1, r0
    str r0, [sp, #0x10]
    add r0, r8, #0xab
    add r0, r0, #0x200
    orr r0, r0, #0x400
    strh r0, [sp, #0x14]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x10
    mov r2, #0x8
    bl func_020944a4
    add r0, r8, #0xb3
    add r0, r0, #0x200
    orr r0, r0, #0x400
    strh r0, [sp, #0x14]
    add r0, sl, #0xc
    and r1, r0, #0xff
    ldr r0, [sp, #0xc]
    orr r0, r1, r0
    str r0, [sp, #0x10]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x10
    mov r2, #0x8
    bl func_020944a4
    bl func_02006194
    cmp r0, #0x0
    beq .L_b84
    ldrh r0, [r4, #0xaa]
    cmp r0, #0x0
    ldreq r0, [r4, #0xac]
    cmpeq r0, #0x0
    bne .L_b84
    add r3, sl, #0x14
    mov r0, #0x26
    mov r1, r9
    mov r2, #0x3a
    bl func_ov008_021aa578
    cmp r0, #0x0
    beq .L_b84
    ldrh sl, [r4, #0x2]
    ldrh r8, [r4, #0x4]
    mov r0, #0x0
    strh r5, [r4, #0x2]
    strh r0, [r4, #0x4]
    ldrh r1, [r4]
    ldrh r0, [r4, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    str r0, [sp, #0x4]
    ldrh r1, [r4]
    ldrh r0, [r4, #0x2]
    add r0, r1, r0
    bl func_ov008_021aedfc
    str r0, [sp, #0x8]
    ldrh r1, [r4]
    ldrh r0, [r4, #0x2]
    add r0, r1, r0
    bl func_ov008_021aee54
    ldr r3, [sp, #0x8]
    ldr r1, _LIT3
    mov r2, #0x34
    mla r1, r3, r2, r1
    ldr r2, [sp, #0x4]
    mov r3, r2, lsr #0x1f
    rsb r2, r3, r2, lsl #0x1b
    add r2, r3, r2, ror #0x1b
    mov r3, r0, asr #0x4
    add r0, r0, r3, lsr #0x1b
    mov r0, r0, asr #0x5
    add r0, r1, r0, lsl #0x2
    ldr r1, [r0, #0x3c]
    mov r0, #0x1
    tst r1, r0, lsl r2
    ldreq r0, [r4, #0xac]
    cmpeq r0, #0x0
    bne .L_b5c
    bl func_02006164
    cmp r0, #0x0
    beq .L_b5c
    bl func_ov008_021aeeac
    ldrh r1, [r4]
    ldrh r0, [r4, #0x2]
    add r0, r1, r0
    bl func_ov008_021afa34
    mov r0, #0x3a
    mov r1, fp
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_b84
.L_b5c:
    ldrh r0, [r4, #0x2]
    cmp sl, r0
    ldreqh r0, [r4, #0x4]
    cmpeq r8, r0
    beq .L_b84
    mov r0, #0x38
    mov r1, fp
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_b84:
    ldrh r0, [r4]
    add r0, r0, r5
    bl func_ov008_021aee54
    mov r8, r0
    ldrh r0, [r4]
    add r0, r0, r5
    bl func_ov008_021aedfc
    mov sl, r0
    ldrh r0, [r4]
    add r0, r0, r5
    bl func_ov008_021aee54
    ldr r1, _LIT3
    mov r2, #0x34
    mla r1, sl, r2, r1
    mov r3, r8, lsr #0x1f
    rsb r2, r3, r8, lsl #0x1b
    add r2, r3, r2, ror #0x1b
    mov r3, r0, asr #0x4
    add r0, r0, r3, lsr #0x1b
    mov r0, r0, asr #0x5
    add r0, r1, r0, lsl #0x2
    ldr r1, [r0, #0x3c]
    mov r0, #0x1
    tst r1, r0, lsl r2
    beq .L_bfc
    ldrh r2, [r4]
    mov r1, r9
    mov r0, #0x26
    add r2, r2, r5
    bl func_ov008_021afca4
.L_bfc:
    ldr r0, [sp]
    add r5, r5, #0x1
    add r6, r6, r7, lsl #0x1
    cmp r5, r0
    blt .L_99c
.L_c10:
    ldr r5, _LIT3
    mov r6, #0x0
    mov r4, #0x1000
.L_c1c:
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0x5fc]
    mov r1, r4
    bl func_0207fd28
    add r6, r6, #0x1
    cmp r6, #0x4
    blt .L_c1c
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov008_021b2de4
_LIT1: .word 0x80262000
_LIT2: .word 0x66666667
_LIT3: .word data_ov008_021b2780
