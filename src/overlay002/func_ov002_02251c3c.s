; func_ov002_02251c3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf188
        .extern func_0202b878
        .extern func_0202e234
        .extern func_ov002_021c988c
        .extern func_ov002_02253458
        .global func_ov002_02251c3c
        .arm
func_ov002_02251c3c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r7, r0
    ldr r0, _LIT0
    and r3, r7, #0x1
    mul r2, r3, r0
    ldr r0, _LIT1
    mov r6, r1
    ldr r0, [r0, r2]
    mov sl, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    mov fp, #0xf
    add r5, r0, r2
    add r4, r5, #0x5d0
    mov r8, fp
.L_40:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e234
    cmp r0, #0x0
    beq .L_a0
    mov r0, r9
    bl func_0202b878
    mov r9, r0
    mov r0, r6
    bl func_0202b878
    cmp r9, r0
    bne .L_a0
    mov r0, r7
    mov r1, r8
    mov r2, sl
    bl func_ov002_021c988c
    cmp r0, #0x0
    beq .L_a0
    mov r0, r7
    mov r1, fp
    mov r2, sl
    bl func_ov002_02253458
.L_a0:
    ldr r0, [r5, #0x1c]
    add sl, sl, #0x1
    cmp sl, r0
    add r4, r4, #0x4
    bcc .L_40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf188
_LIT2: .word data_ov002_022cf16c
