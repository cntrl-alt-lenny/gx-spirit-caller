; func_ov002_021c2330 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b9ecc
        .global func_ov002_021c2330
        .arm
func_ov002_021c2330:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    and r4, r0, #0x1
    mov r6, r1
    mov r2, #0x14
    mul r5, r4, r3
    ldr r3, _LIT1
    mul r4, r6, r2
    add r2, r3, r5
    ldrh r2, [r4, r2]
    cmp r2, #0x0
    beq .L_64
    bl func_ov002_021b9ecc
    ldr r1, _LIT2
    cmp r0, r1
    bne .L_64
    ldr r0, _LIT3
    add r0, r0, r5
    ldr r0, [r4, r0]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_64
    cmp r6, #0x4
    movle r0, #0x0
    ldmleia sp!, {r4, r5, r6, pc}
.L_64:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
_LIT2: .word 0x00001a8d
_LIT3: .word data_ov002_022cf1ac
