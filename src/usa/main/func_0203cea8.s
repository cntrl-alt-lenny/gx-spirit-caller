; func_0203cea8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .global func_0203cea8
        .arm
func_0203cea8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xcc
    ldr r2, _LIT0
    mov sl, r0
    add r0, r1, #0x470
    add r8, r1, r2
    str r0, [sp]
    subs r9, sl, #0x1
    bmi .L_290
    mov r4, #0xc0
    mla r6, r9, r4, r0
    add r7, r8, r9, lsl #0x2
    mov r5, #0x4
.L_1f4:
    add r1, r8, sl, lsl #0x2
    add r0, r8, r9, lsl #0x2
    ldrb r1, [r1, #0x2]
    ldrb r0, [r0, #0x2]
    cmp r1, r0
    bcc .L_290
    mov r0, r7
    add r1, sp, #0x4
    mov r2, r5
    bl Copy32
    add fp, r8, sl, lsl #0x2
    mov r0, fp
    mov r1, r7
    mov r2, r5
    bl Copy32
    mov r1, fp
    add r0, sp, #0x4
    mov r2, r5
    bl Copy32
    mov r0, r6
    add r1, sp, #0x8
    mov r2, r4
    bl Copy32
    ldr r0, [sp]
    mov r1, #0xc0
    mla fp, sl, r1, r0
    mov r0, fp
    mov r1, r6
    mov r2, r4
    bl Copy32
    mov r1, fp
    add r0, sp, #0x8
    mov r2, r4
    bl Copy32
    mov sl, r9
    sub r7, r7, #0x4
    sub r6, r6, #0xc0
    subs r9, r9, #0x1
    bpl .L_1f4
.L_290:
    add r1, r8, #0x28
    mov r0, #0x0
    mov r2, #0x4
    bl Fill32
    ldr r0, [sp]
    mov r2, #0xc0
    add r1, r0, #0x780
    mov r0, #0x0
    bl Fill32
    add sp, sp, #0xcc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000444
