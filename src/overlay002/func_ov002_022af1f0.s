; func_ov002_022af1f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02102c90
        .extern func_02001d0c
        .extern func_02005088
        .extern func_0202c0c0
        .extern func_0208fd30
        .extern func_02092904
        .extern func_02094504
        .global func_ov002_022af1f0
        .arm
func_ov002_022af1f0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    addlt sp, sp, #0x8
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, #0x300
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r6, r0
    mov r1, r6
    mov r0, #0x0
    mov r2, #0x300
    bl func_02094504
    ldr r0, _LIT0
    mov r1, #0xc
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, [r4, #0x2c]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x1c]
    add r0, r0, #0x86
    add r0, r0, #0x300
    bl func_0202c0c0
    mov r1, r0
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r2, r6
    mov r3, #0x1
    bl func_02005088
    ldr r1, _LIT0
    mov r0, r6
    ldr r2, [r1, #0x8]
    mov r1, #0x300
    str r2, [r4, #0x34]
    bl func_02092904
    mov r5, #0x80
    ldr r8, _LIT1
    mov r7, #0x0
    mov r9, r6
    mov sl, #0x1
    mov r4, r5
.L_58c:
    mov r0, r9
    mov r1, r8
    mov r2, r5
    bl func_0208fd30
    mov r0, sl, lsl #0x7
    add r1, r0, #0x1c80
    mov r2, r4
    add r0, r9, #0x180
    add r1, r1, #0x4000
    bl func_0208fd30
    add r7, r7, #0x1
    cmp r7, #0x3
    add r8, r8, #0x100
    add r9, r9, #0x80
    add sl, sl, #0x2
    blt .L_58c
    mov r0, r6
    bl Task_InvokeLocked
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02102c90
_LIT1: .word 0x00005c80
