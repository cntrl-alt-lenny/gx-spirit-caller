; func_0201edc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207f768
        .extern func_0208f0dc
        .extern func_0208f128
        .extern func_0208f19c
        .extern func_0208f2a4
        .extern func_0208f2fc
        .extern func_0208f370
        .extern func_0208fdcc
        .extern func_0208fe34
        .extern func_0208ff60
        .extern func_0208ffb8
        .extern func_0209002c
        .extern func_0209281c
        .global func_0201edc8
        .arm
func_0201edc8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldr r8, [sp, #0x18]
    mov r6, r1
    ldr r0, [r7, #0xc]
    mov r5, r2
    mov r1, r8
    mov r4, r3
    bl func_0209281c
    cmp r5, #0x0
    beq .L_b8
    cmp r5, #0x1
    beq .L_40
    cmp r5, #0x2
    beq .L_7c
    b .L_d0
.L_40:
    ldr r0, [r7, #0x4]
    cmp r0, #0x0
    beq .L_68
    bl func_0208f370
    ldr r0, [r7, #0xc]
    mov r1, r6
    mov r2, r8
    bl func_0208f2fc
    bl func_0208f2a4
    b .L_d0
.L_68:
    ldr r0, [r7, #0xc]
    mov r1, r6
    mov r2, r8
    bl func_0208fe34
    b .L_d0
.L_7c:
    ldr r0, [r7, #0x4]
    cmp r0, #0x0
    beq .L_a4
    bl func_0208f19c
    ldr r0, [r7, #0xc]
    mov r1, r6
    mov r2, r8
    bl func_0208f128
    bl func_0208f0dc
    b .L_d0
.L_a4:
    ldr r0, [r7, #0xc]
    mov r1, r6
    mov r2, r8
    bl func_0208fdcc
    b .L_d0
.L_b8:
    bl func_0209002c
    ldr r0, [r7, #0xc]
    mov r1, r6
    mov r2, r8
    bl func_0208ffb8
    bl func_0208ff60
.L_d0:
    ldr r1, [r7]
    mov r0, r4
    str r1, [r4]
    ldr r3, [r7, #0x4]
    mov r1, r5
    mov r2, r6
    str r3, [r4, #0x4]
    bl func_0207f768
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
