; func_ov012_021c9e1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov012_021cc150
        .extern data_ov012_021cc6dc
        .extern data_ov012_021cc934
        .extern data_ov012_021ccbc4
        .extern func_ov000_021aa4a0
        .extern func_ov000_021aa4b4
        .extern func_ov000_021aa4c4
        .extern func_ov000_021aa898
        .extern func_ov000_021aa9cc
        .extern func_ov002_021b3774
        .extern func_ov012_021c9da0
        .global func_ov012_021c9e1c
        .arm
func_ov012_021c9e1c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x40
    ldr r0, _LIT0
    ldr r6, _LIT1
    bl func_ov000_021aa4b4
    mov r0, #0x0
    mov r1, r0
    bl func_ov000_021aa4c4
    mov r0, #0x0
    mov r1, r0
    mov r2, #0xa000
    bl func_ov000_021aa898
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    bl func_ov000_021aa9cc
    ldr r5, _LIT2
    add r4, sp, #0x10
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r0, _LIT3
    .word 0xebffa62f
    mov r8, #0x0
    mov r9, r8
    add r5, sp, #0x4
    mov r4, #0x1000
    mov fp, r8
.L_f8:
    mov r7, fp
    add sl, sp, #0x10
.L_100:
    ldmia sl, {r0, r1, r2}
    stmia r5, {r0, r1, r2}
    ldr r0, [sp, #0x8]
    add r0, r0, r9
    str r0, [sp, #0x8]
    str r4, [sp]
    ldr r0, [r6, #0x4e8]
    ldmia r5, {r1, r2, r3}
    .word 0xebffa623
    add r7, r7, #0x1
    cmp r7, #0x4
    add sl, sl, #0xc
    bcc .L_100
    add r8, r8, #0x1
    cmp r8, #0x8
    add r9, r9, #0x1000
    blt .L_f8
    ldr r0, [r6, #0x4e8]
    mov r1, #0x1
    bl func_ov002_021b3774
    ldr r0, _LIT4
    bl func_ov000_021aa4a0
    add r0, r6, #0x3a0
    bl func_ov000_021aa4b4
    mov r0, #0x0
    mov r1, #0x1
    bl func_ov000_021aa4c4
    mov r0, #0x0
    mov r1, r0
    mov r2, #0xa000
    bl func_ov000_021aa898
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    bl func_ov000_021aa9cc
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov012_021cc934
_LIT1: .word data_ov012_021cc6dc
_LIT2: .word data_ov012_021cc150
_LIT3: .word data_ov012_021ccbc4
_LIT4: .word func_ov012_021c9da0
