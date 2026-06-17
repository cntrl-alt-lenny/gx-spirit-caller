; func_ov002_0224dafc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf17c
        .extern func_0202e234
        .extern func_0203058c
        .extern func_ov002_02253458
        .global func_ov002_0224dafc
        .arm
func_ov002_0224dafc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    ldr r0, _LIT0
    and r2, r7, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT2
    mov r8, #0xd
    add r6, r0, r1
    add r5, r6, #0x260
.L_38:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202e234
    cmp r0, #0x0
    beq .L_74
    mov r0, r9
    bl func_0203058c
    cmp r0, #0x0
    bne .L_74
    mov r0, r7
    mov r1, r8
    mov r2, r4
    bl func_ov002_02253458
.L_74:
    ldr r0, [r6, #0x10]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022cf16c
