; func_ov002_0220419c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf1a8
        .extern func_ov002_021c8940
        .global func_ov002_0220419c
        .arm
func_ov002_0220419c:
    stmdb sp!, {r3, r4, r5, lr}
    ldrh r5, [r0, #0x2]
    ldr r0, _LIT0
    ldr ip, _LIT1
    mov r1, r5, lsl #0x1f
    mov r2, r5, lsl #0x1a
    mov r1, r1, lsr #0x1f
    and lr, r1, #0x1
    mov r2, r2, lsr #0x1b
    mov r3, #0x14
    mul r4, r2, r3
    mla r3, lr, r0, ip
    mov r0, r5, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0xd
    ldr r4, [r4, r3]
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r3, _LIT2
    ldr r0, [r3]
    cmp r0, r1
    ldreq ip, [r3, #0x1c]
    cmpeq ip, r2
    bne .L_88
    ldr r0, [r3, #0x4]
    ldr r1, [r3, #0x20]
    bl func_ov002_021c8940
    cmp r0, #0x0
    beq .L_80
    cmp r0, r4
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_80:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_88:
    ldr r3, _LIT2
    ldr ip, [r3, #0x4]
    cmp ip, r1
    ldreq r1, [r3, #0x20]
    cmpeq r1, r2
    bne .L_c4
    ldr r1, [r3, #0x1c]
    bl func_ov002_021c8940
    cmp r0, #0x0
    beq .L_bc
    cmp r0, r4
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_bc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_c4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word data_ov002_022cd3f4
