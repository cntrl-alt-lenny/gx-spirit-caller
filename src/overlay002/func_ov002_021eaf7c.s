; func_ov002_021eaf7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1a2c
        .extern func_ov002_021c1e44
        .extern func_ov002_021c1ef0
        .global func_ov002_021eaf7c
        .arm
func_ov002_021eaf7c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r2
    mov r6, r0
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r3, [r6, #0x2]
    mov r3, r3, lsl #0x1f
    cmp r5, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr ip, _LIT0
    and lr, r5, #0x1
    mul r7, lr, ip
    mov r3, #0x14
    mul lr, r4, r3
    ldr ip, _LIT1
    add r3, ip, r7
    ldrh r3, [lr, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, _LIT2
    add r3, r3, r7
    add r3, r3, lr
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT3
    ldr r1, [r0]
    cmp r1, r5
    ldreq r0, [r0, #0x1c]
    cmpeq r0, r4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r2, [r6]
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1e44
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a4
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cd3f4
