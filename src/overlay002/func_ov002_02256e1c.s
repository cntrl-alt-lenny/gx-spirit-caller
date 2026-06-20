; func_ov002_02256e1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021d93e0
        .extern func_ov002_021df62c
        .extern func_ov002_021e2d94
        .global func_ov002_02256e1c
        .arm
func_ov002_02256e1c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, #0x0
    mov r6, #0x5
    mov r5, r9
.L_254:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0xcec]
    ldr r4, _LIT2
    eor r7, r0, r9
    ldr r0, _LIT3
    and r2, r7, #0x1
    mla fp, r2, r1, r0
    mov r8, #0x0
    mov sl, fp
.L_27c:
    mov r0, r7
    mov r1, r8
    bl func_ov002_021b9ecc
    cmp r0, r4
    bne .L_32c
    ldr r0, [sl, #0x40]
    mov r0, r0, lsr #0x5
    tst r0, #0x1
    beq .L_32c
    mov r0, r7
    mov r1, r8
    mov r2, r6
    mov r3, r5
    bl func_ov002_021e2d94
    ldr r3, [sl, #0x40]
    ldrh r0, [sl, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    orr r1, r1, r3, lsr #0x1
    and r2, r2, #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_32c
    mov r0, #0x14
    mul r0, r8, r0
    add r1, fp, #0x30
    ldr r2, [r1, r0]
    mov r0, r7
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r8
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    mov r0, r7
    mov r1, r8
    mov r2, #0x2
    bl func_ov002_021d93e0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_32c:
    add r8, r8, #0x1
    cmp r8, #0x4
    add sl, sl, #0x14
    ble .L_27c
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_254
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word 0x00001a8d
_LIT3: .word data_ov002_022cf16c
