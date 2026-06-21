; func_ov002_0220aad0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf180
        .extern data_ov002_022cf1a8
        .extern func_ov002_021ca698
        .extern func_ov002_022577dc
        .global func_ov002_0220aad0
        .arm
func_ov002_0220aad0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5, #0x2]
    ldr r1, _LIT0
    ldr r4, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsl #0x1a
    and ip, r0, #0x1
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    mla r1, ip, r1, r4
    ldr r4, [r2, r1]
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, r0
    bl func_ov002_021ca698
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, r4
    movcc r0, #0x0
    ldmccia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_ov002_022577dc
    cmp r0, r4
    movlt r0, #0x0
    movge r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word data_ov002_022cf180
