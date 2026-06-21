; func_ov002_021ff7d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern func_ov002_021b4054
        .extern func_ov002_021c1ef0
        .global func_ov002_021ff7d8
        .arm
func_ov002_021ff7d8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0xd
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    ldr r2, _LIT0
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r3, #0x3
    bl func_ov002_021b4054
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh ip, [r4, #0x2]
    ldr r0, _LIT1
    mov r1, ip, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r1, [r0]
    rsb r2, r3, #0x1
    cmp r1, r2
    ldreq r2, [r0, #0x4]
    cmpeq r2, r3
    ldreq r3, [r0, #0x20]
    moveq r2, ip, lsl #0x1a
    cmpeq r3, r2, lsr #0x1b
    bne .L_134
    ldr r2, [r0, #0x1c]
    mov r0, r4
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_134:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001119
_LIT1: .word data_ov002_022cd3f4
