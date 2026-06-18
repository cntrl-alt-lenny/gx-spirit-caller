; func_ov002_0228ad68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern func_ov002_0227db10
        .global func_ov002_0228ad68
        .arm
func_ov002_0228ad68:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r5, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r0, r2, r5
    ldr r1, [r1, r0]
    mov r9, #0x0
    cmp r1, #0x0
    bls .L_9c
    ldr r8, _LIT2
    mov sl, r9
    mov r7, r9
    mov r6, #0x1
.L_44:
    add r0, r8, r0
    add r0, r0, sl
    ldr r0, [r0, #0x120]
    mov r1, r7
    mov r0, r0, lsl #0x13
    mov r2, r6
    mov r0, r0, lsr #0x13
    bl func_ov002_0227db10
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r4, #0x2]
    add r9, r9, #0x1
    add sl, sl, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mul r0, r1, r5
    add r1, r8, r0
    ldr r1, [r1, #0xc]
    cmp r9, r1
    bcc .L_44
.L_9c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022cf16c
