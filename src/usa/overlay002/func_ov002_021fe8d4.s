; func_ov002_021fe8d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b824
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern IsValue12D3Or147E
        .extern func_ov002_021fdcac
        .global func_ov002_021fe8d4
        .arm
func_ov002_021fe8d4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r5, r0
    add r0, sp, #0x0
    mov r4, r1
    bl func_ov002_021fdcac
    mov r0, r4
    bl IsValue12D3Or147E
    cmp r0, #0x0
    addne sp, sp, #0x30
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_0202b824
    cmp r0, #0x17
    bne .L_1138
    add r0, sp, #0x0
    ldr r1, [r0, r5, lsl #0x2]
    cmp r1, #0x2
    bne .L_1100
    ldr r0, _LIT0
    cmp r4, r0
    addne sp, sp, #0x30
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_1100:
    cmp r1, #0x1
    addeq sp, sp, #0x30
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [sp, #0x1c]
    cmp r0, #0x0
    beq .L_11d0
    mov r0, r4
    bl func_0202b86c
    cmp r0, #0x4
    bne .L_11d0
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_1138:
    add r0, sp, #0x8
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x0
    addne sp, sp, #0x30
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_1174
    mov r0, r4
    bl func_0202b86c
    cmp r0, #0x4
    addeq sp, sp, #0x30
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_1174:
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq .L_11ac
    mov r0, r4
    bl func_0202b86c
    cmp r0, #0x3
    beq .L_11a0
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_11ac
.L_11a0:
    add sp, sp, #0x30
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_11ac:
    ldr r0, [sp, #0x24]
    cmp r0, #0x0
    beq .L_11d0
    mov r0, r4
    bl func_0202b86c
    cmp r0, #0x2
    addeq sp, sp, #0x30
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
.L_11d0:
    mov r0, #0x0
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001302
