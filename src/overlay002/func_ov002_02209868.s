; func_ov002_02209868 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022d016c
        .extern func_ov002_021bae7c
        .extern func_ov002_021ff320
        .extern func_ov002_022536e8
        .global func_ov002_02209868
        .arm
func_ov002_02209868:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    bl func_ov002_021ff320
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x0
    beq .L_50
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT1
    mvn r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_50:
    ldrh r0, [r5, #0x2]
    ldr r6, _LIT2
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r3, r2, r6
    ldr r1, [r1, r3]
    mov r4, #0x0
    cmp r1, #0x0
    bls .L_bc
    ldr r7, _LIT4
.L_80:
    ldrh r1, [r5]
    mov r2, r4
    bl func_ov002_022536e8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r5, #0x2]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r6, r7
    ldr r1, [r1, #0xc]
    cmp r4, r1
    bcc .L_80
.L_bc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x0000178b
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf178
_LIT4: .word data_ov002_022cf16c
