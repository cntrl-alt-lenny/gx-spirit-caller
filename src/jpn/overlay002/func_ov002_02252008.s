; func_ov002_02252008 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202e1e0
        .extern func_0202ed3c
        .extern func_ov002_021c3304
        .extern func_ov002_02253370
        .global func_ov002_02252008
        .arm
func_ov002_02252008:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    ldr r0, _LIT0
    and r3, r8, #0x1
    mul r2, r3, r0
    ldr r0, _LIT1
    mov r7, r1
    ldr r0, [r0, r2]
    mov r4, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r9, #0xe
    add r6, r0, r2
    add r0, r6, #0x18
    add r5, r0, #0x400
.L_11c:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_174
    mov r0, sl
    bl func_0202ed3c
    cmp r0, #0x0
    cmpne sl, r7
    beq .L_174
    mov r0, r8
    mov r1, r8
    mov r2, r4
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_174
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_02253370
.L_174:
    ldr r0, [r6, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_11c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
