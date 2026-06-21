; func_ov002_022099cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_022575c8
        .global func_ov002_022099cc
        .arm
func_ov002_022099cc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r6, #0x0
    ldr r5, _LIT0
    ldr r4, _LIT1
    mov sl, r0
    mov r7, r6
    mov fp, r6
.L_1c:
    and r0, r7, #0x1
    mla r1, r0, r4, r5
    mov r8, fp
    add r9, r1, #0x30
.L_2c:
    mov r0, sl
    mov r1, r7
    mov r2, r8
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_70
    ldr r1, [r9]
    ldrh r2, [sl, #0x4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r2, r2, lsl #0x11
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsr #0x17
    add r0, r0, r1, lsr #0x1f
    cmp r2, r0
    addne r6, r6, #0x1
.L_70:
    add r8, r8, #0x1
    cmp r8, #0xa
    add r9, r9, #0x14
    ble .L_2c
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_1c
    cmp r6, #0x2
    movge r0, #0x1
    movlt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
