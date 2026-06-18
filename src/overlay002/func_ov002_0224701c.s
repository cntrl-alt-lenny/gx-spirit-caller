; func_ov002_0224701c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021bc8c8
        .extern func_ov002_021c1d28
        .extern func_ov002_021c84e0
        .global func_ov002_0224701c
        .arm
func_ov002_0224701c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r8, #0x0
    ldr r5, _LIT0
    ldr fp, _LIT1
    mov sl, r0
    mov r6, r8
    mov r4, r8
.L_1370:
    and r0, r6, #0x1
    mla r9, r0, fp, r5
    mov r7, #0x0
.L_137c:
    mov r0, sl
    mov r1, r6
    mov r2, r7
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    beq .L_13d0
    mov r0, r6
    mov r1, r7
    mov r2, r4
    bl func_ov002_021c1d28
    cmp r0, #0x0
    bne .L_13d0
    cmp sl, r6
    beq .L_13c0
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_13d0
.L_13c0:
    mov r0, r6
    mov r1, r7
    bl func_ov002_021c84e0
    add r8, r8, r0
.L_13d0:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r9, r9, #0x14
    blt .L_137c
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_1370
    mov r0, r8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
