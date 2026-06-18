; func_ov002_021bd3e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b890
        .global func_ov002_021bd3e0
        .arm
func_ov002_021bd3e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r2, r0, r2
    ldr r0, _LIT1
    mov r5, #0x0
    ldr r0, [r0, r2]
    mov r8, r1
    mov r4, r5
    cmp r0, #0x0
    bls .L_e4
    ldr r0, _LIT2
    add r7, r0, r2
    add r0, r7, #0x18
    add r6, r0, #0x400
.L_b8:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b890
    cmp r8, r0
    ldr r0, [r7, #0x14]
    add r4, r4, #0x1
    addeq r5, r5, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_b8
.L_e4:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf180
_LIT2: .word data_ov002_022cf16c
