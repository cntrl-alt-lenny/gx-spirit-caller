; func_ov002_022b0198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc804
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1a9c
        .extern func_02006110
        .extern func_0200612c
        .extern func_0200617c
        .extern func_02006194
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d738
        .extern func_0208fd30
        .extern func_ov002_0225984c
        .extern func_ov002_022aecd0
        .extern func_ov002_022b00fc
        .global func_ov002_022b0198
        .arm
func_ov002_022b0198:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r5, [r4, #0x8]
    mvn r1, #0x0
    ldr r0, _LIT0
    str r1, [r4, #0x8]
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r0, #0x0
    ldreq r0, _LIT0
    ldreq r0, [r0, #0xd0]
    cmpeq r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_0225984c
    movs r6, r0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_02006194
    cmp r0, #0x0
    bne .L_70
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_70:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_0200612c
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    mov r0, r4
    mov r3, r6
    bl func_ov002_022b00fc
    movs r7, r0
    addmi sp, sp, #0x8
    ldmmiia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    mov r0, r4
    mov r3, r6
    bl func_ov002_022b00fc
    cmp r7, r0
    addne sp, sp, #0x8
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    str r7, [r4, #0x8]
    cmp r5, r7
    beq .L_10c
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r5, r0
    bl func_0201d738
    ldr r2, [r4, #0x8]
    mov r1, #0x3000
    sub r2, r2, #0x2
    add r0, r0, r2, lsl #0xa
    mov r2, #0x400
    bl func_0208fd30
    mov r0, r5
    bl Task_Invoke
.L_10c:
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT2
    mov r1, r7
    bl func_ov002_022aecd0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d0f2c
_LIT1: .word data_ov002_022cc804
_LIT2: .word data_ov002_022d1a9c
