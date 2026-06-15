; func_0203a780 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203a694
        .extern func_0203a6e8
        .extern func_0203a744
        .extern func_02089134
        .global func_0203a780
        .arm
func_0203a780:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r0, r1
    mov r7, r2
    bl func_02089134
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_1bac
    add r6, r4, #0x4
.L_1b1c:
    ldrb r0, [r6]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1b98
    b .L_1b3c
    b .L_1b7c
    b .L_1b98
    b .L_1b5c
.L_1b3c:
    ldr r1, [r6, #0x4]
    mov r0, r8
    mov r2, r7
    bl func_0203a6e8
    cmp r0, #0x0
    bne .L_1b98
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1b5c:
    ldr r1, [r6, #0x4]
    mov r0, r8
    mov r2, r7
    bl func_0203a744
    cmp r0, #0x0
    bne .L_1b98
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1b7c:
    ldr r1, [r6, #0x4]
    mov r0, r8
    mov r2, r7
    bl func_0203a694
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_1b98:
    ldr r0, [r4]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x8
    bcc .L_1b1c
.L_1bac:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
