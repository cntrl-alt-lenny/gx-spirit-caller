; func_ov008_021b00b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .extern data_02104e6c
        .extern data_02105e6c
        .extern data_ov008_021b25d0
        .extern data_ov008_021b2660
        .extern data_ov008_021b2ca8
        .extern data_ov008_021b2cc4
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0208e2f4
        .extern func_02094410
        .extern func_ov008_021aa460
        .extern func_ov008_021aecd8
        .extern func_ov008_021aeeb0
        .global func_ov008_021b00b4
        .arm
func_ov008_021b00b4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0xc8
    bl func_02094410
    ldr r2, _LIT1
    ldr r4, _LIT2
    ldr r0, [r2]
    ldr r1, [r2]
    and r0, r0, #0x1f00
    mov r0, r0, lsr #0x8
    bic r0, r0, #0x8
    bic r1, r1, #0x1f00
    orr r0, r0, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    mov r5, #0x0
    str r5, [r4, #0xb0]
.L_580:
    mov r0, r5
    bl func_ov008_021aa460
    ldrh r1, [r4, #0xa8]
    add r5, r5, #0x1
    cmp r5, #0x1a
    add r0, r1, r0
    strh r0, [r4, #0xa8]
    blt .L_580
    mov r6, #0x0
    mov r5, #0x4
    ldr r4, _LIT2
    b .L_5c4
.L_5b0:
    mov r0, r6
    bl func_ov008_021aecd8
    mov r1, r6
    bl func_ov008_021aeeb0
    add r6, r6, #0x1
.L_5c4:
    ldrh r0, [r4, #0xa8]
    cmp r0, #0x3
    movhi r0, r5
    cmp r6, r0
    blt .L_5b0
    add r0, sp, #0x0
    bl func_0201d428
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r1, [sp, #0x14]
    str r0, [sp]
    ldr r3, _LIT4
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    ldrh r2, [sp, #0x14]
    mov r1, #0x600
    add r0, sp, #0x0
    orr r2, r2, #0x10
    str r3, [sp, #0xc]
    strh r2, [sp, #0x14]
    strh r1, [sp, #0x10]
    bl func_0201e564
    ldr r0, [sp]
    bl func_02006e00
    ldr r0, _LIT5
    ldr r2, _LIT6
    ldr r0, [r0, #0x18]
    ldr r3, [r2, #0xa60]
    ldr r1, _LIT7
    sub r3, r3, r0
    str r3, [r2, #0xa60]
    ldr r1, [r1, #0x568]
    cmp r1, #0x0
    beq .L_67c
    ldr r1, _LIT8
    mvn r2, #0x0
    ldr r3, [r1, #0x854]
    sub r4, r2, r3
    cmp r4, r0
    addhi r0, r3, r0
    strhi r0, [r1, #0x854]
    strls r2, [r1, #0x854]
    b .L_69c
.L_67c:
    ldr r1, _LIT8
    mvn r2, #0x0
    ldr r3, [r1, #0x858]
    sub r4, r2, r3
    cmp r4, r0
    addhi r0, r3, r0
    strhi r0, [r1, #0x858]
    strls r2, [r1, #0x858]
.L_69c:
    ldr r1, _LIT2
    mov r0, #0xa
    ldrh r3, [r1, #0xa8]
    mov r1, #0x4
    mov r2, #0x0
    mul r0, r3, r0
    bl Task_PostLocked
    ldr r2, _LIT2
    mov r1, #0x1f
    str r0, [r2, #0xc0]
    ldr r0, _LIT9
    mov r2, #0x0
    bl func_0208e2f4
    ldr r2, _LIT1
    mov r0, #0x1
    ldr r1, [r2]
    bic r1, r1, #0xe000
    str r1, [r2]
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2cc4
_LIT1: .word 0x04001000
_LIT2: .word data_ov008_021b2cc4
_LIT3: .word data_ov008_021b25d0
_LIT4: .word 0x00014980
_LIT5: .word data_ov008_021b2ca8
_LIT6: .word data_02104e6c
_LIT7: .word data_ov008_021b2660
_LIT8: .word data_02105e6c
_LIT9: .word 0x04001050
