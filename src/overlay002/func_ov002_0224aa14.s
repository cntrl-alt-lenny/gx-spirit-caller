; func_ov002_0224aa14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b890
        .extern func_0202e234
        .extern func_ov002_021b9128
        .extern func_ov002_02253458
        .global func_ov002_0224aa14
        .arm
func_ov002_0224aa14:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    ldr r0, _LIT0
    and r3, r8, #0x1
    mul r2, r3, r0
    ldr r0, _LIT1
    mov r7, r1
    ldr r0, [r0, r2]
    mov r4, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r9, #0xe
    add r6, r0, r2
    add r0, r6, #0x18
    add r5, r0, #0x400
.L_2dc:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202e234
    cmp r0, #0x0
    beq .L_324
    mov r0, r7
    bl func_0202b890
    mov r1, r0
    mov r0, sl
    bl func_ov002_021b9128
    cmp r0, #0x0
    beq .L_324
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_02253458
.L_324:
    ldr r0, [r6, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_2dc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
