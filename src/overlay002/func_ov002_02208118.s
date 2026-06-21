; func_ov002_02208118 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bb90c
        .global func_ov002_02208118
        .arm
func_ov002_02208118:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    beq .L_160
    ldrh r1, [r5]
    ldr r0, _LIT0
    cmp r1, r0
    beq .L_118
    add r0, r0, #0x9b
    cmp r1, r0
    ldreq r4, _LIT1
    b .L_11c
.L_118:
    ldr r4, _LIT2
.L_11c:
    ldrh r0, [r5, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bb90c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r2, r4
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
.L_160:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0000175b
_LIT1: .word 0x00000ff8
_LIT2: .word 0x00000fa7
