; func_ov002_0227b0b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021be384
        .extern func_ov002_021be4a0
        .extern func_ov002_0227b090
        .global func_ov002_0227b0b8
        .arm
func_ov002_0227b0b8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov sl, r0
    ldr r4, _LIT0
    ldr r0, _LIT1
    and r3, sl, #0x1
    mla r0, r3, r0, r4
    mov fp, #0x1
    mov r9, r1
    mov r8, r2
    add r7, r0, #0x30
    mvn r6, #0x0
    mov r5, #0x0
    mov r4, fp
.L_38:
    cmp r5, r9
    beq .L_98
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_98
    cmp r8, #0x0
    mov r0, sl
    mov r1, r5
    beq .L_6c
    mov r2, r4
    bl func_ov002_021be384
    b .L_74
.L_6c:
    mov r2, fp
    bl func_ov002_021be4a0
.L_74:
    cmp r0, #0x0
    beq .L_98
    mov r0, sl
    mov r1, r5
    add r2, sp, #0x0
    bl func_ov002_0227b090
    ldr r0, [sp, #0x14]
    cmp r0, r6
    movgt r6, r0
.L_98:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r7, r7, #0x14
    ble .L_38
    mov r0, r6
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
