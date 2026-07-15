; func_0201c498 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b59e0
        .extern func_02009758
        .extern func_020097a4
        .extern func_020195b8
        .global func_0201c498
        .arm
func_0201c498:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    mov r0, #0xb
    bl func_020097a4
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, _LIT0
    add r3, sp, #0x0
    mov r2, #0x6
.L_28:
    ldrb r1, [r4]
    ldrb r0, [r4, #0x1]
    add r4, r4, #0x2
    strb r1, [r3]
    strb r0, [r3, #0x1]
    add r3, r3, #0x2
    subs r2, r2, #0x1
    bne .L_28
    ldrb r0, [r4]
    mov r8, #0x0
    add sl, sp, #0x0
    strb r0, [r3]
    mov r7, #0x2
    mov r5, r8
    mov fp, #0x1
.L_64:
    ldrb r9, [sl]
    mov r1, r7
    mov r0, r9
    bl func_020195b8
    mov r6, r0
    mov r0, r9
    mov r1, r5
    bl func_020195b8
    mov r4, r0
    mov r0, r9
    mov r1, fp
    bl func_020195b8
    add r0, r4, r0
    adds r0, r6, r0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r8, r8, #0x1
    cmp r8, #0xd
    add sl, sl, #0x1
    bcc .L_64
    mov r0, #0xb
    bl func_02009758
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020b59e0+0x54
