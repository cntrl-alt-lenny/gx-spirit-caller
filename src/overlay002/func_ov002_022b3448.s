; func_ov002_022b3448 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca760
        .extern data_ov002_022ca778
        .extern data_ov002_022ccaf8
        .extern data_ov002_022ccb18
        .extern data_ov002_022cd73c
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201d738
        .extern func_0201e5b8
        .extern func_02091554
        .extern func_02094550
        .global func_ov002_022b3448
        .arm
func_ov002_022b3448:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x78
    mov r5, r0
    ldr r0, [r5, #0x4]
    mov r4, r1
    cmp r0, #0x0
    addeq sp, sp, #0x78
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [r5, #0xc]
    cmp r0, #0x0
    addlt sp, sp, #0x78
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r4, #0x7
    addeq sp, sp, #0x78
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r7, _LIT0
    add r6, sp, #0x60
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia r7, {r0, r1}
    stmia r6, {r0, r1}
    ldr r7, _LIT1
    add r6, sp, #0x48
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia r7, {r0, r1}
    stmia r6, {r0, r1}
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT2
    ldr r1, [r5, #0xc]
    ldr r0, [r0, #0x4]
    eor r0, r0, #0x1
    cmp r1, r0
    add r1, sp, #0x60
    moveq r3, #0x1
    ldr r2, [r1, r4, lsl #0x2]
    ldr r1, _LIT3
    movne r3, #0x0
    add r0, sp, #0x28
    bl func_02091554
    add r0, sp, #0x28
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r2, #0x2e80
    ldrh r1, [sp, #0x14]
    str r0, [sp]
    str r2, [sp, #0xc]
    bic r0, r1, #0xf
    orr r3, r0, #0x4
    mvn r1, #0x0
    add r0, sp, #0x0
    strh r3, [sp, #0x14]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    ldr r0, [sp]
    bl func_02006e1c
    add r1, sp, #0x48
    ldr r2, [r1, r4, lsl #0x2]
    ldr r1, _LIT4
    add r0, sp, #0x28
    bl func_02091554
    add r0, sp, #0x28
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp]
    bl func_0201d738
    mov r5, #0x0
    mov r7, r0
    mov r8, r5
    mov sl, #0x80
    mov r4, r5
.L_128:
    mov r6, r4
    mov r9, r5
.L_130:
    add r0, r6, r8
    mov r0, r0, lsl #0x7
    add r1, r0, #0x6400000
    mov r2, sl
    add r0, r7, r9, lsl #0x7
    add r1, r1, #0x2980
    bl func_02094550
    add r6, r6, #0x1
    cmp r6, #0x2
    add r9, r9, #0x5
    blt .L_130
    add r5, r5, #0x1
    cmp r5, #0x5
    add r8, r8, #0x2
    blt .L_128
    ldr r0, [sp]
    bl func_02006e1c
    add sp, sp, #0x78
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ca778
_LIT1: .word data_ov002_022ca760
_LIT2: .word data_ov002_022cd73c
_LIT3: .word data_ov002_022ccaf8
_LIT4: .word data_ov002_022ccb18
