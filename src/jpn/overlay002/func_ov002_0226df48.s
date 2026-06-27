; func_ov002_0226df48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cf1a8
        .extern func_ov002_021baf88
        .extern func_ov002_02271518
        .global func_ov002_0226df48
        .arm
func_ov002_0226df48:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, _LIT0
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    mov r0, r0, lsr #0x11
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    bl func_ov002_021baf88
    cmp r0, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT3
    and r1, r5, #0x1
    ldr r2, [r0]
    mov r4, #0x0
    bic r2, r2, #0x1
    orr r1, r2, r1
    str r1, [r0]
    ldrh r1, [r0, #0x16]
    rsb r6, r5, #0x1
    mov r5, r4
    orr r1, r1, #0x2
    strh r1, [r0, #0x16]
    strb r4, [r0, #0x8]
.L_74:
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_02271518
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_74
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word 0x000013f2
_LIT3: .word data_ov002_022cd220
