; func_ov002_0226e6e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bc618
        .extern func_ov002_021c92ec
        .extern func_ov002_021ca2b8
        .extern func_ov002_021ca698
        .extern func_ov002_022536e8
        .global func_ov002_0226e6e0
        .arm
func_ov002_0226e6e0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    mov r4, r1
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r8
    mov r1, r8
    bl func_ov002_021ca698
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r2, _LIT0
    mov r0, r8
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_22c
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r8, #0x1
    mla r0, r1, r0, r2
    mov r5, #0x0
    mov r9, #0x1
    mov r6, r5
    mov r4, r5
    add r7, r0, #0x30
    mov sl, r9
.L_1d4:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_208
    mov r0, r8
    mov r1, r4
    bl func_ov002_021c92ec
    cmp r0, #0x1
    beq .L_204
    cmp r0, #0x2
    moveq r6, r9
    b .L_208
.L_204:
    mov r5, sl
.L_208:
    add r4, r4, #0x1
    cmp r4, #0x5
    add r7, r7, #0x14
    blt .L_1d4
    cmp r5, #0x0
    cmpne r6, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_22c:
    mov r0, r8
    bl func_ov002_021bc618
    cmp r0, #0x0
    beq .L_278
    mov r0, r8
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_022536e8
    cmp r0, #0x0
    ble .L_270
    mov r0, r8
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_022536e8
    cmp r0, #0x0
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_270:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_278:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x000014a0
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
