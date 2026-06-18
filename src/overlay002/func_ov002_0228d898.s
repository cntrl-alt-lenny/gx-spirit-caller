; func_ov002_0228d898 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b00d0
        .extern func_ov002_0223dcc0
        .extern func_ov002_022575c8
        .global func_ov002_0228d898
        .arm
func_ov002_0228d898:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x2c
    mov r5, r0
    mov r4, r1
    mov r1, #0x0
    add r0, sp, #0x0
.L_ef4:
    str r1, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0xa
    ble .L_ef4
    mov r7, #0xa
    add r6, sp, #0x0
.L_f0c:
    add r0, r7, #0x1
    bl func_ov002_021b00d0
    ldr r2, [r6, r7, lsl #0x2]
    ldr r1, [r6, r0, lsl #0x2]
    str r1, [r6, r7, lsl #0x2]
    sub r7, r7, #0x1
    str r2, [r6, r0, lsl #0x2]
    cmp r7, #0x0
    bgt .L_f0c
    mov sl, #0x0
    add r6, sp, #0x0
    mov r7, sl
.L_f3c:
    mov r8, r7
.L_f40:
    ldr r9, [r6, r8, lsl #0x2]
    mov r0, r5
    mov r1, r4
    mov r2, r9
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_f78
    mov r0, r5
    mov r1, r4
    mov r2, r9
    bl func_ov002_0223dcc0
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_f78:
    add r8, r8, #0x1
    cmp r8, #0xa
    ble .L_f40
    add sl, sl, #0x1
    cmp sl, #0x2
    eor r4, r4, #0x1
    blt .L_f3c
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
