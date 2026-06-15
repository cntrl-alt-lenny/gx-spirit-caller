; func_ov016_021b5188 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov016_021b5154
        .global func_ov016_021b5188
        .arm
func_ov016_021b5188:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    cmp r1, #0x0
    movne r7, #0x86
    mov r5, #0x0
    mov fp, #0x1
    mov sl, r0
    mov r9, r2
    mov r8, r3
    moveq r7, #0x40
    mov r6, r5
    mov r4, fp
.L_30:
    mov r0, #0xf
    and r2, r9, r0
    mov r1, r5, asr #0x1
    add r0, r5, r1, lsr #0x1e
    mov r3, r0, asr #0x2
    mov r9, r9, lsr #0x4
    mov r0, r8, lsr #0x4
    orr r9, r9, r8, lsl #0x1c
    cmp r2, #0xa
    mov r8, r0
    mov r1, #0x0
    bge .L_88
    str r7, [sp]
    rsb ip, r6, #0xda
    str r4, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    mov r2, r2, lsl #0x1
    mov r0, sl
    sub r3, ip, r3, lsl #0x2
    bl func_ov016_021b5154
    b .L_a4
.L_88:
    rsb r0, r6, #0xda
    stmia sp, {r7, fp}
    sub r3, r0, r3, lsl #0x2
    mov r0, sl
    mov r2, #0x16
    str r1, [sp, #0x8]
    bl func_ov016_021b5154
.L_a4:
    add r5, r5, #0x1
    cmp r5, #0xc
    add r6, r6, #0x11
    blt .L_30
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
