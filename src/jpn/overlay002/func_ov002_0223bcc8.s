; func_ov002_0223bcc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022d008c
        .extern func_ov002_021baf88
        .extern func_ov002_021ca1d8
        .extern func_ov002_02253600
        .global func_ov002_0223bcc8
        .arm
func_ov002_0223bcc8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x11
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r5, r0, r1, lsr #0x1f
    mov r0, r5
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    mov r2, #0x0
    ldr r0, [r0, #0x4]
    cmp r5, r0
    ldreq r0, _LIT2
    moveq r1, #0xe
    streq r1, [r0, #0xd80]
    ldrh r1, [r4]
    mov r0, r5
    bl func_ov002_02253600
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000197a
_LIT1: .word data_ov002_022cd65c
_LIT2: .word data_ov002_022d008c
