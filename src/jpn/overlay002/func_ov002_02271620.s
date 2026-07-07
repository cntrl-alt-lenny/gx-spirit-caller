; func_ov002_02271620 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cf0c8
        .extern func_ov002_021babc8
        .extern func_ov002_021baf88
        .extern func_ov002_021c37e4
        .global func_ov002_02271620
        .arm
func_ov002_02271620:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov r5, r0
    ldr r0, [r3]
    add r4, r1, r2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, r5
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    cmp r4, #0x5
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r4, #0xa
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT1
    bl func_ov002_021baf88
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT2
    mov r0, r5
    mov r1, r4
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_cc
    ldr r0, _LIT0
    ldr r1, [r0]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021c37e4
    cmp r0, #0x7
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, [r0]
    ldr r0, _LIT3
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, _LIT4
    and r3, r3, #0x1
    movge ip, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    movlt ip, #0x0
    ldr r1, [r1, r0]
    add r0, ip, #0x1
    cmp r1, r0
    movcs r0, #0x800
    ldmcsia sp!, {r3, r4, r5, pc}
.L_cc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word 0x000013f2
_LIT2: .word 0x000019b2
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf0c8
