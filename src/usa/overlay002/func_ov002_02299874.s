; func_ov002_02299874 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022d008c
        .extern func_ov002_02285c58
        .extern func_ov002_022973ac
        .extern func_ov002_02297c58
        .extern func_ov002_0229968c
        .global func_ov002_02299874
        .arm
func_ov002_02299874:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x8]
    ldr r4, [r1, #0xcec]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_2ec
    b .L_21c
    b .L_254
    b .L_278
    b .L_2c0
    b .L_2e4
.L_21c:
    ldr r0, [r1, #0xcf8]
    cmp r0, #0x3
    movcs r0, #0x1
    ldmcsia sp!, {r4, r5, r6, pc}
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022973ac
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_254:
    mov r0, r4
    bl func_ov002_02297c58
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_278:
    mov r0, r4
    bl func_ov002_02285c58
    mov r6, #0x0
    mov r5, r6
.L_288:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_0229968c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_288
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_2c0:
    mov r0, r4
    bl func_ov002_02297c58
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_2e4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_2ec:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd444
_LIT1: .word data_ov002_022d008c
