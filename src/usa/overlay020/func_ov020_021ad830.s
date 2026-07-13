; func_ov020_021ad830 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104e6c
        .extern data_0210696c
        .extern data_ov020_021adfc8
        .extern data_ov020_021ae8d4
        .extern data_ov020_021ae8dc
        .extern func_02006e00
        .extern func_0200973c
        .extern func_ov020_021ab6fc
        .global func_ov020_021ad830
        .arm
func_ov020_021ad830:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, _LIT0
    ldr r6, _LIT1
    ldr r7, _LIT2
    mov r5, #0x0
.L_1d3c:
    mov r0, r7
    mov r1, r6
    bl func_ov020_021ab6fc
    add r5, r5, #0x1
    cmp r5, #0x2
    add r6, r6, #0x4
    add r7, r7, #0x4
    blt .L_1d3c
    ldr r1, _LIT3
    mov r3, #0x0
    str r3, [r1, #0x3c]
.L_1d68:
    add r0, r4, r3, lsl #0x1
    add r0, r0, #0xa00
    ldrh r2, [r0, #0x38]
    add r0, r4, r3, lsl #0x3
    add r3, r3, #0x1
    add r0, r0, r2, lsl #0x1
    add r0, r0, #0x900
    ldrh r0, [r0, #0xe8]
    cmp r0, #0x1
    ldrls r0, [r1, #0x3c]
    addls r0, r0, #0x1
    strls r0, [r1, #0x3c]
    cmp r3, #0xa
    blt .L_1d68
    ldr r0, _LIT3
    ldr r0, [r0, #0x3c]
    cmp r0, #0xa
    bne .L_1df8
    mov r0, #0x10
    ldr r5, _LIT4
    bl func_0200973c
    ldr r1, _LIT5
    ldr r0, _LIT6
    ldrh r1, [r1, #0x8]
    cmp r1, r0
    bcs .L_1de0
    add r0, r5, #0x1b00
    ldrh r1, [r0, #0x8]
    add r1, r1, #0x1
    strh r1, [r0, #0x8]
.L_1de0:
    add r0, r5, #0x1b00
    ldrh r0, [r0, #0x8]
    cmp r0, #0xa
    bcc .L_1df8
    mov r0, #0x11
    bl func_0200973c
.L_1df8:
    ldr r0, [r4, #0xa4c]
    cmp r0, #0x0
    beq .L_1e10
    bl func_02006e00
    mov r0, #0x0
    str r0, [r4, #0xa4c]
.L_1e10:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov020_021adfc8
_LIT1: .word data_ov020_021ae8dc
_LIT2: .word data_ov020_021ae8d4
_LIT3: .word data_02103fcc
_LIT4: .word data_02104e6c
_LIT5: .word data_0210696c
_LIT6: .word 0x00007fff
