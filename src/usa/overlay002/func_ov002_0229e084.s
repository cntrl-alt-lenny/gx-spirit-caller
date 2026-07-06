; func_ov002_0229e084 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0229d21c
        .extern func_ov002_0229d780
        .global func_ov002_0229e084
        .arm
func_ov002_0229e084:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r6, r4
    mov r5, #0x0
.L_14:
    mov r0, r6
    bl func_ov002_0229d21c
    add r5, r5, #0x1
    cmp r5, #0x8
    add r6, r6, #0x14
    blt .L_14
    mov r1, r4
    mov r2, #0x0
    mov ip, #0x1
.L_38:
    ldr r0, [r4, #0xa8]
    ldr r3, [r4, #0xa4]
    add r0, r0, r2
    cmp r0, r3
    bge .L_80
    ldrh lr, [r1, #0xa]
    mov r3, lr, lsl #0x11
    strh lr, [sp]
    movs r3, r3, lsr #0x1f
    beq .L_80
    mov r3, r0, asr #0x4
    add r3, r0, r3, lsr #0x1b
    mov r3, r3, asr #0x5
    add lr, r4, r3, lsl #0x2
    ldr r3, [lr, #0xbc]
    and r0, r0, #0x1f
    orr r0, r3, ip, lsl r0
    str r0, [lr, #0xbc]
.L_80:
    add r2, r2, #0x1
    cmp r2, #0x8
    add r1, r1, #0x14
    blt .L_38
    ldr r1, [r4, #0xb0]
    ldr r0, [r4, #0xac]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r4, #0xac]
    ldr r0, [r4, #0xac]
    str r0, [r4, #0xb0]
    ldr r0, [r4, #0xb4]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    sub r0, r0, #0x1
    cmp r0, #0x8
    addne sp, sp, #0x4
    str r0, [r4, #0xb4]
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r1, [r4, #0xa8]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_0229d780
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
