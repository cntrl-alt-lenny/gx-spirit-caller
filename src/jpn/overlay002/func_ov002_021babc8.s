; func_ov002_021babc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_ov002_021b9dec
        .global func_ov002_021babc8
        .arm
func_ov002_021babc8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, #0x0
    mov r8, r2
    mov r7, r0
    mov r6, r1
    mov r5, r4
    bl func_ov002_021b9dec
    cmp r8, r0
    bne .L_78
    ldr r1, _LIT0
    and r2, r7, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    ldr r2, _LIT1
    mul r0, r6, r0
    add r2, r2, r3
    ldr r1, _LIT2
    ldr ip, [r0, r2]
    add r3, r1, r3
    mov r2, ip, lsr #0x6
    mov r1, ip, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, ip, lsr #0x1
    ldrh r3, [r0, r3]
    and r1, r1, #0x1
    mvn r2, r2
    mvn r0, r1
    and r1, r3, r2
    tst r1, r0
    movne r5, #0x1
.L_78:
    cmp r5, #0x0
    beq .L_98
    ldr r0, _LIT3
    add r1, r6, r7, lsl #0x4
    ldr r2, [r0, #0xd4]
    mov r0, #0x1
    tst r2, r0, lsl r1
    moveq r4, r0
.L_98:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0cc
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022d008c
