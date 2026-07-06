; func_ov002_022563f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021babc8
        .extern func_ov002_021c2e44
        .extern func_ov002_021de390
        .global func_ov002_022563f4
        .arm
func_ov002_022563f4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, #0x0
    ldr r7, _LIT0
    ldr r8, _LIT1
    ldr r6, _LIT2
    mov r9, r5
.L_314:
    ldr r0, [r6, #0xcec]
    mov r4, r9
    eor sl, r0, r5
.L_320:
    mov r0, sl
    mov r1, r4
    mov r2, r8
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_3b8
    mov r0, sl
    mov r1, r7
    bl func_ov002_021c2e44
    cmp r0, #0x0
    beq .L_39c
    mov r0, sl
    add r1, r7, #0x1
    bl func_ov002_021c2e44
    cmp r0, #0x0
    beq .L_39c
    mov r0, sl
    add r1, r7, #0x2
    bl func_ov002_021c2e44
    cmp r0, #0x0
    beq .L_39c
    mov r0, sl
    add r1, r7, #0x3
    bl func_ov002_021c2e44
    cmp r0, #0x0
    beq .L_39c
    mov r0, sl
    add r1, r7, #0x4
    bl func_ov002_021c2e44
    cmp r0, #0x0
    bne .L_3b8
.L_39c:
    mov r2, #0x0
    mov r0, sl
    mov r1, r4
    mov r3, r2
    bl func_ov002_021de390
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3b8:
    add r4, r4, #0x1
    cmp r4, #0x4
    ble .L_320
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_314
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000fb7
_LIT1: .word 0x00001645
_LIT2: .word data_ov002_022d008c
