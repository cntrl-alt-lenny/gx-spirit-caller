; func_ov002_022033cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf288
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bb90c
        .global func_ov002_022033cc
        .arm
func_ov002_022033cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb90c
    cmp r0, #0x0
    bne .L_40
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb90c
    cmp r0, #0x0
    beq .L_8c
.L_40:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    mov r1, r1, lsr #0x11
    tst r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r2, _LIT4
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_8c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001433
_LIT1: .word 0x00001434
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf288
_LIT4: .word 0x000012f3
