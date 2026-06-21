; func_ov002_022123fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021de408
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .global func_ov002_022123fc
        .arm
func_ov002_022123fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    mov r6, #0x0
    mov r7, r0
    mov r5, r6
    mov r8, #0x1
    add r4, sp, #0x0
.L_1c:
    mov r0, r7
    mov r1, r5
    mov r2, r4
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_68
    ldr r2, [sp]
    mov r0, r7
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r9, r2, #0xff
    and sl, r1, #0xff
    mov r1, r9
    mov r2, sl
    bl func_ov002_0225764c
    cmp r0, #0x0
    addne r0, sl, r9, lsl #0x4
    orrne r6, r6, r8, lsl r0
.L_68:
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_1c
    mov r0, r7
    mov r1, r6
    bl func_ov002_021de408
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
