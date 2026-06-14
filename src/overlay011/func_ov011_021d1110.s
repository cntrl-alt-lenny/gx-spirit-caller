; func_ov011_021d1110 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d334a
        .extern data_ov011_021d403c
        .extern data_ov011_021d4660
        .extern func_ov011_021d0ffc
        .global func_ov011_021d1110
        .arm
func_ov011_021d1110:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    ldr r7, _LIT0
    ldr r8, _LIT1
    bl func_ov011_021d0ffc
    cmp r0, #0x1
    bne .L_f4
    ldr r0, [r8, #0x268]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x1c
    sub r1, r0, #0x1
    mov r0, #0x72
    mla r2, r1, r0, r2
    sub r0, r6, #0x11
    add r1, r2, r0, lsl #0x2
    ldrh r0, [r1, #0x52]
    mov r0, r0, lsl #0xc
    str r0, [r5]
    ldrh r0, [r1, #0x54]
    mov r0, r0, lsl #0xc
    str r0, [r4]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_f4:
    mov r0, #0x28
    mul r0, r6, r0
    ldr r1, [r7, r0]
    add r0, r7, r0
    str r1, [r5]
    ldr r0, [r0, #0x4]
    str r0, [r4]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov011_021d4660
_LIT1: .word data_ov011_021d403c
_LIT2: .word data_ov011_021d334a
