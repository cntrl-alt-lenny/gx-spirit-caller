; func_ov002_021d93e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a8
        .extern func_020312a0
        .extern func_ov002_021b9ecc
        .extern func_ov002_021d479c
        .global func_ov002_021d93e0
        .arm
func_ov002_021d93e0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov002_021b9ecc
    bl func_020312a0
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT1
    and r3, r6, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    cmp r4, #0x0
    ldr r0, [r1, r0]
    ble .L_280
    cmp r6, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r4, lsl #0x10
    mov r2, r0, asr #0x10
    orr r1, r1, #0x3c
    mov r0, r1, lsl #0x10
    mov r1, r5, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d479c
    ldmia sp!, {r4, r5, r6, pc}
.L_280:
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    mov r0, r4, lsl #0x10
    mov r2, r0, asr #0x10
    orr r1, r1, #0x3c
    mov r0, r1, lsl #0x10
    mov r1, r5, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0x1
    bl func_ov002_021d479c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
