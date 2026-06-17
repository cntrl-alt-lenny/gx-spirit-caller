; func_ov002_02247670 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02247670
        .global func_ov002_02247670
        .arm
func_ov002_02247670:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r7, r1
    mov r8, r0
    mov r6, r2
    mov r5, r3
    bmi .L_1a18
    add r4, r6, r5
.L_19c4:
    ldr r2, [r8, r7, lsl #0x2]
    cmp r2, r6
    bge .L_1a04
    cmp r7, #0x0
    beq .L_1a10
    cmp r5, r2
    movlt r3, r5
    movge r3, r2
    mov r0, r8
    sub r1, r7, #0x1
    sub r2, r6, r2
    bl func_ov002_02247670
    cmp r0, #0x0
    beq .L_1a10
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a04:
    cmp r2, r4
    movlt r0, #0x1
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a10:
    subs r7, r7, #0x1
    bpl .L_19c4
.L_1a18:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
