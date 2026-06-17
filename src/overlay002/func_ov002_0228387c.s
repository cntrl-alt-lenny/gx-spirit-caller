; func_ov002_0228387c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022cd538
        .extern data_ov002_022cf16c
        .extern func_ov002_0227b090
        .global func_ov002_0228387c
        .arm
func_ov002_0228387c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    mov r6, #0x0
    ldr r8, _LIT1
    ldr r5, _LIT2
    ldr r4, _LIT3
    str r0, [r1]
    mov fp, r6
.L_890:
    and r0, r6, #0x1
    mla r1, r0, r4, r5
    mov r7, fp
    mov sl, r8
    add r9, r1, #0x30
.L_8a4:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_8c4
    mov r0, r6
    mov r1, r7
    mov r2, sl
    bl func_ov002_0227b090
.L_8c4:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r9, r9, #0x14
    add sl, sl, #0x2c
    blt .L_8a4
    add r6, r6, #0x1
    cmp r6, #0x2
    add r8, r8, #0xdc
    blt .L_890
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd524
_LIT1: .word data_ov002_022cd538
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
