; func_ov002_022920d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_0202f994
        .global func_ov002_022920d0
        .arm
func_ov002_022920d0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, #0x0
    ldr r4, _LIT0
    ldr r8, _LIT1
    mov r7, r0
    mov r6, r5
.L_18:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r0, r1, r8, r4
    add r0, r0, r6
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202f994
    cmp r0, #0x0
    beq .L_70
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r0, r1, r8, r4
    add r0, r6, r0
    ldrh r0, [r0, #0x38]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_70:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r6, r6, #0x14
    blt .L_18
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
