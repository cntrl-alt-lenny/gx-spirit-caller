; func_ov002_02247588 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02247588
        .global func_ov002_02247588
        .arm
func_ov002_02247588:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r7, r1
    mov r8, r0
    mov r6, r2
    mov r5, r3
    bmi .L_814
    add r4, r6, r5
.L_7c0:
    ldr r2, [r8, r7, lsl #0x2]
    cmp r2, r6
    bge .L_800
    cmp r7, #0x0
    beq .L_80c
    cmp r5, r2
    movlt r3, r5
    movge r3, r2
    mov r0, r8
    sub r1, r7, #0x1
    sub r2, r6, r2
    bl func_ov002_02247588
    cmp r0, #0x0
    beq .L_80c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_800:
    cmp r2, r4
    movlt r0, #0x1
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
.L_80c:
    subs r7, r7, #0x1
    bpl .L_7c0
.L_814:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
