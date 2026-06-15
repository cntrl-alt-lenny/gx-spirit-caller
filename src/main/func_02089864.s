; func_02089864 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207cfc8
        .extern func_0207cff4
        .extern func_0207da7c
        .extern func_02089748
        .extern func_02089768
        .global func_02089864
        .arm
func_02089864:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    mov r5, #0x0
    mov r1, r5
    add r0, r8, #0x4
    bl func_0207cfc8
    movs r7, r0
    beq .L_100
    add r9, r8, #0x4
    mov sl, #0x1
    mov r4, r5
.L_94:
    mov r0, r7
    mov r1, r4
    bl func_0207cfc8
    movs r6, r0
    beq .L_e0
.L_a8:
    ldr ip, [r6, #0xc]
    cmp ip, #0x0
    beq .L_cc
    ldr r1, [r6, #0x8]
    ldr r2, [r6, #0x10]
    ldr r3, [r6, #0x14]
    add r0, r6, #0x20
    blx ip
    mov r5, sl
.L_cc:
    mov r0, r7
    mov r1, r6
    bl func_0207cfc8
    movs r6, r0
    bne .L_a8
.L_e0:
    mov r0, r9
    mov r1, r7
    bl func_0207cff4
    mov r0, r9
    mov r1, r4
    bl func_0207cfc8
    movs r7, r0
    bne .L_94
.L_100:
    ldr r0, [r8]
    mov r1, #0x3
    bl func_0207da7c
    cmp r5, #0x0
    beq .L_118
    bl func_02089748
.L_118:
    mov r0, r8
    bl func_02089768
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
