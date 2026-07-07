; func_ov002_0224e814 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202df24
        .extern func_ov002_021c3304
        .extern func_ov002_02253370
        .global func_ov002_0224e814
        .arm
func_ov002_0224e814:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r2, _LIT0
    mov r8, r0
    cmp r1, r2
    beq .L_24
    ldr r0, _LIT1
    cmp r1, r0
    ldreq r5, _LIT2
    b .L_28
.L_24:
    sub r5, r2, #0xbb
.L_28:
    ldr r0, _LIT3
    and r2, r8, #0x1
    mul r1, r2, r0
    ldr r0, _LIT4
    mov r4, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT5
    mov r9, #0xe
    add r7, r0, r1
    add r0, r7, #0x18
    add r6, r0, #0x400
.L_5c:
    ldr r0, [r6]
    mov r1, r5
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    beq .L_a0
    mov r0, r8
    mov r1, r8
    mov r2, r4
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_a0
    mov r0, r8
    mov r1, r9
    mov r2, r4
    bl func_ov002_02253370
.L_a0:
    ldr r0, [r7, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r6, r6, #0x4
    bcc .L_5c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x0000183d
_LIT1: .word 0x00001a42
_LIT2: .word 0x00000fe4
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf0a0
_LIT5: .word data_ov002_022cf08c
