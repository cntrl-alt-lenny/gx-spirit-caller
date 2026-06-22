; func_ov002_021ee094 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_0202b878
        .extern func_ov002_021c1ef0
        .global func_ov002_021ee094
        .arm
func_ov002_021ee094:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    ldr r3, _LIT0
    and r4, r7, #0x1
    mov r6, r2
    mov r1, #0x14
    mul r5, r4, r3
    mul r4, r6, r1
    ldr r2, _LIT1
    mov r8, r0
    add r1, r2, r5
    add r1, r1, r4
    ldr r1, [r1, #0x30]
    mov r0, r1, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r8, #0x2]
    mov r1, r1, lsl #0x1f
    cmp r7, r1, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r6, #0x5
    blt .L_154
    cmp r6, #0xa
    ble .L_15c
.L_154:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_15c:
    ldr r1, _LIT2
    add r1, r1, r5
    ldr r1, [r4, r1]
    mov r1, r1, lsr #0x9
    tst r1, #0x1
    bne .L_184
    bl func_0202b878
    cmp r0, #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_184:
    ldr r0, _LIT3
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1ac
_LIT3: .word data_ov002_022cf1a4
