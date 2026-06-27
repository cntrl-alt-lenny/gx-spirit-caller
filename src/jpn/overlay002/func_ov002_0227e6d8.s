; func_ov002_0227e6d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdb98
        .extern data_ov002_022cdba8
        .extern func_0202b95c
        .extern func_ov002_0227e65c
        .extern func_ov002_02281494
        .extern func_ov002_02281884
        .global func_ov002_0227e6d8
        .arm
func_ov002_0227e6d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r7, _LIT0
    mov r6, r0
    ldr r0, [r7, #0xc]
    mov r4, #0x0
    cmp r0, #0x0
    bls .L_94
    ldr r5, _LIT1
    mov r8, r4
.L_24:
    mov r0, r4
    bl func_ov002_0227e65c
    cmp r0, #0x0
    bne .L_80
    ldr r1, [r5]
    mov r0, r6
    mov r1, r1, lsl #0x13
    mov r9, r1, lsr #0x13
    mov r1, r9
    bl func_ov002_02281884
    cmp r0, #0x0
    bne .L_80
    mov r0, r9
    mov r1, r8
    bl func_ov002_02281494
    cmp r0, #0x0
    movne r0, r4
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    bl func_0202b95c
    cmp r0, #0x3
    movlt r0, r4
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_80:
    ldr r0, [r7, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_24
.L_94:
    mvn r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cdb98
_LIT1: .word data_ov002_022cdba8
