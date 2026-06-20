; func_ov002_022643e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022c834c
        .extern data_ov002_022d016c
        .extern func_ov002_021b3ecc
        .extern func_ov002_021de41c
        .extern func_ov002_021df6d4
        .extern func_ov002_022576d8
        .global func_ov002_022643e8
        .arm
func_ov002_022643e8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    ldr r5, _LIT0
    mov r4, r0
    ldr r1, [r5, #0xd28]
    cmp r1, #0x2
    bcs .L_e8
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    ldr sl, _LIT1
    and r7, r0, #0x1
    add r9, sp, #0x0
    mov r8, #0x0
    mov fp, #0xb
.L_38:
    ldr r6, [sl, r1, lsl #0x2]
    mov r0, r4
    mov r1, fp
    mov r2, r6
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    beq .L_d4
    str r8, [r9]
    ldrh r1, [sp, #0x2]
    mov r0, r9
    str r8, [r9, #0x4]
    bic r1, r1, #0x1
    orr r1, r1, r7
    strh r1, [sp, #0x2]
    ldrh r1, [sp, #0x2]
    str r8, [r9, #0x8]
    str r8, [r9, #0xc]
    bic r1, r1, #0x3000
    str r8, [r9, #0x10]
    str r8, [r9, #0x14]
    strh r6, [sp]
    strh r1, [sp, #0x2]
    bl func_ov002_022576d8
    movs r6, r0
    beq .L_d4
    ldrh r1, [sp]
    mov r0, r4
    bl func_ov002_021df6d4
    ldrh r1, [sp]
    mov r0, r4
    mov r2, r6
    bl func_ov002_021de41c
    ldr r1, _LIT0
    add sp, sp, #0x18
    ldr r2, [r1, #0xd28]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd28]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d4:
    ldr r0, [r5, #0xd28]
    add r1, r0, #0x1
    str r1, [r5, #0xd28]
    cmp r1, #0x2
    bcc .L_38
.L_e8:
    mov r0, #0x1
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022c834c
