; func_ov020_021ac2b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021adcf0
        .extern data_ov020_021adf80
        .extern data_ov020_021adfc8
        .extern data_ov020_021ae8d4
        .extern data_ov020_021ae8dc
        .extern data_ov020_021ae8e4
        .extern data_ov020_021ae8ec
        .extern func_0207e2d4
        .extern func_0207fbf8
        .extern func_0207fc78
        .extern func_0208c79c
        .extern func_ov020_021aa908
        .extern func_ov020_021aaa9c
        .extern func_ov020_021aab10
        .extern func_ov020_021aab98
        .extern func_ov020_021ab628
        .extern func_ov020_021ab6b8
        .global func_ov020_021ac2b4
        .arm
func_ov020_021ac2b4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r0, #0x0
    mov r2, r0
    mov r3, r0
    mov r1, #0x1
    bl func_ov020_021ab628
    mov r2, #0x0
    mov r3, r2
    mov r0, #0x1
    mov r1, #0x2
    bl func_ov020_021ab628
    ldr r5, _LIT0
    ldr r6, _LIT1
    ldr r7, _LIT2
    ldr r8, _LIT3
    mov r4, #0x0
.L_7ec:
    mov r0, r4
    mov r1, r8
    mov r2, r7
    mov r3, r6
    str r5, [sp]
    bl func_ov020_021ab6b8
    add r4, r4, #0x1
    cmp r4, #0x2
    add r5, r5, #0x4
    add r6, r6, #0x4
    add r7, r7, #0x4
    add r8, r8, #0x4
    blt .L_7ec
    ldr r0, _LIT4
    mov sl, #0x0
    add r0, r0, #0x12c
    add fp, r0, #0x800
    mov r5, #0x1000
    mov r4, #0x1
.L_838:
    ldr r0, _LIT5
    mov r7, #0x0
    ldr r9, [r0, sl, lsl #0x2]
    cmp r9, #0x0
    ble .L_898
    ldr r0, _LIT4
    mov r8, fp
    add r6, r0, sl, lsl #0x2
.L_858:
    mov r1, r7, lsl #0x10
    ldr r0, [r6, #0x91c]
    mov r1, r1, lsr #0x10
    bl func_0207e2d4
    mov r1, r0
    mov r0, r8
    ldr r2, [r6, #0x924]
    bl func_0207fc78
    mov r0, r8
    mov r1, r5
    bl func_0207fbf8
    str r4, [r8, #0x8]
    add r8, r8, #0x54
    add r7, r7, #0x1
    cmp r7, r9
    blt .L_858
.L_898:
    add sl, sl, #0x1
    cmp sl, #0x2
    add fp, fp, #0x54
    blt .L_838
    bl func_ov020_021aa908
    mov r0, #0x4
    bl func_ov020_021aab10
    mov r0, #0x4
    bl func_ov020_021aab98
    bl func_ov020_021aaa9c
    ldr r2, _LIT6
    mov r3, #0x1e000
    str r3, [r2, #0x8c0]
    ldr r0, _LIT7
    mvn r1, #0xf
    str r3, [r2, #0x8c4]
    bl func_0208c79c
    ldr r0, _LIT8
    mvn r1, #0xf
    bl func_0208c79c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov020_021ae8ec
_LIT1: .word data_ov020_021ae8e4
_LIT2: .word data_ov020_021ae8dc
_LIT3: .word data_ov020_021ae8d4
_LIT4: .word data_ov020_021adfc8
_LIT5: .word data_ov020_021adcf0
_LIT6: .word data_ov020_021adf80
_LIT7: .word 0x0400006c
_LIT8: .word 0x0400106c
