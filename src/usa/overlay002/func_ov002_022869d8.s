; func_ov002_022869d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c2544
        .extern func_ov002_022579d0
        .global func_ov002_022869d8
        .arm
func_ov002_022869d8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldrh r1, [r7, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_022579d0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r4, _LIT0
    ldr r8, _LIT1
    mov r5, #0x5
    mov r6, #0x64
.L_34:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mla r2, r1, r8, r4
    add r3, r2, r6
    ldr r1, [r3, #0x30]
    mov r1, r1, lsl #0x13
    movs r2, r1, lsr #0x13
    ldrneh r1, [r3, #0x38]
    cmpne r1, #0x0
    beq .L_7c
    mov r1, r5
    bl func_ov002_021c2544
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_7c:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r6, r6, #0x14
    blt .L_34
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
