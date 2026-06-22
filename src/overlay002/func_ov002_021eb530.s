; func_ov002_021eb530 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_0202b878
        .extern func_ov002_021b8fcc
        .extern func_ov002_021c1ef0
        .extern func_ov002_021c2084
        .global func_ov002_021eb530
        .arm
func_ov002_021eb530:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    ldr r3, _LIT0
    and r4, r8, #0x1
    mov r7, r2
    mov r1, #0x14
    mul r6, r4, r3
    ldr r2, _LIT1
    mul r5, r7, r1
    add r1, r2, r6
    add r1, r1, r5
    ldr r1, [r1, #0x30]
    mov r9, r0
    mov r0, r1, lsl #0x13
    cmp r7, #0x5
    mov r4, r0, lsr #0x13
    bge .L_1d4
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1d4:
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT2
    add r0, r0, r6
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r4
    bl func_0202b878
    cmp r0, #0x17
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT3
    add r0, r0, r6
    ldr r0, [r5, r0]
    mov r0, r0, lsr #0x9
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    mov r1, r8
    mov r2, r7
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, #0x1
    bl func_ov002_021c2084
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1ac
