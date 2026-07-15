; func_ov003_021cd2e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104b88
        .extern data_02104e6c
        .extern func_ov003_021ccd1c
        .extern func_ov003_021cd4ec
        .global func_ov003_021cd2e4
        .arm
func_ov003_021cd2e4:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    ldr r2, _LIT0
    mov r5, r1
    ldr r4, [r2, #0xc3c]
    ldr r3, _LIT1
    eor r4, r4, r5
    ldr r3, [r3, r4, lsl #0x2]
    mov r6, r0
    cmp r3, #0x0
    mov ip, #0x3
    bne .L_6c8
    cmp r5, #0x0
    ldrne r4, [r2, #0xba8]
    ldreq r0, _LIT2
    mov r2, #0x0
    ldreq r4, [r0, #0xa64]
    mov r0, r6
    str r2, [sp]
    str r2, [sp, #0x4]
    mov r1, r5
    mov r3, r2
    str ip, [sp, #0x8]
    bl func_ov003_021cd4ec
    mov r0, #0x1
    mov r2, #0x0
    str r0, [sp]
    mov ip, #0x4
    str ip, [sp, #0x4]
    mov ip, #0x3
    mov r0, r6
    mov r1, r5
    mov r3, r2
    str ip, [sp, #0x8]
    bl func_ov003_021cd4ec
    mov r3, #0x0
    str r3, [sp]
    mov r2, #0x1
    str r2, [sp, #0x4]
    mov r1, #0x3
    str r1, [sp, #0x8]
    mov r0, r6
    mov r1, r5
    bl func_ov003_021cd4ec
    mov r3, #0x0
    str r3, [sp]
    mov r0, #0x3
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r0, r6
    mov r1, r5
    mov r2, #0x2
    bl func_ov003_021cd4ec
    and r0, r4, #0x7c00
    mov r0, r0, lsr #0xa
    cmp r0, #0x6
    cmpne r0, #0xb
    beq .L_688
    mov r3, #0x0
    str r3, [sp]
    mov r2, #0x2
    mov r0, r6
    mov r1, r5
    str r2, [sp, #0x4]
    mov r2, #0x3
    str r2, [sp, #0x8]
    bl func_ov003_021cd4ec
.L_688:
    and r0, r4, #0x1f00000
    movs r0, r0, lsr #0x14
    addeq sp, sp, #0xc
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    mov r3, #0x0
    str r3, [sp]
    mov r2, #0x5
    str r2, [sp, #0x4]
    mov r4, #0x3
    mov r0, r6
    mov r1, r5
    mov r2, #0x4
    str r4, [sp, #0x8]
    bl func_ov003_021cd4ec
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_6c8:
    mov r2, #0x0
    str r2, [sp]
    str ip, [sp, #0x4]
    mov r3, r2
    str ip, [sp, #0x8]
    bl func_ov003_021cd4ec
    mov r2, #0x0
    str r2, [sp]
    mov r3, #0x2
    str r3, [sp, #0x4]
    mov ip, #0x3
    mov r0, r6
    mov r1, r5
    mov r3, #0x1
    str ip, [sp, #0x8]
    bl func_ov003_021cd4ec
    mov r2, #0x0
    str r2, [sp]
    mov r3, #0x2
    str r3, [sp, #0x4]
    mov r1, #0x3
    str r1, [sp, #0x8]
    mov r0, r6
    mov r1, r5
    bl func_ov003_021cd4ec
    ldr r1, _LIT1
    mov r0, r6
    ldr r1, [r1, r4, lsl #0x2]
    bl func_ov003_021ccd1c
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    mov r3, #0x0
    str r3, [sp]
    mov r2, #0x5
    mov r0, r6
    mov r1, r5
    str r2, [sp, #0x4]
    mov r4, #0x3
    mov r2, #0x4
    str r4, [sp, #0x8]
    bl func_ov003_021cd4ec
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_02104b88
_LIT2: .word data_02104e6c
