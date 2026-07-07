; func_ov002_02273128 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd238
        .extern data_ov002_022cd664
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021de4e4
        .extern func_ov002_02259204
        .extern func_ov002_0225930c
        .extern func_ov002_02270bb8
        .extern func_ov002_022903f0
        .global func_ov002_02273128
        .arm
func_ov002_02273128:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x18]
    mov r1, r1, lsl #0x18
    movs r1, r1, lsr #0x18
    beq .L_1790
    cmp r1, #0x1
    beq .L_17fc
    cmp r1, #0x2
    beq .L_1854
    b .L_185c
.L_1790:
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_17c0
    mov r1, r2, lsl #0x9
    ldr r2, _LIT2
    mov r1, r1, lsr #0x11
    bl func_ov002_022903f0
    b .L_17d0
.L_17c0:
    mov r1, #0x7e
    bl func_ov002_021ae320
    ldr r0, _LIT2
    bl func_ov002_02259204
.L_17d0:
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, pc}
.L_17fc:
    bl func_ov002_0225930c
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, _LIT4
    mov r2, #0x0
    ldr r3, [r0, #0xd74]
    ldr r1, [r0, #0xd78]
    ldr r0, [r0, #0xd70]
    add r1, r3, r1
    bl func_ov002_021de4e4
    ldr r3, _LIT3
    mov r0, #0x0
    ldr r2, [r3]
    mov r1, r2, lsl #0x18
    mov r1, r1, lsr #0x18
    add r1, r1, #0x1
    bic r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1
    str r1, [r3]
    ldmia sp!, {r3, pc}
.L_1854:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_185c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd220
_LIT1: .word data_ov002_022cd664
_LIT2: .word func_ov002_02270bb8
_LIT3: .word data_ov002_022cd238
_LIT4: .word data_ov002_022d008c
