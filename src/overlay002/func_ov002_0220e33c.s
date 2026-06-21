; func_ov002_0220e33c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf1a4
        .extern func_0202ed90
        .extern func_ov002_021b9ecc
        .global func_ov002_0220e33c
        .arm
func_ov002_0220e33c:
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r1, [r0, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x12
    bne .L_78
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1f
    ldr r4, [r0, #0x4]
    ldr r5, [r0, #0x20]
    cmp r4, r1, lsr #0x1f
    ldreq r0, [r0, #0x8]
    cmpeq r0, #0x0
    bne .L_78
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b9ecc
    bl func_0202ed90
    cmp r0, #0x0
    beq .L_78
    ldr r0, _LIT1
    mov r1, #0x14
    ldr r2, _LIT2
    and r3, r4, #0x1
    mul r1, r5, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_78:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
