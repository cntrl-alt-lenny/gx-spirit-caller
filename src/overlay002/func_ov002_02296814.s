; func_ov002_02296814 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a2
        .extern func_ov002_021bbd14
        .extern func_ov002_021be4a0
        .extern func_ov002_02259f74
        .global func_ov002_02296814
        .arm
func_ov002_02296814:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259f74
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r2, _LIT0
    ldr ip, _LIT1
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    and lr, r0, #0x1
    mov r1, r1, lsr #0x1b
    mov r3, #0x14
    mul r3, r1, r3
    mla r2, lr, r2, ip
    ldrh r2, [r3, r2]
    cmp r2, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r2, #0x1
    bl func_ov002_021be4a0
    cmp r0, #0x0
    beq .L_94
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbd14
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, pc}
.L_94:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a2
_LIT2: .word 0x0000195a
