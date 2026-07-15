; func_ov012_021c9d3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov012_021cc070
        .extern data_ov012_021cc5fc
        .extern data_ov012_021cc854
        .extern data_ov012_021ccae4
        .extern func_ov000_021aa3c0
        .extern func_ov000_021aa3d4
        .extern func_ov000_021aa3e4
        .extern func_ov000_021aa7b8
        .extern func_ov000_021aa8ec
        .extern func_ov012_021c9cc0
        .global func_ov012_021c9d3c
        .arm
func_ov012_021c9d3c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x40
    ldr r0, _LIT0
    ldr r6, _LIT1
    bl func_ov000_021aa3d4
    mov r0, #0x0
    mov r1, r0
    bl func_ov000_021aa3e4
    mov r0, #0x0
    mov r1, r0
    mov r2, #0xa000
    bl func_ov000_021aa7b8
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    bl func_ov000_021aa8ec
    ldr r5, _LIT2
    add r4, sp, #0x10
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r0, _LIT3
    .word 0xebffa62c
    mov r8, #0x0
    mov r9, r8
    add r5, sp, #0x4
    mov r4, #0x1000
    mov fp, r8
.L_10c:
    mov r7, fp
    add sl, sp, #0x10
.L_114:
    ldmia sl, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    ldr r0, [sp, #0x8]
    add r0, r0, r9
    str r0, [sp, #0x8]
    str r4, [sp]
    ldr r0, [r6, #0x4e8]
    ldmia r5, {r1, r2, r3}
    .word 0xebffa620
    add r7, r7, #0x1
    cmp r7, #0x4
    add sl, sl, #0xc
    bcc .L_114
    add r8, r8, #0x1
    cmp r8, #0x8
    add r9, r9, #0x1000
    blt .L_10c
    ldr r0, [r6, #0x4e8]
    mov r1, #0x1
    .word 0xebffa61d
    ldr r0, _LIT4
    bl func_ov000_021aa3c0
    add r0, r6, #0x3a0
    bl func_ov000_021aa3d4
    mov r0, #0x0
    mov r1, #0x1
    bl func_ov000_021aa3e4
    mov r0, #0x0
    mov r1, r0
    mov r2, #0xa000
    bl func_ov000_021aa7b8
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    bl func_ov000_021aa8ec
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov012_021cc854
_LIT1: .word data_ov012_021cc5fc
_LIT2: .word data_ov012_021cc070
_LIT3: .word data_ov012_021ccae4
_LIT4: .word func_ov012_021c9cc0
