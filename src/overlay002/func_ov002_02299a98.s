; func_ov002_02299a98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022d016c
        .extern func_ov002_022974bc
        .extern func_ov002_02297d68
        .extern func_ov002_0229979c
        .global func_ov002_02299a98
        .arm
func_ov002_02299a98:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x8]
    ldr r4, [r1, #0xcec]
    cmp r0, #0x0
    beq .L_1360
    cmp r0, #0x1
    beq .L_1388
    cmp r0, #0x2
    beq .L_13ac
    b .L_13e4
.L_1360:
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_022974bc
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_1388:
    mov r0, r4
    bl func_ov002_02297d68
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
.L_13ac:
    mov r6, #0x0
    mov r5, #0x1
.L_13b4:
    mov r0, r4
    mov r1, r6
    mov r2, r5
    bl func_ov002_0229979c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_13b4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_13e4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd524
_LIT1: .word data_ov002_022d016c
