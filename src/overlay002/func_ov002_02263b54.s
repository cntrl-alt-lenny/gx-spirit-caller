; func_ov002_02263b54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021dec2c
        .extern func_ov002_021df62c
        .global func_ov002_02263b54
        .arm
func_ov002_02263b54:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov fp, r0
    mov r7, #0x0
.L_144:
    eor r8, fp, r7
    ldr r1, _LIT0
    ldr r0, _LIT1
    and r2, r8, #0x1
    mla r0, r2, r1, r0
    ldr r6, _LIT2
    str r0, [sp]
    mov r9, #0x0
    mov sl, r0
    add r5, r6, #0x1
    add r4, r6, #0x2
.L_170:
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b9ecc
    ldr r3, [sl, #0x40]
    mov r1, r3, lsr #0x4
    tst r1, #0x1
    beq .L_218
    mov r1, r3, lsr #0x6
    and r1, r1, #0x1
    mvn r1, r1
    ldrh r2, [sl, #0x38]
    mov ip, r3, lsr #0x2
    orr r3, ip, r3, lsr #0x1
    and r2, r2, r1
    and r1, r3, #0x1
    mvn r1, r1
    tst r2, r1
    beq .L_218
    cmp r0, r6
    cmpne r0, r5
    cmpne r0, r4
    bne .L_218
    mov r0, #0x14
    mul r1, r9, r0
    ldr r0, [sp]
    add r0, r0, #0x30
    ldr r2, [r0, r1]
    mov r0, r8
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r9
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    mov r2, #0x0
    mov r0, r8
    mov r1, r9
    mov r3, r2
    bl func_ov002_021dec2c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_218:
    add r9, r9, #0x1
    cmp r9, #0x4
    add sl, sl, #0x14
    ble .L_170
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_144
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00001386
