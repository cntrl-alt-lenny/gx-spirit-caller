; func_ov002_02283bc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022cf16c
        .extern func_ov002_021be4a0
        .global func_ov002_02283bc8
        .arm
func_ov002_02283bc8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r4, _LIT0
    ldr r0, _LIT1
    and r3, sl, #0x1
    mla r4, r3, r0, r4
    add r6, r4, #0x30
    ldr r3, _LIT2
    mov r0, #0xdc
    mla r7, sl, r0, r3
    mov r9, r1
    mov r8, r2
    mvn r5, #0x0
    mov r4, #0x0
    mov fp, #0x1
.L_2fc:
    cmp r4, r9
    beq .L_340
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_340
    cmp r8, #0x0
    beq .L_334
    mov r0, sl
    mov r1, r4
    mov r2, fp
    bl func_ov002_021be4a0
    cmp r0, #0x0
    beq .L_340
.L_334:
    ldr r0, [r7, #0x28]
    cmp r0, r5
    movgt r5, r0
.L_340:
    add r4, r4, #0x1
    cmp r4, #0x4
    add r6, r6, #0x14
    add r7, r7, #0x2c
    ble .L_2fc
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cd524
