; func_ov002_021f2bbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_0202b878
        .extern func_ov002_021c1e44
        .extern func_ov002_021c2084
        .global func_ov002_021f2bbc
        .arm
func_ov002_021f2bbc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    ldr r1, _LIT0
    and r3, r5, #0x1
    mov r4, r2
    mov r2, #0x14
    mul r1, r3, r1
    ldr r3, _LIT1
    mul r2, r4, r2
    add r3, r3, r1
    add r3, r3, r2
    ldr r3, [r3, #0x30]
    mov r6, r0
    mov r0, r3, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r3, _LIT2
    add r3, r3, r1
    ldrh r3, [r2, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r4, #0x5
    blt .L_6c
    cmp r4, #0xa
    ble .L_74
.L_6c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_74:
    ldr r3, _LIT3
    add r1, r3, r1
    ldr r1, [r2, r1]
    mov r1, r1, lsr #0x9
    tst r1, #0x1
    bne .L_9c
    bl func_0202b878
    cmp r0, #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
.L_9c:
    mov r0, r6
    mov r1, r5
    mov r2, r4
    mov r3, #0x0
    bl func_ov002_021c2084
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1e44
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1ac
