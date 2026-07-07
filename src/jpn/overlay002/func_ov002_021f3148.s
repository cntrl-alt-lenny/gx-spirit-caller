; func_ov002_021f3148 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b8fc8
        .extern func_ov002_021c1d64
        .extern func_ov002_021c1fa4
        .global func_ov002_021f3148
        .arm
func_ov002_021f3148:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r2
    mov r8, r0
    cmp r6, #0x5
    mov r7, r1
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r4, _LIT0
    and ip, r7, #0x1
    mul r5, ip, r4
    mov r3, #0x14
    mul r4, r6, r3
    ldr ip, _LIT1
    add r3, ip, r5
    add r3, r3, r4
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, #0x0
    bl func_ov002_021c1fa4
    cmp r0, #0x0
    beq .L_c8
    ldr r0, _LIT2
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    beq .L_b8
    ldr r0, _LIT3
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    bne .L_b8
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b8fc8
    cmp r0, #0x0
    bne .L_c0
.L_b8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_c0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_c8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0c2
