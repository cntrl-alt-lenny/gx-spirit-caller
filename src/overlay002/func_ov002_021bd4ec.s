; func_ov002_021bd4ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b878
        .extern func_0202b8c0
        .global func_ov002_021bd4ec
        .arm
func_ov002_021bd4ec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r2, r0, r2
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r2]
    mov r8, r1
    mov r4, r5
    cmp r0, #0x0
    bls .L_10c
    ldr r0, _LIT2
    add r7, r0, r2
    add r0, r7, #0x18
    add r6, r0, #0x400
.L_cc:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r9, r0, lsr #0x13
    mov r0, r9
    bl func_0202b878
    cmp r0, #0x17
    bne .L_f8
    mov r0, r9
    bl func_0202b8c0
    cmp r8, r0
    addeq r5, r5, #0x1
.L_f8:
    ldr r0, [r7, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_cc
.L_10c:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
