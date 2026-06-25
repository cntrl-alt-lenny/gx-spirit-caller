; func_020813b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bede8
        .global func_020813b0
        .arm
func_020813b0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    ldr fp, _LIT0
    mov r9, #0x0
    mov sl, #0x3
    mvn r7, #0x0
.L_18:
    ldr r4, [sp, #0x2c]
    ldr r6, [sp, #0x28]
    and ip, r3, r7, lsl r4
    cmp ip, r1
    mov r8, r7, lsl r6
    mov r5, r7, lsl r4
    and lr, r2, r7, lsl r6
    bhi .L_68
    mla r9, r2, ip, r9
    cmp lr, r0
    movhi r2, lr
    subhi r1, r1, ip
    subhi r3, r3, ip
    bhi .L_b0
    sub r3, r3, ip
    mla r9, lr, r3, r9
    sub r0, r0, lr
    sub r1, r1, ip
    sub r2, r2, lr
    b .L_b0
.L_68:
    cmp lr, r0
    mlals r9, lr, ip, r9
    mvn r3, r5
    movls r3, ip
    subls r0, r0, lr
    subls r2, r2, lr
    bls .L_b0
    and r2, r1, r5
    mla r5, lr, r2, r9
    and r2, r0, r8
    and r1, r1, r3
    add r2, r5, r2, lsl r4
    mvn r3, r8
    add r1, r2, r1, lsl r6
    and r0, r0, r3
    add sp, sp, #0x4
    add r0, r1, r0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b0:
    cmp r2, #0x8
    movlt r4, r2
    movge r5, sl
    clzlt r4, r4
    rsblt r5, r4, #0x1f
    cmp r3, #0x8
    movge r4, sl
    movlt r4, r3
    clzlt r4, r4
    rsblt r4, r4, #0x1f
    add r4, fp, r4, lsl #0x3
    add r6, r4, r5, lsl #0x1
    ldrb r5, [r4, r5, lsl #0x1]
    ldrb r4, [r6, #0x1]
    str r5, [sp, #0x28]
    str r4, [sp, #0x2c]
    b .L_18
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020bede8
