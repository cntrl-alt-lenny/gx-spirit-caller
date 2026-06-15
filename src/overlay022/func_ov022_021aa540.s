; func_ov022_021aa540 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov022_021ab9a0
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201d6d4
        .extern func_0201d760
        .extern func_0201e5b8
        .extern func_020944a4
        .global func_ov022_021aa540
        .arm
func_ov022_021aa540:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x28
    ldr r4, _LIT0
    mov r7, r1
    ldr r0, [r4, r0, lsl #0x2]
    mov r6, r2
    mov r1, #0x4
    mov r2, #0x0
    mov r5, r3
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r1, [sp, #0x14]
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    strh r0, [sp, #0x14]
    cmp r7, #0x8
    addls pc, pc, r7, lsl #0x2
    b .L_18c
    b .L_120
    b .L_144
    b .L_168
    b .L_17c
    b .L_18c
    b .L_120
    b .L_144
    b .L_168
    b .L_17c
.L_120:
    cmp r6, #0x0
    moveq r0, #0x0
    ldr r1, [sp, #0x18]
    movne r0, #0x2
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [sp, #0x18]
    b .L_18c
.L_144:
    cmp r6, #0x0
    moveq r0, #0x1
    ldr r1, [sp, #0x18]
    movne r0, #0x3
    mov r0, r0, lsl #0x1d
    bic r1, r1, #0x1c000
    orr r0, r1, r0, lsr #0xf
    str r0, [sp, #0x18]
    b .L_18c
.L_168:
    ldr r0, [sp, #0x18]
    bic r0, r0, #0x1c000
    orr r0, r0, #0x8000
    str r0, [sp, #0x18]
    b .L_18c
.L_17c:
    ldr r0, [sp, #0x18]
    bic r0, r0, #0x1c000
    orr r0, r0, #0xc000
    str r0, [sp, #0x18]
.L_18c:
    ldrh r1, [sp, #0x14]
    add r0, sp, #0x0
    str r4, [sp]
    orr r1, r1, #0x10
    strh r1, [sp, #0x14]
    bl func_0201e5b8
    cmp r5, #0x0
    beq .L_1cc
    mov r0, r4
    bl func_0201d6d4
    mov r6, r0
    mov r0, r4
    bl func_0201d760
    mov r1, r5
    mov r2, r6
    bl func_020944a4
.L_1cc:
    mov r0, r4
    bl func_02006e1c
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov022_021ab9a0
