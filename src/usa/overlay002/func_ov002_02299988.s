; func_ov002_02299988 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022d008c
        .extern func_ov002_022973ac
        .extern func_ov002_02297c58
        .extern func_ov002_0229968c
        .global func_ov002_02299988
        .arm
func_ov002_02299988:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x8]
    ldr r4, [r1, #0xcec]
    cmp r0, #0x0
    beq .L_1d60
    cmp r0, #0x1
    beq .L_1d88
    cmp r0, #0x2
    beq .L_1dac
    b .L_1de4
.L_1d60:
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_022973ac
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_1d88:
    mov r0, r4
    bl func_ov002_02297c58
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_1dac:
    mov r6, #0x0
    mov r5, #0x1
.L_1db4:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_0229968c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_1db4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_1de4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd444
_LIT1: .word data_ov002_022d008c
