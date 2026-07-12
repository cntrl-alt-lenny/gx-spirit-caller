; func_ov016_021b3978 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3714
        .extern func_020b3720
        .global func_ov016_021b3978
        .arm
func_ov016_021b3978:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r6, #0x0
    mov fp, #0xa
    mov sl, r0
    mov r8, r6
    orr r9, r2, #0x0
    orr r5, r1, #0x0
    mov r7, #0x1
    mov r4, fp
.L_24:
    mov r0, r5
    mov r1, r9
    mov r2, fp
    mov r3, #0x0
    bl func_020b3720
    umull r2, r1, r0, r7
    adds r0, r6, r2
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
    mov r0, r5
    mov r1, r9
    mov r2, #0xa
    mov r3, #0x0
    bl func_020b3714
    mov r5, r0
    mul r0, r7, r4
    mov r9, r1
    mov r0, r0, lsl #0x10
    mov r1, r8, lsr #0x1f
    mov r7, r0, lsr #0x10
    rsb r0, r1, r8, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    cmp r0, #0x3
    streqh r6, [sl], #0x2
    add r8, r8, #0x1
    moveq r6, #0x0
    moveq r7, #0x1
    cmp r8, #0xc
    blt .L_24
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
